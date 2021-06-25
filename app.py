# sample application
# Do not know why the application is required to be named app.py?
import mysql.connector
import json
from flask import Flask

app = Flask(__name__)

# Hello world application that prints text when it is ran


@app.route('/')
def hello_world():
    return 'Hello, Docker!'

# app.route is a flask fuction that accesses a location


@app.route('/widgets')
def get_widgets():

    # Estabolishes a connection with the mysql server
    mydb = mysql.connector.connect(
        host="mysqldb",  # The host name or IP address of the MySQL server
        user="root",  # The user name used to authenticate with the MySQL server
        password="p@ssw0rd1",
        database="inventory"  # The database name to use when connecting with the MySQL server
        # Additional Arguments: https://dev.mysql.com/doc/connector-python/en/connector-python-connectargs.html
    )
    # mydb.cursor declares and opens the cursor so that items can be added to database
    cursor = mydb.cursor()

    # curssor.execute runs the dependent operator's commands, in this case selects the number of rows next command
    cursor.execute("SELECT * FROM widgets")

    # This will extract the row headers
    row_headers = [x[0] for x in cursor.description]

    # Selects all remaining un selected rows of a query result set and returns a list of tuples
    results = cursor.fetchall()

    # Creates an empty list
    json_data = []

    # Adds two collumns named 'row_headers' and 'results'
    for result in results:
        json_data.append(dict(zip(row_headers, result)))

    # stops the ability to add items to database
    cursor.close()

    # prints the json_data database
    return json.dumps(json_data)


@app.route('/initdb')
def db_init():
    mydb = mysql.connector.connect(
        host="mysqldb",
        user="root",
        password="p@ssw0rd1"
    )

    cursor = mydb.cursor()

    cursor.execute("DROP DATABASE IF EXISTS inventory")
    cursor.execute("CREATE DATABASE inventory")
    cursor.close()

    mydb = mysql.connector.connect(
        host="mysqldb",
        user="root",
        password="p@ssw0rd1",
        database="inventory"
    )

    cursor = mydb.cursor()

    cursor.execute("DROP TABLE IF EXISTS widgets")
    cursor.execute(
        "CREATE TABLE widgets (name VARCHAR(255), description VARCHAR(255))")
    cursor.close()

    return 'init database'


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
