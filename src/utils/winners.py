from utils import fetch_query

from mysql.connector import MySQLConnection
from mysql.connector.cursor import MySQLCursor

from random import randint
from typing import Union, Dict, List


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


def episode_winners(connection: MySQLConnection, cursor: MySQLCursor) -> Union[Dict[int, Dict[str, int]], None]:
    # Get the different episodes ID
    all_episodes_q = '''
    SELECT DISTINCT episode_id
    FROM judge_rates_chef
    '''
    res = fetch_query(connection, cursor, all_episodes_q)

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

        res = fetch_query(connection, cursor, participant_episode_score_q)

        if res is None:
            return

        winners[ep] = find_max_type(find_max_grade(res))

    return winners


def fetch_winners(connection: MySQLConnection, cursor: MySQLCursor, episode: int) -> None:
    winners = episode_winners(connection, cursor)
    all_episodes = list(winners.keys())

    if winners is None:
        return

    try:
        episode = int(episode)
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
