import logging
import random

from flask import Blueprint, render_template, redirect, url_for, request, flash
from flask_login import login_user, logout_user
from werkzeug.security import generate_password_hash, check_password_hash
from . import db
from .models import Database, User
from .forms import RegisterForm, LoginForm

auth = Blueprint('auth', __name__)


@auth.route('/register', methods=['GET', 'POST'])
def register():
    register_form = RegisterForm()
    if register_form.validate_on_submit():
        database = Database()
        database.connect()
        database.execute(
            f"INSERT INTO lib_schema.address(address_title, address_postcode, address_latitude, address_longitude) VALUES ('{register_form.people_address.data}', '{random.randint(1, 200000)}', {random.randint(0, 180)}, {random.randint(0, 180)}) RETURNING address_id;")
        people_address_id = int(str(database.fetchall()[0])[1:-2])
        database.execute(
            f"INSERT INTO lib_schema.people(people_name, people_surname, people_patronymic, people_sex, people_address, people_tel_num, people_pass_num, people_email, people_password, people_role) VALUES ('{register_form.people_name.data}', '{register_form.people_surname.data}', '{register_form.people_patronymic.data}', {register_form.people_sex.data}, {people_address_id}, {register_form.people_tel_num.data}, {register_form.people_pass_num.data}, '{register_form.people_email.data}', '{generate_password_hash(register_form.people_password.data, method='sha256')}', {register_form.people_role});")
        database.commit()

        email = register_form.people_email.data

        user = User.query.filter_by(email=email).first()
        login_user(user)
        return redirect('/')
    return render_template("register.html", form=register_form)


@auth.route('/login', methods=['GET', 'POST'])
def login():
    login_form = LoginForm()
    if login_form.validate_on_submit():
        database = Database()
        database.connect()
        database.execute(
            f"SELECT people_id, people_name, people_surname, people_role, people_email, people_password FROM lib_schema.people WHERE people_email='{login_form.people_email.data}';")
        query = database.fetchall()
        logging.info(query)

        email = login_form.people_email.data
        password = login_form.people_password.data

        user = User.query.filter_by(email=email).first()

        if user and check_password_hash(user.password, password):
            login_user(user)
            return redirect('/')
    return render_template("login.html", form=login_form)


@auth.route('/logout')
def logout():
    logout_user()
    return redirect('/')
