-- Active: 1716659993141@@127.0.0.1@3306@final_db
CREATE VIEW chef_average_score AS
SELECT CONCAT(c.first_name," ",c.last_name) AS full_name, AVG(jrc.score) AS mean_score
FROM chefs c 
    JOIN judge_rates_chef jrc ON c.id = jrc.chef_id
GROUP BY jrc.chef_id;


CREATE VIEW national_cuisine_average_score AS
SELECT csinc.national_cuisine AS national_cuisine, AVG(jrc.score) AS mean_score
FROM chef_specializes_in_national_cuisine csinc
    JOIN judge_rates_chef jrc ON csinc.chef_id = jrc.chef_id
GROUP BY csinc.national_cuisine;
