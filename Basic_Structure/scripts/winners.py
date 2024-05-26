import mysql.connector
from mysql.connector import MySQLConnection, Error
from mysql.connector.cursor import MySQLCursor

from random import randint
from typing import Union, Dict, List


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


def fetch_query(query: str) -> Union[str, None]:
    global cursor, connection

    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        connection.commit()
    except Error as e:
        print(f"[ERROR] Unable to execute and fetch query: '{e}'")
    
    return result


def find_max_grade(d: List[Dict[str, int]]) -> List[Dict[str, int]]:
    ret = []
    max_grade = d[0]['grade']

    for episode_d in d:
        if episode_d['grade'] > max_grade:
            max_grade = episode_d['grade']

    for episode_d in d:
        if episode_d['grade'] == max_grade:
            ret.append(episode_d)

    return ret


def find_max_type(episode_winners: Dict[str, int]) -> Dict[str, int]:
    ret = []
    max_type = episode_winners[0]['type']

    for winner in episode_winners:
        if winner['type'] > max_type:
            max_type = winner['type']

    for winner in episode_winners:
        if winner['type'] == max_type:
            ret.append(winner)

    if len(ret) == 1:
        return ret[0]

    return ret[randint(0, len(ret)-1)]


def episode_winners() -> Union[Dict[int, Dict[str, int]], None]:
    # Get the different episodes ID
    all_episodes_q = '''
    SELECT DISTINCT episode_id
    FROM judge_rates_chef
    '''
    res = fetch_query(all_episodes_q)

    if res is None:
        return

    episodes_id = [r['episode_id'] for r in res]
    winners = {ep: [] for ep in episodes_id}

    for ep in episodes_id:
        participant_episode_score_q = f'''
        SELECT chef_id, SUM(score) as grade, type
        FROM judge_rates_chef r
            JOIN chefs c ON r.chef_id = c.id
        WHERE episode_id = {ep}
        GROUP BY chef_id
        '''

        res = fetch_query(participant_episode_score_q)

        if res is None:
            return

        winners[ep] = find_max_type(find_max_grade(res))

    return winners


def main() -> None:
    winners = episode_winners()
    all_episodes = list(winners.keys())

    if winners is None:
        return

    try:
        episode = int(input('> Enter episode: '))
    except ValueError:
        episode = None

    while episode not in all_episodes:
        try:
            winners[episode]
        except KeyError:
            print(f'> This episode doesn\'t exists. Episodes: {all_episodes}')
        
        try:
            episode = int(input('> Enter episode: '))
        except ValueError:
            episode = None
    
    print(f'> Winner of episode: {episode} is {winners[episode]}')


if __name__ == '__main__':
    DATABASE_NAME: str = 'final_db'

    connection = create_connection("127.0.0.1", "root", "root", DATABASE_NAME)
    
    if connection.is_connected():
        cursor: MySQLCursor = connection.cursor(dictionary=True)

        main()

        cursor.close()
    
    connection.close()
