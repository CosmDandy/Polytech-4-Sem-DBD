from . import db
import psycopg2
from flask_login import UserMixin


class User(UserMixin, db.Model):
    __tablename__ = 'people'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('people_id', db.Integer, nullable=False, primary_key=True)
    name = db.Column('people_name', db.String(100), nullable=False)
    surname = db.Column('people_surname', db.String(100), nullable=False)
    patronymic = db.Column('people_patronymic', db.String(100), nullable=False)
    sex = db.Column('people_sex', db.Boolean, nullable=False)
    address = db.Column('people_address', db.Integer, nullable=False)
    tel_num = db.Column('people_tel_num', db.Integer, nullable=False)
    pass_num = db.Column('people_pass_num', db.Integer, nullable=False)
    email = db.Column('people_email', db.String(100), nullable=False)
    password = db.Column('people_password', db.String(100), nullable=False)
    role = db.Column('people_role', db.Integer, nullable=False)


class Address(db.Model):
    __tablename__ = 'address'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('address_id', db.Integer, nullable=False, primary_key=True)
    title = db.Column('address_title', db.String(100), nullable=False)
    postcode = db.Column('address_postcode', db.String(100), nullable=False)
    latitude = db.Column('address_latitude', db.Float, nullable=False)
    longitude = db.Column('address_longitude', db.Float, nullable=False)


class Role(db.Model):
    __tablename__ = 'role'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('role_id', db.Integer, nullable=False, primary_key=True)
    title = db.Column('role_title', db.String(100), nullable=False)


class Book(db.Model):
    __tablename__ = 'book'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('book_id', db.Integer, nullable=False, primary_key=True)
    title = db.Column('book_title', db.String(100), nullable=False)
    publisher = db.Column('book_publisher', db.Integer, nullable=False)
    year = db.Column('book_publish_year', db.Integer, nullable=False)
    month = db.Column('book_publish_month', db.Integer, nullable=False)
    day = db.Column('book_publish_day', db.Integer, nullable=False)
    page_num = db.Column('book_page_num', db.Integer, nullable=False)
    rating = db.Column('book_rating', db.Integer, nullable=False)
    reviews = db.Column('book_num_reviews', db.Integer, nullable=False)


class Author(db.Model):
    __tablename__ = 'book_author'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('author_id', db.Integer, nullable=False, primary_key=True)
    name = db.Column('author_name', db.String(100), nullable=False)
    sex = db.Column('author_sex', db.Boolean, nullable=False)


class BookAuthor(db.Model):
    __tablename__ = 'book_book_author'
    __table_args__ = {'schema': 'lib_schema'}
    book_book_id = db.Column("book_book_id", db.ForeignKey(Book.id, ondelete='CASCADE'), primary_key=True)
    book_author_author_id = db.Column("book_author_author_id", db.ForeignKey(Author.id, ondelete='CASCADE'),
                                      primary_key=True)


class Genre(db.Model):
    __tablename__ = 'book_genre'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('genre_id', db.Integer, nullable=False, primary_key=True)
    title = db.Column('genre_title', db.String(100), nullable=False)


class BookGenre(db.Model):
    __tablename__ = 'book_book_genre'
    __table_args__ = {'schema': 'lib_schema'}
    book_id = db.Column('book_book_id', db.ForeignKey(Book.id, ondelete='CASCADE'), primary_key=True)
    genre_id = db.Column('book_genre_genre_id', db.ForeignKey(Genre.id, ondelete='CASCADE'), primary_key=True)


class Language(db.Model):
    __tablename__ = 'book_lang'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('lang_id', db.Integer, nullable=False, primary_key=True)
    title = db.Column('lang_title', db.String(100), nullable=False)


class BookLanguage(db.Model):
    __tablename__ = 'book_book_lang'
    __table_args__ = {'schema': 'lib_schema'}
    book_id = db.Column('book_book_id', db.ForeignKey(Book.id, ondelete='CASCADE'), primary_key=True)
    lang_id = db.Column('book_lang_lang_id', db.ForeignKey(Language.id, ondelete='CASCADE'), primary_key=True)


class Publisher(db.Model):
    __tablename__ = 'book_publisher'
    __table_args__ = {'schema': 'lib_schema'}
    id = db.Column('publisher_id', db.Integer, nullable=False, primary_key=True)
    title = db.Column('publisher_title', db.String(100), nullable=False)
    desc = db.Column('publisher_desc', db.String(100), nullable=False)


class Database:
    def __init__(
            self,
            host='postgres',
            port=5432,
            database='library',
            user='admin',
            password='admin'
    ):
        self.host = host
        self.port = port
        self.database = database
        self.user = user
        self.password = password

    def connect(self):
        self.conn = psycopg2.connect(
            host=self.host,
            port=self.port,
            database=self.database,
            user=self.user,
            password=self.password)
        self.cursor = self.conn.cursor()

    def close(self):
        self.cursor.close()
        self.conn.close()

    def execute(self, query):
        self.cursor.execute(query)

    def fetchall(self):
        return self.cursor.fetchall()

    def commit(self):
        self.conn.commit()
