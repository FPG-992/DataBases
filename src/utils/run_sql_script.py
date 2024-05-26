from mysql.connector import MySQLConnection
from mysql.connector.cursor import MySQLCursor

from typing import List, Dict


def run_sql_file(filename: str, connection: MySQLConnection, cursor: MySQLCursor) -> List[Dict[str, int]]:

    # Read the SQL file
    with open(filename, 'r') as file:
        sql_script = file.read()

    # Split the script into individual statements
    sql_statements = sql_script.split(';')

    # Execute each statement
    results = []
    for statement in sql_statements:
        if statement.strip():  # Skip empty statements
            cursor.execute(statement)

            res = cursor.fetchall()

            if res is not None:
                results.append(res)

            connection.commit()

    return results
