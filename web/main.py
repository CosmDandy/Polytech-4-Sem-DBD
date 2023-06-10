import logging
import random

from flask import Blueprint, render_template, flash, redirect
from flask_login import login_required, current_user
from sqlalchemy import desc, func, or_
from werkzeug.security import generate_password_hash

from . import db
from .forms import BookSearchForm, BookForm, UserForm, DeleteForm, ChangeForm, RoleForm, AuthorForm, LanguageForm, \
    GenreForm, PublisherForm, AccountLoginForm, AccountPasswordForm, BookAuthorForm
from .models import Book, Author, Genre, Language, Publisher, BookAuthor, BookGenre, BookLanguage, User, Role, Address

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
    return render_template("book.html", book=current_book)


@main.route('/account', methods=['GET', 'POST'])
@login_required
def account():
    email_form = AccountLoginForm()
    if email_form.validate_on_submit():
        User.query.filter_by(id=current_user.id).update({'email': email_form.email.data})
        db.session.commit()

    password_form = AccountPasswordForm()
    if password_form.validate_on_submit():
        if password_form.password.data == password_form.password_confirm.data:
            User.query.filter_by(id=current_user.id).update(
                {'password': generate_password_hash(password_form.password.data, method='sha256')})
            db.session.commit()
    return render_template("account.html", email_form=email_form, password_form=password_form)


# def change(table_name, id):
#     if table_name == 'User':
#         User.query.filter_by(id=id).delete()
#     elif table_name == 'Role':
#         Role.query.filter_by(id=id).delete()
#     elif table_name == 'Address':
#         Address.query.filter_by(id=id).delete()
#     elif table_name == 'Book':
#         Book.query.filter_by(id=id).delete()
#     elif table_name == 'Publisher':
#         Publisher.query.filter_by(id=id).delete()
#     # elif table_name == 'Country':
#     #     Country.query.filter_by(id=id).delete()
#     # elif table_name == 'Company':
#     #     Company.query.filter_by(id=id).delete()
#     db.session.commit()


def delete(table_name, id):
    if table_name == 'user':
        User.query.filter_by(id=id).delete()
    elif table_name == 'role':
        Role.query.filter_by(id=id).delete()
    elif table_name == 'address':
        Address.query.filter_by(id=id).delete()
    elif table_name == 'book':
        Book.query.filter_by(id=id).delete()
    elif table_name == 'publisher':
        Publisher.query.filter_by(id=id).delete()
    elif table_name == 'language':
        Language.query.filter_by(id=id).delete()
    elif table_name == 'genre':
        Genre.query.filter_by(id=id).delete()
    elif table_name == 'author':
        Author.query.filter_by(id=id).delete()
    db.session.commit()


@main.route('/admin')
@login_required
def admin():
    return render_template("admin.html")


@main.route('/admin/users', methods=['GET', 'POST'])
@login_required
def admin_users():
    users_list = db.session.query(
        User.id, User.name, User.surname, User.patronymic, User.sex, Address.title.label('address'), User.tel_num,
        User.pass_num, User.email, Role.title.label('role')) \
        .join(Role, Role.id == User.role) \
        .join(Address, Address.id == User.address) \
        .all()

    form = UserForm()
    if form.validate_on_submit():
        logging.info("User form validated")
        new_row = User(
            name=form.people_name.data,
            surname=form.people_surname.data,
            patronymic=form.people_patronymic.data,
            sex=True if form.people_sex.data == "True" else False,
            address=form.people_address.data.id,
            tel_num=form.people_tel_num.data,
            pass_num=form.people_pass_num.data,
            email=form.people_email.data,
            password=generate_password_hash(form.people_password.data, method='sha256'),
            role=form.people_role.data.id
        )
        db.session.add(new_row)
        db.session.commit()
        return redirect('/admin/users')

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/users')

    change_form = ChangeForm()
    return render_template("admin_users.html", form=form, users_list=users_list,
                           delete_form=delete_form)


@main.route('/admin/roles', methods=['GET', 'POST'])
@login_required
def admin_roles():
    roles_list = Role.query.all()
    form = RoleForm()
    if form.validate_on_submit():
        new_row = Role(
            title=form.title.data,
        )
        db.session.add(new_row)
        db.session.commit()
        return redirect('/admin/roles')

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/roles')
    return render_template("admin_roles.html", form=form, roles_list=roles_list, delete_form=delete_form)


@main.route('/admin/books', methods=['GET', 'POST'])
@login_required
def admin_books():
    books_list = db.session.query(
        Book.id, Book.title, Book.desc, Book.reviews, func.array_agg(func.distinct(Author.name)).label('author'),
        func.array_agg(func.distinct(Genre.title)).label('genre'),
        func.array_agg(func.distinct(Language.title)).label('language'), Publisher.title,
        Book.year, Book.month, Book.day, Book.page_num, Book.rating, Book.page_num, Book.reviews,
        Publisher.title.label('publisher')) \
        .join(BookAuthor, BookAuthor.book_book_id == Book.id) \
        .join(Author, Author.id == BookAuthor.book_author_author_id) \
        .join(BookGenre, BookGenre.book_id == Book.id) \
        .join(Genre, Genre.id == BookGenre.genre_id) \
        .join(BookLanguage, BookLanguage.book_id == Book.id) \
        .join(Language, Language.id == BookLanguage.lang_id) \
        .join(Publisher, Book.publisher == Publisher.id) \
        .group_by(Book.id, Publisher.title, Publisher.desc) \
        .all()
    form = BookForm()

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/books')
    return render_template("admin_books.html", form=form, books_list=books_list, delete_form=delete_form)


@main.route('/admin/authors', methods=['GET', 'POST'])
@login_required
def admin_authors():
    authors_list = Author.query.all()
    form = AuthorForm()
    if form.validate_on_submit():
        new_row = Author(
            name=form.author_name.data,
            sex=True if form.author_sex.data else False
        )
        db.session.add(new_row)
        db.session.commit()
        return redirect('/admin/authors')

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/authors')
    return render_template("admin_authors.html", authors_list=authors_list, form=form, delete_form=delete_form)


@main.route('/admin/book_to_authors', methods=['GET', 'POST'])
@login_required
def book_to_authors():
    book_to_authors_list = BookAuthor.query.limit(100)
    form = BookAuthorForm()
    if form.validate_on_submit():
        new_row = BookAuthor(
            book_book_id=form.book_id.data.id,
            book_author_author_id=form.author_id.data.id
        )
        db.session.add(new_row)
        db.session.commit()
        return redirect('/admin/book_to_authors')

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/book_to_authors')
    return render_template("book_to_authors.html", book_to_authors_list=book_to_authors_list, form=form,
                           delete_form=delete_form)


@main.route('/admin/genres', methods=['GET', 'POST'])
@login_required
def admin_genres():
    genre_list = Genre.query.all()
    form = GenreForm()
    if form.validate_on_submit():
        new_row = Genre(
            title=form.genre_title.data
        )
        db.session.add(new_row)
        db.session.commit()
        return redirect('/admin/genres')

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/genres')
    return render_template("admin_genres.html", genre_list=genre_list, form=form, delete_form=delete_form)


@main.route('/admin/languages', methods=['GET', 'POST'])
@login_required
def admin_languages():
    language_list = Language.query.all()
    form = LanguageForm()
    if form.validate_on_submit():
        new_row = Language(
            title=form.lang_title.data
        )
        db.session.add(new_row)
        db.session.commit()
        return redirect('/admin/languages')

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/languages')
    return render_template("admin_languages.html", language_list=language_list, form=form, delete_form=delete_form)


@main.route('/admin/publishers', methods=['GET', 'POST'])
@login_required
def admin_publishers():
    publishers_list = Publisher.query.all()
    form = PublisherForm()
    if form.validate_on_submit():
        new_row = Publisher(
            title=form.publisher_title.data,
            desc=form.publisher_desc.data
        )
        db.session.add(new_row)
        db.session.commit()
        return redirect('/admin/publishers')

    delete_form = DeleteForm()
    if delete_form.validate_on_submit():
        try:
            delete(delete_form.delete_table.data, delete_form.delete_id.data)
        except Exception as e:
            flash(f'{e}')
        return redirect('/admin/publishers')
    return render_template("admin_publishers.html", publishers_list=publishers_list, form=form, delete_form=delete_form)
