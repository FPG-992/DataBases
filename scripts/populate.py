import mysql.connector
from mysql.connector import Error
import random


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


def fetch_query(connection, query):
    cursor = connection.cursor(dictionary=True)
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as e:
        print(f"The error '{e}' occurred")
        return result


def insert_episodes(connection, year, num_episodes=10):
    for i in range(num_episodes):
        day = random.randint(1, 28)
        month = i + 1
        query = f"""
        INSERT INTO episodes (day, month, year)
        VALUES ({day}, {month}, {year});
        """
        execute_query(connection, query)


def select_random_cuisines(connection, limit):
    query = f"""
    SELECT name FROM national_cuisines
    ORDER BY RAND()
    LIMIT {limit};
    """
    return [cuisine["name"] for cuisine in fetch_query(connection, query)]


def select_random_chefs_by_cuisine(connection, cuisine, limit):
    query = f"""
    SELECT c.id, csinc.national_cuisine FROM chefs c
    JOIN chef_specializes_in_national_cuisine csinc ON c.id = csinc.chef_id
    WHERE csinc.national_cuisine = '{cuisine}'
    ORDER BY RAND()
    LIMIT {limit};
    """
    return [
        (chef["id"], chef["national_cuisine"])
        for chef in fetch_query(connection, query)
    ]


def select_random_judge_chefs(connection, limit):
    query = f"""
    SELECT c.id FROM chefs c
    ORDER BY RAND()
    LIMIT {limit};
    """
    return [chef["id"] for chef in fetch_query(connection, query)]


def select_random_recipe_by_cuisine(connection, cuisine):
    query = f"""
    SELECT id FROM recipes
    WHERE national_cuisine = '{cuisine}'
    ORDER BY RAND()
    LIMIT 1;
    """
    result = fetch_query(connection, query)
    return result[0]["id"] if result else None


def insert_episode_participants(connection, episode_id, participant_cooks, judge_cooks):
    for cook_id, cuisine in participant_cooks:
        recipe_id = select_random_recipe_by_cuisine(connection, cuisine)

        query = f"""
        INSERT INTO episode_participants (episode_id, chef_id, recipe_id, role)
        VALUES ({episode_id}, {cook_id}, {recipe_id}, 'participant');
        """
        execute_query(connection, query)

    for cook_id in judge_cooks:
        query = f"""
        INSERT INTO episode_participants (episode_id, chef_id, role)
        VALUES ({episode_id}, {cook_id}, 'judge');
        """
        execute_query(connection, query)


def insert_judge_scores(connection, episode_id):
    # Get judges from episode_id
    query = f"""
    SELECT chef_id FROM episode_participants
    WHERE episode_id = {episode_id} AND role = 'judge';
    """
    judges = fetch_query(connection, query)

    # Get participants from episode_id
    query = f"""
    SELECT chef_id FROM episode_participants
    WHERE episode_id = {episode_id} AND role = 'participant';
    """
    participants = fetch_query(connection, query)

    # Fill the scores for each participant
    for participant in participants:
        for judge in judges:
            score = random.randint(1, 5)
            query = f"""
            INSERT INTO judge_rates_chef (score, chef_id, judge_id, episode_id)
            VALUES ({score}, {participant['chef_id']}, {judge['chef_id']}, {episode_id});
            """
            execute_query(connection, query)


def main():
    connection = create_connection("127.0.0.1", "root", "root", "real_dbp")

    year = 2025
    num_episodes = 10
    num_cuisines = 10
    num_judges = 3

    # Cook participation count
    cook_part_c = dict()

    # Insert episodes
    insert_episodes(connection, year, num_episodes)

    # Fetch episode IDs
    episodes = fetch_query(connection, "SELECT id FROM episodes")

    for episode in episodes:
        episode_id = episode["id"]

        # Select 10 distinct national cuisines
        cuisines = select_random_cuisines(connection, num_cuisines)

        participant_cooks = []
        for cuisine in cuisines:
            # Select one cook from each national cuisine

            cooks = select_random_chefs_by_cuisine(connection, cuisine, 1)
            while cook_part_c.get(cooks[0], 0) > 3:
                cooks = select_random_chefs_by_cuisine(connection, cuisine, 1)
            if cooks:
                participant_cooks.extend(cooks)
                cook_part_c[cooks[0]] = cook_part_c.get(cooks[0], 0) + 1

        # Select 3 judge cooks
        judge_cooks = select_random_judge_chefs(connection, num_judges)

        # Insert participants into episode_participants table
        insert_episode_participants(
            connection, episode_id, participant_cooks, judge_cooks
        )

        insert_judge_scores(connection, episode_id)


if __name__ == "__main__":
    main()
