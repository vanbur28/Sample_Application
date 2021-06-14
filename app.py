# sample application
# Do not know why the application is required to be named app.py?
import mysql.connector
import json
from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, Docker!'


@app.route('/widgets')
def get_widgets():
    mydb = mysql.connector.connect(
        host="mysqldb",
        user="root",
        password="p@ssw0rd1",
        database="inventory"
    )
    cursor = mydb.cursor()

    cursor.execute("SELECT * FROM widgets")

    # This will extract the row headers
    row_headers = [x[0] for x in cursor.description]

    results = cursor.fetchall()
    json_data = []
    for result in results:
        jason_data.append(dict(zip(row_headers, results)))

    cursor.close()
    return jason.dumps(json_data)


@app.route('/initdb')
def db_init():
    mydb = mysql.connector.connect(
        host="mysqldb",
        user="root",
        password="p@ssw0rd1"
    )

    cursor = mydb.cursor()

    cursor.execute("DROP DATABASE IF EXISTS inventory")
    cursor.execute(
        "CREATE TABLE widgets (name VARCHAR(255), description VARCHAR(255))")
    cursor.close()


if __name__ == "__main__":
    app.run(host='0.0.0.0')
