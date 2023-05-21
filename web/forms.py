from flask_wtf import FlaskForm
from wtforms import PasswordField, EmailField, TelField, SelectField, StringField, SubmitField
from wtforms.validators import DataRequired, EqualTo, Email, Length


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
