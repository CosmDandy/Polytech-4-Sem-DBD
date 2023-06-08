import logging
import random

from flask import Blueprint, render_template
from flask_login import login_required
from sqlalchemy import desc, func, or_

from . import db
from .forms import BookSearchForm, BookForm, UserForm
from .models import Book, Author, Genre, Language, Publisher, BookAuthor, BookGenre, BookLanguage

main = Blueprint('main', __name__)


@main.route('/')
def intro():
    return render_template("intro.html")


@main.route('/books', methods=['GET', 'POST'])
@main.route('/books/<int:page>', methods=['GET', 'POST'])
@login_required
def books(page=1):
    per_page = 12
    offset = (page - 1) * per_page

    logging.info(f'Page: {page}')
    logging.info(f'Offset: {offset}')

    deg = [random.randint(0, 360) for _ in range(per_page)]
    color1 = [f"#{random.randint(0, 0xFFFFFF):06x}" for _ in range(per_page)]
    color2 = [f"#{random.randint(0, 0xFFFFFF):06x}" for _ in range(per_page)]

    book_list = db.session.query(
        Book.id, Book.title, Book.rating, Book.reviews, Book.year, Book.month, Book.day, Book.page_num,
        func.array_agg(func.distinct(Author.name)).label('authors'),
        func.array_agg(func.distinct(Genre.title)).label('genres'),
        func.array_agg(func.distinct(Language.title)).label('languages'),
        Publisher.title,
        Publisher.desc
    ) \
        .join(BookAuthor, BookAuthor.book_book_id == Book.id) \
        .join(Author, Author.id == BookAuthor.book_author_author_id) \
        .join(BookGenre, BookGenre.book_id == Book.id) \
        .join(Genre, Genre.id == BookGenre.genre_id) \
        .join(BookLanguage, BookLanguage.book_id == Book.id) \
        .join(Language, Language.id == BookLanguage.lang_id) \
        .join(Publisher, Book.publisher == Publisher.id)

    form = BookSearchForm()
    if form.validate_on_submit():
        logging.info(form.data)
        if form.author.data:
            author_ids = db.session.query(BookAuthor.book_book_id) \
                .select_from(Author) \
                .join(BookAuthor, BookAuthor.book_author_author_id == Author.id) \
                .filter(Author.id == form.author.data.id)
            book_list = book_list.filter(Book.id.in_(author_ids))
        if form.genre.data:
            genre_ids = db.session.query(BookGenre.book_id) \
                .select_from(Genre) \
                .join(BookGenre, BookGenre.genre_id == Genre.id) \
                .filter(Genre.id == form.genre.data.id)
            book_list = book_list.filter(Book.id.in_(genre_ids))
        if form.language.data:
            language_ids = db.session.query(BookLanguage.book_id) \
                .select_from(Genre) \
                .join(BookLanguage, BookLanguage.lang_id == Language.id) \
                .filter(Language.id == form.language.data.id)
            book_list = book_list.filter(Book.id.in_(language_ids))
        if form.publisher.data:
            book_list = book_list.filter(Book.publisher == form.publisher.data.id)
        if form.rating_bottom.data:
            book_list = book_list.filter(
                or_(Book.rating > int(form.rating_bottom.data), Book.rating == int(form.rating_bottom.data))).order_by(
                Book.rating)
        if form.rating_top.data:
            book_list = book_list.filter(
                or_(Book.rating < int(form.rating_top.data), Book.rating == int(form.rating_top.data))).order_by(
                desc(Book.rating))
        if form.search.data:
            book_list = book_list.filter(Book.title.like(f"%{form.search.data}%"))

    book_list_count = book_list.group_by(Book.id, Publisher.title, Publisher.desc).count() / per_page
    logging.info(f'Pages count: {book_list_count}')

    book_list = book_list.group_by(Book.id, Publisher.title, Publisher.desc).offset(offset).limit(
        per_page)

    return render_template("books.html", book_list=book_list, form=form, curennt_page=page,
                           last_page=round(book_list_count),
                           deg=deg, color1=color1, color2=color2)


@main.route('/books/book/<int:book_id>', methods=['GET', 'POST'])
@login_required
def book(book_id):
    current_book = db.session.query(
        Book.id, Book.title, Book.desc, Book.rating, Book.reviews, Book.year, Book.month, Book.day, Book.page_num,
        func.array_agg(func.distinct(Author.name)),
        func.array_agg(func.distinct(Genre.title)),
        func.array_agg(func.distinct(Language.title)),
        Publisher.title,
        Publisher.desc
    ) \
        .join(BookAuthor, BookAuthor.book_book_id == Book.id) \
        .join(Author, Author.id == BookAuthor.book_author_author_id) \
        .join(BookGenre, BookGenre.book_id == Book.id) \
        .join(Genre, Genre.id == BookGenre.genre_id) \
        .join(BookLanguage, BookLanguage.book_id == Book.id) \
        .join(Language, Language.id == BookLanguage.lang_id) \
        .join(Publisher, Book.publisher == Publisher.id) \
        .group_by(Book.id, Publisher.title, Publisher.desc) \
        .filter(Book.id == book_id).first()

    logging.info(current_book)
    return str(book_id)
    # return render_template("book.html", book=book)


@main.route('/account')
@login_required
def account():
    return render_template("account.html")


@main.route('/admin')
@login_required
def admin():
    return render_template("admin.html")


@main.route('/admin/users', methods=['POST'])
@login_required
def admin_users():
    form = UserForm()
    return render_template("admin_users.html", form=form)


@main.route('/admin/roles', methods=['POST'])
@login_required
def admin_roles():
    return render_template("admin_roles.html")


@main.route('/admin/books', methods=['POST'])
@login_required
def admin_books():
    form = BookForm()
    # delete_form = DeleteForm()
    # if delete_form.validate_on_submit():
    #     try:
    #         delete(delete_form.delete_table.data, delete_form.delete_id.data)
    #     except Exception as e:
    #         flash(f'{e}')
    #     return redirect('/admin/PeopleType')
    return render_template("admin_books.html", form=form)


@main.route('/admin/authors', methods=['POST'])
@login_required
def admin_authors():
    return render_template("admin_authors.html")


@main.route('/admin/genres', methods=['POST'])
@login_required
def admin_genres():
    return render_template("admin_genres.html")


@main.route('/admin/languages', methods=['POST'])
@login_required
def admin_languages():
    return render_template("admin_languages.html")


@main.route('/admin/publishers', methods=['POST'])
@login_required
def admin_publishers():
    return render_template("admin_publishers.html")
