import mysql.connector
from mysql.connector import Error

import hashlib


def create_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name, user=user_name, password=user_password, database=db_name
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection


def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")


def main():
    connection = create_connection("127.0.0.1", "root", "root", "final_db")

    execute_query(connection,
        f'''INSERT INTO admin VALUES (0, "petros", "{hashlib.sha256('petros'.encode()).hexdigest()}");'''
    )
    execute_query(connection,
        f'''INSERT INTO admin VALUES (1, "loukas", "{hashlib.sha256('loukas'.encode()).hexdigest()}");'''
    )
    execute_query(connection,
        f'''INSERT INTO admin VALUES (2, "filippos", "{hashlib.sha256('filippos'.encode()).hexdigest()}");'''
    )


if __name__ == '__main__':
    main()
