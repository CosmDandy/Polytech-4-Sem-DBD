from flask import Flask, render_template, url_for
import psycopg2

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
    return render_template("main.html")


@app.route('/login')
def login():
    return render_template("login.html")


@app.route('/register')
def register():
    return render_template("register.html")


# @app.route('/data')
# def database():
#     cur.execute("SELECT * FROM book;")
#     airport = cur.fetchall()
#     return render_template('main.html', airport=airport)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)
