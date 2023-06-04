import logging
import random

import pandas as pd
from flask import Blueprint, render_template, request
from flask_login import login_required
from sqlalchemy import desc, asc, func, literal_column
from sqlalchemy.dialects.postgresql import aggregate_order_by

from . import db
from .forms import BookSearchForm
from .models import Database, Book, Author, Genre, Language, Publisher, BookAuthor, BookGenre, BookLanguage

main = Blueprint('main', __name__)


@main.route('/')
def intro():
    return render_template("intro.html")


@main.route('/books', methods=['GET', 'POST'])
@main.route('/books/<int:page>', methods=['GET', 'POST'])
# @login_required
def books(page=1):
    per_page = 12
    offset = (page - 1) * per_page

    deg = [random.randint(0, 360) for i in range(per_page)]
    color1 = [f"#{random.randint(0, 0xFFFFFF):06x}" for i in range(per_page)]
    color2 = [f"#{random.randint(0, 0xFFFFFF):06x}" for i in range(per_page)]

    book_list = db.session.query(
        Book.id, Book.title, Book.rating, Book.reviews, Book.year, Book.month, Book.day, Book.page_num,
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
        .order_by(Book.id).offset(offset).limit(per_page).all()

    book_list_count = db.session.query(
        Book.id, Book.title, Book.rating, Book.reviews, Book.year, Book.month, Book.day, Book.page_num,
        func.array_agg(func.distinct(Author.name)),
        func.array_agg(func.distinct(Genre.title)),
        func.array_agg(func.distinct(Language.title)),
        Publisher.title,
        Publisher.desc
    ).join(BookAuthor, BookAuthor.book_book_id == Book.id) \
                          .join(Author, Author.id == BookAuthor.book_author_author_id) \
                          .join(BookGenre, BookGenre.book_id == Book.id) \
                          .join(Genre, Genre.id == BookGenre.genre_id) \
                          .join(BookLanguage, BookLanguage.book_id == Book.id) \
                          .join(Language, Language.id == BookLanguage.lang_id) \
                          .join(Publisher, Book.publisher == Publisher.id) \
                          .group_by(Book.id, Publisher.title, Publisher.desc) \
                          .order_by(Book.id).count() / per_page

    logging.info(f'Page: {page}')
    logging.info(f'Pages count: {book_list_count}')
    logging.info(f'Offset: {offset}')
    logging.info(book_list)

    form = BookSearchForm()

    return render_template("books.html", book_list=book_list, form=form, curennt_page=page, last_page=round(book_list_count),
                           deg=deg, color1=color1, color2=color2)


@main.route('/books/book/<int:book_id>', methods=['GET', 'POST'])
# @login_required
def book(book_id):
    book = db.session.query(
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

    logging.info(book)
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
