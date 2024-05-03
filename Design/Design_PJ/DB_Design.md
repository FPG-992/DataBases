## Database Schema

Τι δεν εχω καταλαβει ακομα:
* Αφού εκτελεστούν όλα τα βήματα θα προκύψουν συγκεκριμένες ποσότητες (πχ 2 μερίδες).
* 10 μάγειρες αντιπρόσωποι από κάθε κουζίνα

### Recipies
* recipe_id: int
* name: varchar
* description: varchar
* is_bakery: bool
* national_cousine_id: varchar
* difficulty_level: int
* main_igredient_id: int

### National Cousine
* national_cousine_id: int
* national_cousine_name: varchar

### Meal Type
* meal_type: varchar
* recipe_id: int

### Extra Labels
* label_name: varchar
* recipe_id: int

### Tips
* recipe_id: int
* tip_1: vachar
* tip_2: varchar
* tip_3: varchar

### Equipment
* equipment_id: int
* equipment_name: varchar
* manual: varchat

### Recipe Equipment
* recipe_equipement_id: int
* recipe_id: int
* equipement_id: int

### Time Intervals
* recipe_id: int
* preparing_time: int
* cooking_time: int

### Cooking Steps
* step_id: int
* step_description: varchar
* recipe_id

### Ingredients
* ingredient_name: varchar
* ingredient_group_name: varchar
* calories_fat: int
* calories_protein: int
* calories_carbohydrates: int
* total_calories: int

### Igedient Group
* ingredient_group_name: varchar
* ingredient_group_description: varchar

### Igredients Recipe
* ingredient_recipe_id: int
* ingredient_name: varchar
* recipe_id: int
* quantity: int

### Theme
* theme_name: varchar
* theme_description: varchat

### Theme Recipe
* theme_recipe_id: int
* theme_name: varchar
* recipe_id: int

### Chef
* chef_id: int
* first_name: varchar
* last_name: varchar
* phone_number: varchar
* date_of_birth: date
* age: int
* expertise_years: int
* expertise_national_cousine_id: varchar
* chef_type: varchar

### Episode Cousine Chef
* cousine_chef_id: int
* chef_id: int
* recipe_id: int

### Episode
* episode_id: int
* cousine_chef_id_1: int
* cousine_chef_id_2: int
* cousine_chef_id_3: int
* cousine_chef_id_4: int
* cousine_chef_id_5: int
* cousine_chef_id_6: int
* cousine_chef_id_7: int
* cousine_chef_id_8: int
* cousine_chef_id_9: int
* cousine_chef_id_10: int
* judge_chef_id_1: int
* judge_chef_id_2: int
* judge_chef_id_3: iny

### Episode Rating
* episode_id: int
* chef_id: rating
* rating_1: int
* rating_2: int
* rating_3: int
