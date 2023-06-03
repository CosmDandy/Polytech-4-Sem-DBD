import logging

import pandas as pd
from flask import Blueprint, render_template, request
from flask_login import login_required

from . import db
from .models import Database, Book, Author, Genre, Language, Publisher, BookAuthor, BookGenre, BookLanguage

main = Blueprint('main', __name__)


@main.route('/')
def intro():
    return render_template("intro.html")


@main.route('/books', methods=['GET', 'POST'])
@main.route('/books/<int:page>', methods=['GET', 'POST'])
# @login_required
def books(page=1):
    # page = request.args.get('page', default=1, type=int)
    per_page = 20
    offset = (page - 1) * per_page
    book_list = db.session.query(Book, Author, Genre, Language, Publisher) \
        .join(BookAuthor, BookAuthor.book_book_id == Book.id) \
        .join(Author, Author.id == BookAuthor.book_author_author_id) \
        .offset(offset).limit(per_page).all()
        # .join(BookGenre, BookGenre.book_id == Book.id) \
        # .join(Genre, Genre.id == BookGenre.genre_id) \
        # .join(BookLanguage, BookLanguage.book_id == Book.id) \
        # .join(Language, Language.id == BookLanguage.lang_id) \
        # .join(Publisher, Book.publisher == Publisher.id) \
        # .all()
    logging.info(f'Page: {page}')
    logging.info(f'Offset: {offset}')
    logging.info(book_list)
    return render_template("books.html", book_list=book_list, curennt_page=page)


@main.route('/account')
@login_required
def account():
    return render_template("account.html")


@main.route('/admin')
@login_required
def admin():
    return render_template("admin.html")
