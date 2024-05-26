import mysql.connector
from mysql.connector import MySQLConnection, Error

from typing import Union


def create_connection(
        host_name: str,
        user_name: str,
        user_password: str,
        db_name: str
    ) -> Union[MySQLConnection, None]:
    
    connection = None
    try:
        connection = mysql.connector.connect(
            host = host_name,
            user = user_name,
            password = user_password,
            database = db_name
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"[Error] Unable to connect: '{e}'")
    
    return connection
