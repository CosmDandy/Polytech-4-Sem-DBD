from flask import Flask, render_template, url_for
import psycopg2
import pandas as pd

app = Flask(__name__)
conn = psycopg2.connect(
    host="postgres",
    port="5432",
    database="library",
    user='admin',
    password='admin')
cur = conn.cursor()


@app.route('/base')
def base():
    return render_template("base.html")


@app.route('/base_intro')
def base_intro():
    return render_template("base_intro.html")


@app.route('/base_zero')
def base_zero():
    return render_template("base_zero.html")


@app.route('/')
@app.route('/intro')
def intro():
    return render_template("intro.html")


@app.route('/main')
def main():
    cur.execute(
        "SELECT * FROM lib_schema.book JOIN lib_schema.book_author ba on book.book_author = ba.author_id JOIN lib_schema.book_genre bg on book.book_genre = bg.genre_id JOIN lib_schema.book_lang bl on book.book_lang = bl.lang_id JOIN lib_schema.book_publisher bp on book.book_publisher = bp.publisher_id;")
    book_list = pd.DataFrame(cur.fetchall()).drop([0, 2, 3, 4, 5, 12, 14, 15, 17, 19], axis=1)
    return render_template("main.html", book_list=book_list.values.tolist())


@app.route('/login')
def login():
    return render_template("login.html")


@app.route('/register')
def register():
    return render_template("register.html")


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)
