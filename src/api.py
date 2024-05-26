from utils import create_connection, authenticate, admin_app, chefs_app, fetch_winners, run_sql_file

from mysql.connector.cursor import MySQLCursor

from flask import Flask, jsonify


app = Flask(__name__)


@app.route('/query/<number>', methods=['POST'])
def post_request_query(number):
    global connection, cursor

    results = run_sql_file(f'queries/for_api/{number}.sql', connection, cursor)

    code = 400
    if results is not None:
        code = 200
        for res_queries in results:
            for r in res_queries:
                print(r)
            print()

    return jsonify(results), code


@app.route('/users/<name>/<passwd>', methods=['POST'])
def post_users_script(name, passwd):
    global DATABASE_NAME, connection, cursor

    code = authenticate(connection, cursor, name, passwd)

    if code == 1:
        # Admin code
        admin_app(DATABASE_NAME, connection, cursor)
    
    if code == 2:
        # chef's code
        first_name, last_name = None, None
        try:
            first_name, last_name = name.split(' ')
        except Exception:
            code = 0

        if first_name is not None and last_name is not None:
            chefs_app(connection, cursor, first_name, last_name)

    if code == 0:
        # invalid
        print('> Wrong username or/and password')
    
    return jsonify('response'), 200


@app.route('/winners/<episode>', methods=['POST'])
def post_winners_script(episode):
    global connection, cursor

    fetch_winners(connection, cursor, episode)

    return jsonify('response'), 200


if __name__ == '__main__':
    DATABASE_NAME: str = 'final_db'
    connection = create_connection("127.0.0.1", "root", "root", DATABASE_NAME)

    if connection.is_connected():
        cursor: MySQLCursor = connection.cursor(dictionary=True)

        if cursor is not None:
            app.run(debug=True)

            cursor.close()

    connection.close()
