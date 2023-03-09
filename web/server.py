import random
import logging
from flask import Flask, render_template, url_for, flash, redirect
from flask_login import UserMixin
from flask_wtf import FlaskForm
from wtforms import PasswordField, EmailField, TelField, SelectField, StringField, SubmitField
from wtforms.validators import DataRequired, EqualTo, Email, Length

import psycopg2
import pandas as pd
import os


# Classes
class User(UserMixin):
    def __init__(self, user_id=None, user_name=None, user_surname=None, user_email=None, user_password=None,
                 user_role=None):
        self.user_id = user_id
        self.user_name = user_name
        self.user_surname = user_surname
        self.user_email = user_email
        self.user_password = user_password
        self.user_role = user_role
        # self.user_id = db.Column(db.Integer(), nullable=False, unique=True, primary_key=True, autoincrement=True)
        # self.user_name = db.Column(db.String())
        # self.user_surname = db.Column(db.String())
        # self.user_email = db.Column(db.String())
        # self.user_password = db.Column(db.String())
        # self.user_role = db.Column(db.Integer())

    def is_authenticated(self):
        return True

    def is_active(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return str(self.user_id)

    def get_name(self):
        return str(self.user_name)

    def get_surname(self):
        return str(self.user_surname)

    def get_email(self):
        return str(self.user_email)

    def get_password(self):
        return str(self.user_password)

    def get_role(self):
        return self.user_role

    def set_id(self, user_id: int):
        self.user_id = user_id

    def set_name(self, user_name: str):
        self.user_name = user_name

    def set_surname(self, user_surname: str):
        self.user_surname = user_surname

    def set_email(self, user_email: str):
        self.user_email = user_email

    def set_password(self, user_password: str):
        self.user_password = user_password

    def set_role(self, user_role: int):
        self.user_role = user_role


class RegisterForm(FlaskForm):
    people_name = StringField('Имя', validators=[DataRequired()])
    people_surname = StringField('Фамилия', validators=[DataRequired()])
    people_patronymic = StringField('Отчество', validators=[DataRequired()])
    people_sex = SelectField(choices=[('', 'Пол'), ('1', 'Мужской'), ('2', 'Женский')], validators=[DataRequired()])
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


# Create app
app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get('SECRET_KEY') or 'you-will-never-guess'
logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")


# Urls
def connect_to_db():
    global conn, cursor
    conn = psycopg2.connect(
        host="postgres",
        port="5432",
        database="library",
        user='admin',
        password='admin')
    cursor = conn.cursor()


@app.route('/')
@app.route('/intro')
def intro():
    return render_template("intro.html")


@app.route('/register', methods=['GET', 'POST'])
def register():
    register_form = RegisterForm()
    if register_form.validate_on_submit():
        connect_to_db()
        cursor.execute(
            f"INSERT INTO lib_schema.address(address_title, address_postcode, address_latitude, address_longitude) VALUES ('{register_form.people_address.data}', '{random.randint(1, 200000)}', {random.randint(0, 180)}, {random.randint(0, 180)}) RETURNING address_id;")
        people_address_id = int(str(cursor.fetchall()[0])[1:-2])
        cursor.execute(
            f"INSERT INTO lib_schema.people(people_name, people_surname, people_patronymic, people_sex, people_address,people_tel_num, people_pass_num, people_email, people_password, people_role) VALUES ('{register_form.people_name.data}', '{register_form.people_surname.data}', '{register_form.people_patronymic.data}', {register_form.people_sex.data}, {people_address_id},{register_form.people_tel_num.data}, {register_form.people_pass_num.data}, '{register_form.people_email.data}', '{register_form.people_password.data}', {register_form.people_role});")
        conn.commit()
        return redirect('/main')
    return render_template("register.html", form=register_form)


@app.route('/login', methods=['GET', 'POST'])
def login():
    login_form = LoginForm()
    if login_form.validate_on_submit():
        connect_to_db()
        cursor.execute(
            f"SELECT people_id, people_email, people_password FROM lib_schema.people WHERE people_email='{login_form.people_email.data}';")
        query = cursor.fetchall()
        if len(query) != 0:
            user_data = query[0]
            if login_form.people_password.data == user_data[2]:
                logging.info(
                    f"Login successful, Email: {login_form.people_email.data}, Password: {login_form.people_password.data}")
                return redirect('/main')
            else:
                logging.warning(
                    f"Incorrect login Password, input: {login_form.people_password.data}, correct input: {user_data[2]}")
        else:
            logging.warning("Incorrect login Email")
    return render_template("login.html", form=login_form)


@app.route('/main')
def main():
    connect_to_db()
    cursor.execute(
        "SELECT * FROM lib_schema.book JOIN lib_schema.book_author ba on book.book_author = ba.author_id JOIN lib_schema.book_genre bg on book.book_genre = bg.genre_id JOIN lib_schema.book_lang bl on book.book_lang = bl.lang_id JOIN lib_schema.book_publisher bp on book.book_publisher = bp.publisher_id;")
    book_list = pd.DataFrame(cursor.fetchall()).drop([0, 2, 3, 4, 5, 12, 14, 15, 17, 19], axis=1)
    return render_template("main.html", book_list=book_list.values.tolist())


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)
