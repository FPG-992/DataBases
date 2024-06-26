from utils import fetch_query, create_connection

from mysql.connector import MySQLConnection
from mysql.connector.cursor import MySQLCursor

import hashlib


def admin_app(DATABASE_NAME: str, connection: MySQLConnection, cursor: MySQLCursor) -> None:
    choice = None
    while choice != 4:
        while choice not in [1, 2, 3, 4]:
            print(
                '''> Admin Mode
            Select actions:
                1. Query the Database
                2. Create Backup
                3. Restore the Database
                4. Exit'''
            )
            try:
                choice = int(input('> Action: '))
            except ValueError:
                print('> [ERROR] enter an action between 1-4')
        
        if choice == 1:
            query = input('> Enter your query: ')
            out = fetch_query(connection, cursor, query)

            if len(out) > 0:
                print(f'> Data returned: {out}')

        if choice == 2:
            while True:
                name = input('> Enter a name for the backup: ')
                test_c = create_connection("127.0.0.1", "root", "root", f"{name}")

                if test_c is not None:
                    print('> [ERROR] this backup already exists.')
                else:
                    break

            fetch_query(connection, cursor, f'CREATE DATABASE {name}')

            # Backup Tables
            for t in fetch_query(connection, cursor, "SHOW TABLES;"):
                table = t[f'Tables_in_{DATABASE_NAME}']

                fetch_query(connection, cursor, f'''CREATE TABLE {name}.{table} LIKE {DATABASE_NAME}.{table};''')
                fetch_query(connection, cursor, f'''INSERT INTO {name}.{table} SELECT * FROM {DATABASE_NAME}.{table};''')

            # Backup Views
            for t in fetch_query(connection, cursor, f"SHOW FULL TABLES IN {DATABASE_NAME} WHERE TABLE_TYPE LIKE 'VIEW'"):
                table = t[f'Tables_in_{DATABASE_NAME}']
                fetch_query(connection, cursor, f'''CREATE VIEW {name}.{table} AS SELECT * FROM {DATABASE_NAME}.{table};''')

            '''
            Can also backupt stored procedures and function, but we won't do that for this excersize:
            - displaying all procedures 'fetch_query(connection, 'SHOW PROCEDURE STATUS WHERE Db="final_db"')'
            - displaying all functions 'fetch_query(connection, 'SHOW FUNCTION STATUS WHERE Db="final_db"')'
            '''

            fetch_query(connection, cursor, f'USE {DATABASE_NAME}')

        if choice == 3:
            while True:
                name = input('> Enter a name for the backup: ')
                test_c = create_connection("127.0.0.1", "root", "root", f"{name}")

                if test_c is None:
                    print('> [ERROR] this backup does not exist.')
                else:
                    break

            fetch_query(test_c, cursor, f'DROP DATABASE {DATABASE_NAME}')
            fetch_query(test_c, cursor, f'CREATE DATABASE {DATABASE_NAME}')

            # Restore Tables
            for t in fetch_query(test_c, cursor, "SHOW TABLES;"):
                table = t[f'Tables_in_{name}']

                fetch_query(test_c, cursor, f'''CREATE TABLE {DATABASE_NAME}.{table} LIKE {name}.{table}''')
                fetch_query(test_c, cursor, f'''INSERT INTO {DATABASE_NAME}.{table} SELECT * FROM {name}.{table}''')

            # Restore Views
            for t in fetch_query(test_c, cursor, f"SHOW FULL TABLES IN {name} WHERE TABLE_TYPE LIKE 'VIEW'"):
                table = t[f'Tables_in_{name}']
                fetch_query(test_c, cursor, f'''CREATE VIEW {DATABASE_NAME}.{table} AS SELECT * FROM {name}.{table};''')

        if choice == 4:
            break

        choice = None


def chefs_app(connection: MySQLConnection, cursor: MySQLCursor, first_name: str, last_name: str) -> None:
    choice = None
    while choice != 4:
        while choice not in [1, 2, 3, 4]:
            print(
                '''> Chef Mode
            Select actions:
                1. Modify recipies
                2. Add new recipe
                3. Modify personal data
                4. Exit'''
            )
            try:
                choice = int(input('> Action: '))
            except ValueError:
                print('> [ERROR] enter an action between 1-4')

        if choice == 1:
            # The recipies that have been given to a chef
            recipies_chef = f'''
            SELECT r.id AS recipe_id
            FROM chefs c
                JOIN episode_participants ep ON c.id = ep.chef_id
                JOIN recipes r ON ep.recipe_id = r.id
            WHERE c.first_name="{first_name}" AND c.last_name="{last_name}"
                AND ep.role = "participant"
            '''
            res = fetch_query(connection, cursor, recipies_chef)

            res_ids = [r['recipe_id'] for r in res]

            if len(res_ids) == 0:
                print(f'> chef `{first_name} {last_name}` doesn\'t have a recipe to modify')
                choice = None
                continue

            print(f'> The recipies chef `{first_name} {last_name}` can modify are" {res_ids}')
            try:
                modify_res_id = int(input('> '))
            except ValueError:
                pass
            while modify_res_id not in res_ids:
                print(f'> [ERROR] resipe `{modify_res_id}` hasn\'t been given to chef `{first_name} {last_name}`')
                print(f'> Pick one of the following: {res_ids}')
                try:
                    modify_res_id = int(input('> '))
                except ValueError:
                    pass

            res = fetch_query(connection, cursor, '''SELECT * FROM recipes LIMIT 1''')[0]
            columns = list(res.keys())

            print(f'> Fields you can modify: {columns}')
            new_values = input('> Modify recipe (use format cooking_time=..., name=..., ...): ')
            
            res = fetch_query(connection, cursor, f'''UPDATE recipes SET {new_values} WHERE id={modify_res_id}''')

            if res is not None:
                print('> Changes have been succesfully saved')

        if choice == 2:
            # Get all the national cuisines from chef
            chef_national_cousines = f'''
            SELECT nc.national_cuisine
            FROM chefs c JOIN chef_specializes_in_national_cuisine nc
                ON c.id = nc.chef_id
            WHERE c.first_name="{first_name}" AND c.last_name="{last_name}"
            '''

            res = fetch_query(connection, cursor, chef_national_cousines)
            national_cousines = [r['national_cuisine'] for r in res]

            print(f'> The recipies you can add must be in the cuisines: {national_cousines}')
            try:
                add_cousine = input('> Cuisine: ')
            except ValueError:
                pass
            while add_cousine not in national_cousines:
                print(f'> [ERROR] you can only add recipies of national cusine: {national_cousines}')
                print(f'> Pick one of the following: {national_cousines}')
                try:
                    add_cousine = input('> ')
                except ValueError:
                    pass

            res = fetch_query(connection, cursor, '''SELECT * FROM recipes ORDER BY id DESC LIMIT 1''')[0]
            last_id = res['id']
            columns = list(res.keys())

            print(f'> The columns you have to add: {columns[1:-1]}')
            values = input(f'> Add new recipe (format: value1, value2, ...): ')

            res = fetch_query(connection, cursor, f'''INSERT INTO recipes VALUES ({last_id+1}, {values}, "{add_cousine}")''')

            if res is not None:
                print('> Changes have been succesfully saved')

            '''
            We should add data to tables that are linked with the tables 'recipes'
            '''

        if choice == 3:
            # Find the filds of the personal data of a chef
            chef_data = f'''
            SELECT *
            FROM chefs c
            WHERE c.first_name="{first_name}" AND c.last_name="{last_name}"
            '''

            res = fetch_query(connection, cursor, chef_data)[0]
            chef_id = res['id']
            columns = list(res.keys())[1:-1]

            print(f'> Change any of those fields: {columns}')
            new_values = input(f'Format: first_name=..., last_name=..., ... (for no changes press ENTER): ')
            if new_values != '':
                res = fetch_query(connection, cursor, f'''UPDATE chefs SET {new_values} WHERE id={chef_id}''')
                print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')

                if res is not None:
                    print('> Changes have been succesfully saved')

            yesorno = input('> Do you want to change your password? (yes/no)? ')
            while yesorno not in ['yes', 'no']:
                yesorno = input("> Use 'yes' or 'no': ")
            
            if yesorno == 'yes':
                new_passwd = input('> Type new password: ')
                res = fetch_query(connection, cursor, f'''UPDATE chefs SET passwd="{hashlib.sha256(new_passwd.encode()).hexdigest()}" WHERE id={chef_id}''')

                if res is not None:
                    print('> Changes have been succesfully saved')
            
            yesorno = input('> Do you want to change your national cuisines? (yes/no)? ')
            while yesorno not in ['yes', 'no']:
                yesorno = input("> Use 'yes' or 'no': ")

            if yesorno == 'yes':
                chef_national_cousines = f'''
                SELECT nc.national_cuisine
                FROM chefs c JOIN chef_specializes_in_national_cuisine nc
                    ON c.id = nc.chef_id
                WHERE c.first_name="{first_name}" AND c.last_name="{last_name}"
                '''
                res = fetch_query(connection, cursor, chef_national_cousines)
                national_cousines = [r['national_cuisine'] for r in res]

                print(f'> The national cuisines you have are {national_cousines}')
                new_cuisines = input('> Modify your list (seperate with \' \'): ')

                for c in new_cuisines.split(' '):
                    if c not in national_cousines:
                        res = fetch_query(connection, cursor, f'''INSERT INTO chef_specializes_in_national_cuisine VALUES ({chef_id}, "{c}")''')

                        if res is not None:
                            print('> Changes have been succesfully saved')
                
                for c in national_cousines:
                    if c not in new_cuisines.split(' '):
                        res = fetch_query(connection, cursor, f'''DELETE FROM chef_specializes_in_national_cuisine WHERE chef_id={chef_id} and national_cuisine="{c}"''')

                        if res is not None:
                            print('> Changes have been succesfully saved')

        if choice == 4:
            break

        choice = None
