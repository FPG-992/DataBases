-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: final_dbp
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `passwd` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `chef_average_score`
--

DROP TABLE IF EXISTS `chef_average_score`;
/*!50001 DROP VIEW IF EXISTS `chef_average_score`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chef_average_score` AS SELECT 
 1 AS `full_name`,
 1 AS `mean_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `chef_participation_count_per_year`
--

DROP TABLE IF EXISTS `chef_participation_count_per_year`;
/*!50001 DROP VIEW IF EXISTS `chef_participation_count_per_year`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chef_participation_count_per_year` AS SELECT 
 1 AS `chef_id`,
 1 AS `full_name`,
 1 AS `year`,
 1 AS `number_of_participations`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `chef_specializes_in_national_cuisine`
--

DROP TABLE IF EXISTS `chef_specializes_in_national_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef_specializes_in_national_cuisine` (
  `chef_id` int(11) NOT NULL,
  `national_cuisine` varchar(255) NOT NULL,
  PRIMARY KEY (`chef_id`,`national_cuisine`),
  KEY `national_cuisine` (`national_cuisine`),
  CONSTRAINT `chef_specializes_in_national_cuisine_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chefs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `chef_specializes_in_national_cuisine_ibfk_2` FOREIGN KEY (`national_cuisine`) REFERENCES `national_cuisines` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chefs`
--

DROP TABLE IF EXISTS `chefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `experience` int(11) DEFAULT NULL,
  `passwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `episode_participants`
--

DROP TABLE IF EXISTS `episode_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `episode_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `role` enum('participant','judge') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chef_id` (`chef_id`),
  KEY `episode_id` (`episode_id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `idx_episode_recipe` (`recipe_id`),
  CONSTRAINT `episode_participants_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`),
  CONSTRAINT `episode_participants_ibfk_2` FOREIGN KEY (`chef_id`) REFERENCES `chefs` (`id`),
  CONSTRAINT `episode_participants_ibfk_3` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_episode_participants_insert
BEFORE INSERT ON episode_participants
FOR EACH ROW
BEGIN
    CALL check_consecutive_participation(NEW.chef_id, NEW.episode_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_episode_participants_update
BEFORE UPDATE ON episode_participants
FOR EACH ROW
BEGIN
    CALL check_consecutive_participation(NEW.chef_id, NEW.episode_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `instructions` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `food_groups`
--

DROP TABLE IF EXISTS `food_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fat_per_100g` float NOT NULL,
  `protein_per_100g` float NOT NULL,
  `carbs_per_100g` float NOT NULL,
  `name` varchar(255) NOT NULL,
  `food_group` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_index` (`name`),
  KEY `food_group` (`food_group`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`food_group`) REFERENCES `food_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1796 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `judge_rates_chef`
--

DROP TABLE IF EXISTS `judge_rates_chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judge_rates_chef` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `score` int(11) NOT NULL COMMENT 'Score',
  `chef_id` int(11) NOT NULL,
  `judge_id` int(11) NOT NULL,
  `episode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chef` (`chef_id`),
  KEY `judge` (`judge_id`),
  KEY `episode_id` (`episode_id`),
  CONSTRAINT `judge_rates_chef_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chefs` (`id`),
  CONSTRAINT `judge_rates_chef_ibfk_2` FOREIGN KEY (`judge_id`) REFERENCES `chefs` (`id`),
  CONSTRAINT `judge_rates_chef_ibfk_3` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `label_pairs`
--

DROP TABLE IF EXISTS `label_pairs`;
/*!50001 DROP VIEW IF EXISTS `label_pairs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `label_pairs` AS SELECT 
 1 AS `l1_id`,
 1 AS `l2_id`,
 1 AS `l1_name`,
 1 AS `l2_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tip_1` text DEFAULT NULL,
  `tip_2` text DEFAULT NULL,
  `tip_3` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `meal_types`
--

DROP TABLE IF EXISTS `meal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_types` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `national_cuisine_average_score`
--

DROP TABLE IF EXISTS `national_cuisine_average_score`;
/*!50001 DROP VIEW IF EXISTS `national_cuisine_average_score`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `national_cuisine_average_score` AS SELECT 
 1 AS `national_cuisine`,
 1 AS `mean_score`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `national_cuisines`
--

DROP TABLE IF EXISTS `national_cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `national_cuisines` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_has_label`
--

DROP TABLE IF EXISTS `recipe_has_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_has_label` (
  `recipe_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`,`label_id`),
  KEY `recipe_has_label_ibfk_2` (`label_id`),
  KEY `idx_recipe_label` (`recipe_id`,`label_id`),
  CONSTRAINT `recipe_has_label_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipe_has_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `recipe_has_label_pair`
--

DROP TABLE IF EXISTS `recipe_has_label_pair`;
/*!50001 DROP VIEW IF EXISTS `recipe_has_label_pair`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recipe_has_label_pair` AS SELECT 
 1 AS `recipe_id`,
 1 AS `l1_id`,
 1 AS `l2_id`,
 1 AS `l1_name`,
 1 AS `l2_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recipe_theme_link`
--

DROP TABLE IF EXISTS `recipe_theme_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_theme_link` (
  `recipe_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`,`theme_id`),
  KEY `theme_id` (`theme_id`),
  CONSTRAINT `recipe_theme_link_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipe_theme_link_ibfk_2` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_uses_equipment`
--

DROP TABLE IF EXISTS `recipe_uses_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_uses_equipment` (
  `recipe_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`,`equipment_id`),
  KEY `equipment_id` (`equipment_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `recipe_uses_equipment_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipe_uses_equipment_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_uses_ingredient`
--

DROP TABLE IF EXISTS `recipe_uses_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_uses_ingredient` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `recipe_uses_ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipe_uses_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cooking_time` int(11) DEFAULT NULL,
  `preparation_time` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `is_pastry` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL,
  `difficulty` int(11) NOT NULL DEFAULT 1,
  `main_ingredient_id` int(11) NOT NULL,
  `meal_type` varchar(255) NOT NULL,
  `national_cuisine` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `national_cuisine` (`national_cuisine`),
  KEY `meal_type` (`meal_type`),
  KEY `main_ingredient_id` (`main_ingredient_id`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`national_cuisine`) REFERENCES `national_cuisines` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipes_ibfk_2` FOREIGN KEY (`meal_type`) REFERENCES `meal_types` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipes_ibfk_3` FOREIGN KEY (`main_ingredient_id`) REFERENCES `ingredients` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=477 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `steps`
--

DROP TABLE IF EXISTS `steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'final_dbp'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_consecutive_participation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_consecutive_participation`(IN chef INT, IN new_episode_id INT)
BEGIN
    DECLARE participation_count INT;
    -- Fetch the previous three episodes based on the new episode ID
    SET participation_count = (
        SELECT COUNT(*)
        FROM (
            SELECT ep.episode_id
            FROM episode_participants ep
            JOIN episodes e ON ep.episode_id = e.id
            WHERE ep.chef_id = chef
            AND ep.episode_id < new_episode_id
            ORDER BY ep.episode_id DESC
            LIMIT 3
        ) AS last_three_episodes
    );
    -- Check if the chef participated in the last three episodes
    IF participation_count = 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A chef cannot participate in more than 3 consecutive episodes';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `chef_average_score`
--

/*!50001 DROP VIEW IF EXISTS `chef_average_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chef_average_score` AS select concat(`c`.`first_name`,' ',`c`.`last_name`) AS `full_name`,avg(`jrc`.`score`) AS `mean_score` from (`chefs` `c` join `judge_rates_chef` `jrc` on(`c`.`id` = `jrc`.`chef_id`)) group by `jrc`.`chef_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `chef_participation_count_per_year`
--

/*!50001 DROP VIEW IF EXISTS `chef_participation_count_per_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chef_participation_count_per_year` AS select `c`.`id` AS `chef_id`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `full_name`,`e`.`year` AS `year`,count(`e`.`id`) AS `number_of_participations` from ((`chefs` `c` join `episode_participants` `ep` on(`c`.`id` = `ep`.`chef_id`)) join `episodes` `e` on(`ep`.`episode_id` = `e`.`id`)) group by `c`.`id`,`e`.`year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `label_pairs`
--

/*!50001 DROP VIEW IF EXISTS `label_pairs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `label_pairs` AS select distinct least(`l1`.`id`,`l2`.`id`) AS `l1_id`,greatest(`l1`.`id`,`l2`.`id`) AS `l2_id`,if(least(`l1`.`id`,`l2`.`id`) = `l1`.`id`,`l1`.`name`,`l2`.`name`) AS `l1_name`,if(least(`l1`.`id`,`l2`.`id`) = `l1`.`id`,`l2`.`name`,`l1`.`name`) AS `l2_name` from (`labels` `l1` join `labels` `l2`) where `l1`.`id` <> `l2`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `national_cuisine_average_score`
--

/*!50001 DROP VIEW IF EXISTS `national_cuisine_average_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `national_cuisine_average_score` AS select `csinc`.`national_cuisine` AS `national_cuisine`,avg(`jrc`.`score`) AS `mean_score` from (`chef_specializes_in_national_cuisine` `csinc` join `judge_rates_chef` `jrc` on(`csinc`.`chef_id` = `jrc`.`chef_id`)) group by `csinc`.`national_cuisine` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recipe_has_label_pair`
--

/*!50001 DROP VIEW IF EXISTS `recipe_has_label_pair`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recipe_has_label_pair` AS select `rhl1`.`recipe_id` AS `recipe_id`,`lp`.`l1_id` AS `l1_id`,`lp`.`l2_id` AS `l2_id`,`lp`.`l1_name` AS `l1_name`,`lp`.`l2_name` AS `l2_name` from ((`label_pairs` `lp` join `recipe_has_label` `rhl1` on(`lp`.`l1_id` = `rhl1`.`label_id`)) join `recipe_has_label` `rhl2` on(`lp`.`l2_id` = `rhl2`.`label_id`)) where `rhl1`.`recipe_id` = `rhl2`.`recipe_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 21:52:44
