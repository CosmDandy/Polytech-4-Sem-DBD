import logging

import pandas as pd
from flask import Blueprint, render_template
from flask_login import login_required

from . import db
from .models import Database, Book, Author, Genre, Language, Publisher

main = Blueprint('main', __name__)


@main.route('/')
def intro():
    return render_template("intro.html")


@main.route('/books')
@login_required
def books():
    book_list = db.session.query(Book, Author.title, Genre.title, Language.title, Publisher.title) \
        .join(Author, Book.author == Author.id) \
        .join(Genre, Book.genre == Genre.id) \
        .join(Language, Book.lang == Language.id) \
        .join(Publisher, Book.publisher == Publisher.id) \
        .all()
    logging.info(book_list)
    return render_template("books.html")


@main.route('/account')
@login_required
def account():
    return render_template("account.html")


@main.route('/admin')
@login_required
def admin():
    return render_template("admin.html")
