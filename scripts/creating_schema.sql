-- Creating Tables
CREATE TABLE national_cousine (
	national_cousine_id  INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    name                 VARCHAR(30) NOT NULL
);

CREATE TABLE ingredient_group (
	name         VARCHAR(30) PRIMARY KEY NOT NULL UNIQUE,
    description  VARCHAR(30) NOT NULL
);

CREATE TABLE ingredients (
	ingredient_id                INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	name                         VARCHAR(30) NOT NULL,
    group_name VARCHAR(30)       NOT NULL,
    calories_fat_p100            INT NOT NULL,
    calories_protein_p100        INT NOT NULL,
    calories_carbohydrates_p100  INT NOT NULL,
    total_calories               INT NOT NULL,
    
    CONSTRAINT ingredient_group_fk_recipes FOREIGN KEY (group_name) 
		REFERENCES ingredient_group(name) ON DELETE CASCADE
);

CREATE TABLE recipes (
	recipe_id            INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    name                 VARCHAR(30) NOT NULL,
    description          VARCHAR(30) NOT NULL,
    is_bakery            BOOLEAN NOT NULL,
    difficulty_level     ENUM("1", "2", "3", "4", "5")  NOT NULL,
    national_cousine_id  INT NOT NULL,
    main_igredient_id    INT NOT NULL,
    
    CONSTRAINT recipe_fk_national_cousine FOREIGN KEY (national_cousine_id) 
		REFERENCES national_cousine(national_cousine_id) ON DELETE CASCADE,
	CONSTRAINT recipe_fk_ingredients FOREIGN KEY (main_igredient_id)
		REFERENCES ingredients(ingredient_id) ON DELETE CASCADE
);

CREATE TABLE meal_type (
    name       VARCHAR(30) NOT NULL,
    recipe_id  INT NOT NULL,
    
    CONSTRAINT meal_type_pk PRIMARY KEY (name, recipe_id),
    CONSTRAINT meal_type_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

CREATE TABLE extra_tags (
	name       VARCHAR(30) NOT NULL,
    recipe_id  INT NOT NULL,
    
    CONSTRAINT extra_tags_pk PRIMARY KEY (name, recipe_id),
    CONSTRAINT extra_tags_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

CREATE TABLE tips (
	recipe_id  INT PRIMARY KEY NOT NULL UNIQUE,
    tip_1      VARCHAR(30) NOT NULL,
    tip_2      VARCHAR(30) NOT NULL,
    tip_3      VARCHAR(30) NOT NULL,
    
    CONSTRAINT tips_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

CREATE TABLE equipment (
	equipment_id  INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    name          VARCHAR(30) NOT NULL,
    equipment_manual   VARCHAR(30)
);

CREATE TABLE recipe_equipment (
	recipe_equipment_id  INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    recipe_id            INT NOT NULL,
    equipment_id         INT NOT NULL,
    
    CONSTRAINT recipe_equipment_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE,
	CONSTRAINT recipe_equipment_fk_equipment FOREIGN KEY (equipment_id) 
		REFERENCES equipment(equipment_id) ON DELETE CASCADE
);

CREATE TABLE recipe_time (
	recipe_id         INT PRIMARY KEY NOT NULL UNIQUE,
    preparation_time  INT NOT NULL,
	cooking_time      INT NOT NULL,
    
    CONSTRAINT recipe_time_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

CREATE TABLE cooking_steps (
	step_id      INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    description  VARCHAR(30) NOT NULL,
    recipe_id    INT NOT NULL,
    
    CONSTRAINT cooking_steps_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE
);


CREATE TABLE ingredients_recipe (
	ingredient_recipe_id  INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    name                  VARCHAR(30) NOT NULL,
    quantity              INT NOT NULL,
    recipe_id             INT NOT NULL,
    
    CONSTRAINT ingredients_recipe_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

CREATE TABLE theme (
	name         VARCHAR(30) PRIMARY KEY NOT NULL UNIQUE,
    description  VARCHAR(30) NOT NULL
);

CREATE TABLE theme_recipe (
	theme_recipe_id INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    theme_name VARCHAR(30) NOT NULL,
    recipe_id INT NOT NULL,
	
    CONSTRAINT theme_recipe_fk_theme FOREIGN KEY (theme_name) 
		REFERENCES theme(name) ON DELETE CASCADE,
    CONSTRAINT theme_recipe_fk_recipes FOREIGN KEY (recipe_id) 
		REFERENCES recipes(recipe_id) ON DELETE CASCADE
);

CREATE TABLE chef (
	chef_id                        INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    first_name                     VARCHAR(30) NOT NULL,
    last_name                      VARCHAR(30) NOT NULL,
    phone_number                   VARCHAR(30) NOT NULL,
    date_of_birth                  DATE NOT NULL,
    age                            INT NOT NULL,
    expertise_years                INT NOT NULL,
    expertise_national_cousine_id  INT NOT NULL,
    chef_type                      ENUM(
		"Γ μάγειρας", "Β μάγειρας", "Α μάγειρας", "Βοηθός αρχιμάγειρα", "αρχιμάγειρας"
        ) NOT NULL
);

CREATE TABLE episode_chef_cousine (
	episode_id           INT NOT NULL,
    chef_id              INT NOT NULL,
    national_cousine_id  INT NOT NULL,
    rating_1             ENUM("1", "2", "3", "4", "5"),
    rating_2             ENUM("1", "2", "3", "4", "5"),
    rating_3             ENUM("1", "2", "3", "4", "5"),
    
    CONSTRAINT episode_chef_pk PRIMARY KEY (episode_id, chef_id, national_cousine_id),
    CONSTRAINT episode_chef_cousine_fk_chef FOREIGN KEY (chef_id) 
		REFERENCES chef(chef_id) ON DELETE CASCADE,
	CONSTRAINT episode_chef_cousine_fk_national_cousine FOREIGN KEY (national_cousine_id) 
		REFERENCES national_cousine(national_cousine_id) ON DELETE CASCADE
);

CREATE TABLE episode_judge (
	episode_id INT NOT NULL,
    chef_id INT NOT NULL,
    
    CONSTRAINT episode_judge_pk PRIMARY KEY (episode_id, chef_id),
    CONSTRAINT episode_judge_fk_chef FOREIGN KEY (chef_id) 
		REFERENCES chef(chef_id) ON DELETE CASCADE
);
