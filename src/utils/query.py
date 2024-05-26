from mysql.connector import Error, MySQLConnection
from mysql.connector.cursor import MySQLCursor

from typing import Union


def fetch_query(connection: MySQLConnection, cursor: MySQLCursor, query: str) -> Union[str, None]:
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        connection.commit()
    except Error as e:
        print(f"[ERROR] Unable to execute and fetch query: '{e}'")
    
    return result
