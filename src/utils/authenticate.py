from utils import fetch_query

from mysql.connector import MySQLConnection
from mysql.connector.cursor import MySQLCursor

import hashlib


def authenticate(connection: MySQLConnection, cursor: MySQLCursor, name: str, passwd: str) -> int:
    ret = fetch_query(connection, cursor, f'SELECT id FROM admin WHERE name="{name}" and passwd="{hashlib.sha256(passwd.encode()).hexdigest()}"')

    # Grand admin authentication
    if len(ret) > 0:
        return 1

    try:
        first_name, last_name = name.split(' ')
    except ValueError:
        # Invalid username
        return 0
    
    ret = fetch_query(connection, cursor, f'''SELECT id FROM chefs WHERE first_name="{first_name}" and last_name="{last_name}" and passwd="{hashlib.sha256(passwd.encode()).hexdigest()}"''')

    # Grand chef authentication
    if len(ret) > 0:
        return 2

    return 0
