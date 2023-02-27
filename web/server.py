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


@app.route('/')
def home():
    return render_template("main.html")


@app.route('/data')
def database():
    cur.execute("SELECT * FROM book;")
    airport = cur.fetchall()
    return render_template('main.html', airport=airport)


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)
