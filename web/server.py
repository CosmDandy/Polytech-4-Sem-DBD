from flask import Flask, render_template, url_for, flash, redirect
from flask_wtf import FlaskForm
from wtforms import PasswordField, EmailField, TextAreaField, TelField, SelectField, StringField, SubmitField
from wtforms.validators import DataRequired, EqualTo, Email, Length

import psycopg2
import pandas as pd
import os
from config import Config


class Config(object):
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'you-will-never-guess'


app = Flask(__name__)
app.config.from_object(Config)

conn = psycopg2.connect(
    host="localhost",
    port="5432",
    database="library",
    user='admin',
    password='admin')
cur = conn.cursor()


@app.route('/intro')
def intro():
    return render_template("intro.html")


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


def login_check():
    pass


@app.route('/register', methods=['GET', 'POST'])
def register():
    register_form = RegisterForm()
    if register_form.validate_on_submit():
        print(
            f"INSERT INTO lib_schema.people(people_name, people_surname, people_patronymic, people_sex, people_address,people_tel_num, people_pass_num, people_email, people_password, people_role) VALUES ('{register_form.people_name.data}', '{register_form.people_surname.data}', '{register_form.people_patronymic.data}', {register_form.people_sex.data}, '{register_form.people_address.data}','{register_form.people_tel_num.data}', '{register_form.people_pass_num.data}', '{register_form.people_email.data}', '{register_form.people_password.data}', {register_form.people_role});")
        return redirect('/main')
    return render_template("register.html", form=register_form)


@app.route('/login')
def login():
    return render_template("login.html")


@app.route('/main')
def main():
    cur.execute(
        "SELECT * FROM lib_schema.book JOIN lib_schema.book_author ba on book.book_author = ba.author_id JOIN lib_schema.book_genre bg on book.book_genre = bg.genre_id JOIN lib_schema.book_lang bl on book.book_lang = bl.lang_id JOIN lib_schema.book_publisher bp on book.book_publisher = bp.publisher_id;")
    book_list = pd.DataFrame(cur.fetchall()).drop([0, 2, 3, 4, 5, 12, 14, 15, 17, 19], axis=1)
    return render_template("main.html", book_list=book_list.values.tolist())


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)
