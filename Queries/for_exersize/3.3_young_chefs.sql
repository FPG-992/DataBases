SELECT c.*, COUNT(r.id) AS number_of_recipes
FROM chefs c
    LEFT JOIN chef_specializes_in_national_cuisine csinc ON c.id = csinc.chef_id
    LEFT JOIN recipes r ON csinc.national_cuisine = r.national_cuisine
WHERE TIMESTAMPDIFF(YEAR, c.date_of_birth, CURDATE()) < 30
GROUP BY c.id
ORDER BY number_of_recipes DESC;
