from flask_wtf import FlaskForm
from wtforms import PasswordField, EmailField, TelField, SelectField, StringField, SubmitField, HiddenField
from wtforms.validators import DataRequired, EqualTo, Email, Length
from .models import User, Address, Role, Book, Author, BookAuthor, Genre, BookGenre, Language, BookLanguage, Publisher
from wtforms_sqlalchemy.fields import QuerySelectField


class RegisterForm(FlaskForm):
    people_name = StringField('Имя', validators=[DataRequired()])
    people_surname = StringField('Фамилия', validators=[DataRequired()])
    people_patronymic = StringField('Отчество', validators=[DataRequired()])
    people_sex = SelectField(choices=[('', 'Пол'), (True, 'Мужской'), (False, 'Женский')], validators=[DataRequired()])
    people_address = StringField('Адрес', validators=[DataRequired()])
    people_tel_num = TelField('Номер телефона', validators=[DataRequired()])
    people_pass_num = StringField('Номер паспорта', validators=[DataRequired()])
    people_email = EmailField('Email', validators=[DataRequired()])
    people_password = PasswordField('Пароль', validators=[DataRequired()])
    people_role = 1
    submit = SubmitField('Зарегистрироваться')


class LoginForm(FlaskForm):
    people_email = EmailField('Email', validators=[DataRequired()])
    people_password = PasswordField('Пароль', validators=[DataRequired()])
    submit = SubmitField('Войти')


class BookSearchForm(FlaskForm):
    author = QuerySelectField(query_factory=lambda: Author.query.order_by(Author.name).all()
                              , get_label="name", allow_blank=True,
                              blank_text='Автор')
    genre = QuerySelectField(query_factory=lambda: Genre.query.order_by(Genre.title).all(), get_label="title",
                             allow_blank=True,
                             blank_text='Жанр')
    language = QuerySelectField(query_factory=lambda: Language.query.order_by(Language.title).all(), get_label="title",
                                allow_blank=True,
                                blank_text='Язык')
    publisher = QuerySelectField(query_factory=lambda: Publisher.query.order_by(Publisher.title).all(),
                                 get_label="title", allow_blank=True,
                                 blank_text='Издательство')
    rating_bottom = StringField('Рейтинг от')
    rating_top = StringField('Рейтинг до')
    search = StringField('Поиск')
    submit = SubmitField('Поиск по фильтру')


class UserForm(FlaskForm):
    people_name = StringField('Имя', validators=[DataRequired()])
    people_surname = StringField('Фамилия', validators=[DataRequired()])
    people_patronymic = StringField('Отчество', validators=[DataRequired()])
    people_sex = SelectField(choices=[('', 'Пол'), (True, 'Мужской'), (False, 'Женский')], validators=[DataRequired()])
    people_address = QuerySelectField(query_factory=lambda: Address.query.order_by(Address.id).all(), get_label="title",
                                      allow_blank=True,
                                      blank_text='Адрес')
    people_tel_num = TelField('Номер телефона', validators=[DataRequired()])
    people_pass_num = StringField('Номер паспорта', validators=[DataRequired()])
    people_email = EmailField('Email', validators=[DataRequired()])
    people_password = PasswordField('Пароль', validators=[DataRequired()])
    people_role = QuerySelectField(query_factory=lambda: Role.query.order_by(Role.title).all(), get_label="title",
                                   allow_blank=True,
                                   blank_text='Роль')
    submit = SubmitField('Добавить пользователя')


class RoleForm(FlaskForm):
    title = StringField('Название роли', validators=[DataRequired()])
    submit = SubmitField('Добавить роль')


class BookForm(FlaskForm):
    book_title = StringField('Название книги', validators=[DataRequired()])
    book_desc = StringField('Описание книги', validators=[DataRequired()])
    book_author = QuerySelectField(query_factory=lambda: Author.query.order_by(Author.name).all()
                                   , get_label="name", allow_blank=True,
                                   blank_text='Автор')
    book_genre = QuerySelectField(query_factory=lambda: Genre.query.order_by(Genre.title).all(), get_label="title",
                                  allow_blank=True,
                                  blank_text='Жанр')
    book_language = QuerySelectField(query_factory=lambda: Language.query.order_by(Language.title).all(),
                                     get_label="title",
                                     allow_blank=True,
                                     blank_text='Язык')
    book_publisher = QuerySelectField(query_factory=lambda: Publisher.query.order_by(Publisher.title).all()
                                      , get_label="title", allow_blank=True,
                                      blank_text='Издательство')
    book_publish_year = StringField('Год издания', validators=[DataRequired()])
    book_publish_month = StringField('Месяц издания', validators=[DataRequired()])
    book_publish_day = StringField('День издания', validators=[DataRequired()])
    book_page_num = StringField('Количество страниц', validators=[DataRequired()])
    book_rating = StringField('Рейтинг', validators=[DataRequired()])
    book_num_reviews = StringField('Количество отзывов', validators=[DataRequired()])
    submit = SubmitField('Добавить книгу')


class AuthorForm(FlaskForm):
    author_name = StringField('Автор', validators=[DataRequired()])
    author_sex = SelectField(choices=[(None, 'Пол'), (True, 'Мужской'), (False, 'Женский')],
                             validators=[DataRequired()])
    submit = SubmitField('Добавить автора')


class GenreForm(FlaskForm):
    genre_title = StringField('Жанр', validators=[DataRequired()])
    submit = SubmitField('Добавить жанр')


class LanguageForm(FlaskForm):
    lang_title = StringField('Язык', validators=[DataRequired()])
    submit = SubmitField('Добавить язык')


class PublisherForm(FlaskForm):
    publisher_title = StringField('Название издания', validators=[DataRequired()])
    publisher_desc = StringField('Описание издания', validators=[DataRequired()])
    submit = SubmitField('Добавить издателя')


# Change
class ChangeForm(FlaskForm):
    change_table = HiddenField("Hidden table name")
    change_id = HiddenField("Hidden table row ID")
    change = SubmitField("Изменить")


# Delete
class DeleteForm(FlaskForm):
    delete_table = HiddenField("Hidden table name")
    delete_id = HiddenField("Hidden table row ID")
    delete = SubmitField("Удалить")
