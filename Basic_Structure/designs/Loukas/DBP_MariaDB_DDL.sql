/* This is a table of meal types */
CREATE OR REPLACE TABLE `meal_types` (
	`name` VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY(`name`)
);
CREATE OR REPLACE TABLE `food_groups` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL UNIQUE,
	`description` TEXT(1000),
	PRIMARY KEY(`id`)
);
CREATE OR REPLACE TABLE `labels` (
	`name` VARCHAR(255) NOT NULL UNIQUE,
	`tip_1` TEXT(1000),
	`tip_2` TEXT(1000),
	`tip_3` TEXT(1000),
	PRIMARY KEY(`name`)
);
CREATE OR REPLACE TABLE `recipes` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`cooking_time` INT,
	`preparation_time` INT,
	`name` VARCHAR(255) NOT NULL,
	`is_pastry` BOOLEAN NOT NULL,
	`description` TEXT(1000),
	`main_ingredient` INT NOT NULL,
	`meal_type` VARCHAR(255) NOT NULL,
	`national_cuisine` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id`)
);
CREATE OR REPLACE TABLE `ingredients` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`fat_per_100g` FLOAT NOT NULL,
	`protein_per_100g` FLOAT NOT NULL,
	`carbs_per_100g` FLOAT NOT NULL,
	`name` VARCHAR(255) NOT NULL UNIQUE,
	`food_group` INT NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE UNIQUE INDEX `_index`
ON `ingredients` ();
CREATE OR REPLACE TABLE `steps` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`recipe_id` INT NOT NULL,
	`number` INT NOT NULL,
	`description` TEXT(1000) NOT NULL,
	PRIMARY KEY(`id`)
);
CREATE OR REPLACE TABLE `national_cuisines` (
	`name` VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY(`name`)
);
/* Relationship table, where quantity is in grams */
CREATE OR REPLACE TABLE `recipe_uses_ingredient` (
	`recipe_id` INT NOT NULL,
	`ingredient_id` INT NOT NULL,
	`quantity` FLOAT NOT NULL,
	PRIMARY KEY(`recipe_id`, `ingredient_id`)
);
CREATE OR REPLACE TABLE `recipe_has_label` (
	`recipe_id` INT NOT NULL,
	`label_id` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`recipe_id`, `label_id`)
);
CREATE OR REPLACE TABLE `equipment` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL,
	`instructions` TEXT(65535),
	PRIMARY KEY(`id`)
);
/* Relationship table of recipes and equipments */
CREATE OR REPLACE TABLE `recipe_uses_equipment` (
	`recipe_id` INT NOT NULL,
	`equipment_id` INT NOT NULL,
	PRIMARY KEY(`recipe_id`, `equipment_id`)
);
CREATE OR REPLACE TABLE `themes` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`name` VARCHAR(255) NOT NULL UNIQUE,
	`description` TEXT(1000),
	PRIMARY KEY(`id`)
);
CREATE OR REPLACE TABLE `recipe_theme_link` (
	`recipe_id` INT NOT NULL,
	`theme_id` INT NOT NULL,
	PRIMARY KEY(`recipe_id`, `theme_id`)
);
CREATE OR REPLACE TABLE `chefs` (
	`id` INT NOT NULL AUTO_INCREMENT UNIQUE,
	`first_name` VARCHAR(255) NOT NULL,
	`last_name` VARCHAR(255) NOT NULL,
	`date_of_birth` DATE NOT NULL,
	`phone_number` VARCHAR(255) NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`id`)
);
CREATE OR REPLACE TABLE `chef_specializes_in_national_cuisine` (
	`chef_id` INT NOT NULL,
	`national_cuisine` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`chef_id`, `national_cuisine`)
);
ALTER TABLE `steps`
ADD FOREIGN KEY(`recipe_id`) REFERENCES `recipes`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_uses_ingredient`
ADD FOREIGN KEY(`recipe_id`) REFERENCES `recipes`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_uses_ingredient`
ADD FOREIGN KEY(`ingredient_id`) REFERENCES `ingredients`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `ingredients`
ADD FOREIGN KEY(`food_group`) REFERENCES `food_groups`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_has_label`
ADD FOREIGN KEY(`recipe_id`) REFERENCES `recipes`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_has_label`
ADD FOREIGN KEY(`label_id`) REFERENCES `labels`(`name`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_uses_equipment`
ADD FOREIGN KEY(`recipe_id`) REFERENCES `recipes`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_uses_equipment`
ADD FOREIGN KEY(`equipment_id`) REFERENCES `equipment`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipes`
ADD FOREIGN KEY(`national_cuisine`) REFERENCES `national_cuisines`(`name`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipes`
ADD FOREIGN KEY(`meal_type`) REFERENCES `meal_types`(`name`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_theme_link`
ADD FOREIGN KEY(`recipe_id`) REFERENCES `recipes`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipe_theme_link`
ADD FOREIGN KEY(`theme_id`) REFERENCES `themes`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `chef_specializes_in_national_cuisine`
ADD FOREIGN KEY(`chef_id`) REFERENCES `chefs`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `chef_specializes_in_national_cuisine`
ADD FOREIGN KEY(`national_cuisine`) REFERENCES `national_cuisines`(`name`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `recipes`
ADD FOREIGN KEY(`main_ingredient`) REFERENCES `ingredients`(`id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;