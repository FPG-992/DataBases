-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `chef_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int NOT NULL,
  `expertise_years` int NOT NULL,
  `expertise_national_cousine_id` int NOT NULL,
  `chef_type` enum('Γ μάγειρας','Β μάγειρας','Α μάγειρας','Βοηθός αρχιμάγειρα','αρχιμάγειρας') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`chef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` (`chef_id`, `first_name`, `last_name`, `phone_number`, `date_of_birth`, `age`, `expertise_years`, `expertise_national_cousine_id`, `chef_type`) VALUES (1,'Μαύρος','Κυριακόπουλος','+30 26 04234850','1997-08-19',26,8,43,'Γ μάγειρας'),(4,'Θεμιστοκλής','Βέργας','+30 63 15644515','1975-02-20',49,31,20,'Α μάγειρας'),(5,'Αθηνά','Σταματιάδης','+306677054415','1997-04-11',27,9,14,'Βοηθός αρχιμάγειρα'),(6,'Ηλέκτρα','Λασκαρού','+30 2451 186640','1983-01-21',41,23,12,'Α μάγειρας'),(7,'Βελισσάριος','Γρηγοριάδου','6285 199729','1972-09-18',51,33,15,'Α μάγειρας'),(9,'Θεοχάρης','Φλέσσας','6668677045','1988-11-14',35,17,41,'Α μάγειρας'),(11,'Τίμων','Σταματιάδου','6492 105810','1991-09-26',32,14,28,'αρχιμάγειρας'),(12,'Εύα','Αναγνωστόπουλος','2143975800','1972-09-10',51,33,16,'Γ μάγειρας'),(14,'Ευρυδίκη','Ελευθεριάδης','+306047269192','1971-08-09',52,34,40,'Α μάγειρας'),(15,'Ανδροκλής','Αλεξίου','6240 936375','2002-04-23',22,4,20,'Γ μάγειρας'),(16,'Σμαράγδα','Ρούσσος','6962 826023','2002-05-23',21,3,24,'Β μάγειρας'),(18,'Δωρόθεος','Γεωργίου','+30 62 95330823','1977-02-27',47,29,17,'Α μάγειρας'),(19,'Θεοφύλακτη','Μαυρλίδης','+30 24 87032897','1987-03-02',37,19,10,'Β μάγειρας'),(20,'Μαρίνος','Ηλιοπούλου','6910 207277','2004-01-25',20,2,2,'Βοηθός αρχιμάγειρα'),(22,'Φωτεινός','Ιωάννου','+302760407320','1994-09-24',29,11,20,'Γ μάγειρας'),(23,'Χρυσόστομη','Δασκαλοπούλου','6912752294','2000-09-15',23,5,9,'Βοηθός αρχιμάγειρα'),(24,'Χαρίτος','Αναστασιάδης','6719 261010','1997-04-07',27,9,28,'αρχιμάγειρας'),(25,'Νεοκλής','Παπάγος','+306840557783','1991-05-16',32,14,24,'Α μάγειρας'),(28,'Ανδρονίκη','Σελινά','+30 6807 548930','1973-07-27',50,32,38,'Α μάγειρας'),(30,'Ζηναϊς','Πρωτοβεστιάριος','+30 65 56937038','1973-12-22',50,32,29,'Γ μάγειρας'),(31,'Αλέξιος','Ξανθοπούλου','6859 407507','1971-11-15',52,34,33,'αρχιμάγειρας'),(32,'Ευγενία','Μακρή','+306503201618','1970-06-02',53,35,34,'Α μάγειρας'),(33,'Θεοφανία','Τριανταφυλλίδου','2697 844080','1980-04-29',44,26,26,'Βοηθός αρχιμάγειρα'),(35,'Ναπολέων','Λούλης','+30 25 47224156','1978-06-22',45,27,30,'αρχιμάγειρας'),(36,'Χρυσάνθη','Αντωνοπούλου','6387 021981','2004-04-17',20,2,28,'Β μάγειρας'),(38,'Περιστέρα','Καραγιάννης','2071072980','1996-04-25',28,10,5,'Α μάγειρας'),(39,'Γαληνός','Αγγελόπουλος','2128 416409','1999-04-12',25,7,28,'Βοηθός αρχιμάγειρα'),(40,'Κυριαζής','Μακρής','6421 607875','1989-05-03',35,17,36,'Β μάγειρας'),(41,'Αικατερίνη','Ράφτη','+302410267629','1992-12-06',31,13,12,'Βοηθός αρχιμάγειρα'),(43,'Ξανθός','Καπνού','+302016020814','2003-10-24',20,2,35,'Α μάγειρας'),(44,'Αμαλία','Κορωναίος','+306091139688','1983-11-23',40,22,12,'Βοηθός αρχιμάγειρα'),(45,'Αφέντρα','Καπνού','+30 23 86897398','2000-04-14',24,6,39,'Α μάγειρας'),(46,'Σπυριδούλα','Κωνσταντίνου','+30 67 00583622','1976-06-09',47,29,31,'Β μάγειρας'),(50,'Κοραλία','Θεωδωρίδης','6503 400410','1978-09-28',45,27,35,'Γ μάγειρας'),(51,'Πελαγία','Ιατρίδης','2159 783435','1986-08-29',37,19,39,'Α μάγειρας'),(52,'Δήμος','Αγγελοπούλου','2056 639245','1996-05-02',28,10,3,'Α μάγειρας'),(53,'Ευλαμπία','Φωτιάδης','+30 6742 552185','1991-10-28',32,14,26,'αρχιμάγειρας'),(54,'Νεοκλής','Τρικούπη','+302314407493','2000-08-31',23,5,35,'Α μάγειρας'),(56,'Βεατρίκη','Γεωργιάδης','2358 800772','1990-04-06',34,16,9,'Β μάγειρας'),(57,'Σώζων','Αναστασίου','2082923321','1974-06-08',49,31,28,'αρχιμάγειρας'),(58,'Πανδώρα','Βενιζέλος','+30 67 34868309','1972-04-26',52,34,26,'αρχιμάγειρας'),(62,'Σταυρούλα','Κοντολέων','+30 6991 993157','1984-11-07',39,21,4,'Β μάγειρας'),(63,'Σεραφεία','Κοκκίνου','+302896320418','2000-08-16',23,5,27,'αρχιμάγειρας'),(64,'Ασκληπιός','Ανδρέου','+30 66 94700197','1988-05-06',36,18,36,'Γ μάγειρας'),(65,'Θεοδώρα','Ανδρεάδης','+30 22 85025362','1976-06-02',47,29,14,'Β μάγειρας'),(69,'Σεμίνα','Γεωργίου','+30 2013 974092','1991-11-10',32,14,2,'Β μάγειρας'),(70,'Μεθόδιος','Φιλιππίδης','6509106620','1970-01-26',54,36,9,'Α μάγειρας'),(71,'Εφραίμ','Σκλαβούνος','6136614437','1984-07-04',39,21,42,'Γ μάγειρας'),(72,'Αθανασία','Κολιάτσος','+302947151488','1985-12-30',38,20,11,'αρχιμάγειρας'),(73,'Άριστος','Φοσκιά','6838 322186','1972-01-14',52,34,13,'Β μάγειρας'),(74,'Ερρίκος','Κωνσταντινίδου','6588911096','1988-02-04',36,18,31,'αρχιμάγειρας'),(75,'Ευσεβεία','Βαριμπόμπη','2163 764432','1992-02-09',32,14,29,'Β μάγειρας'),(76,'Τερψιχόρη','Δασκαλοπούλου','+30 28 68498118','1991-05-26',32,14,7,'Α μάγειρας'),(77,'Αποστολία','Διαμαντόπουλος','+30 6448 978137','1996-11-24',27,9,37,'Α μάγειρας'),(80,'Λύσανδρος','Βιτάλης','6270 750263','1992-02-14',32,14,31,'αρχιμάγειρας'),(81,'Φωτεινή','Ηλιόπουλος','+30 21 09442375','1989-08-05',34,16,4,'Α μάγειρας'),(82,'Αταλάντη','Αξιώτης','+30 6084 795305','1988-12-15',35,17,9,'αρχιμάγειρας'),(83,'Δημόκριτος','Ηλιάδης','6902464625','1994-10-20',29,11,36,'Α μάγειρας'),(84,'Τριαντάφυλλος','Οικονομίδης','2154 002867','2000-01-31',24,6,22,'Βοηθός αρχιμάγειρα'),(87,'Αλεξία','Γρηγοριάδου','6164838256','2004-04-27',20,2,4,'Βοηθός αρχιμάγειρα'),(88,'Σταυρούλα','Μοραΐτη','+30 6037 493561','2003-05-19',20,2,36,'αρχιμάγειρας'),(91,'Μαρία','Καραβίας','+30 65 54421627','1977-04-28',47,29,42,'Β μάγειρας'),(93,'Αλέξιος','Παναγιωτίδης','+302126191166','1992-11-07',31,13,12,'Α μάγειρας'),(94,'Ευγένιος','Θεοτόκης','+30 2050 467237','1973-07-24',50,32,21,'Βοηθός αρχιμάγειρα'),(96,'Υπαπαντή','Ηλιοπούλου','+302870808891','1985-07-27',38,20,26,'Βοηθός αρχιμάγειρα'),(97,'Αναστάσιος','Κόρακας','+302088960205','1977-03-09',47,29,25,'Α μάγειρας'),(98,'Αριστομένης','Γεννήτη','+306299236645','1974-05-17',49,31,1,'Βοηθός αρχιμάγειρα'),(99,'Ανθούλης','Μακρής','+30 2965 798295','1985-11-04',38,20,17,'Β μάγειρας'),(100,'Γερακίνα','Αποστολόπουλος','2655374756','1971-06-23',52,34,38,'Β μάγειρας'),(101,'Γρηγόριος','Βιτάλη','6307304907','1997-11-28',26,8,11,'αρχιμάγειρας'),(103,'Ορφέας','Γάσπαρη','+30 67 83915386','2005-08-09',18,0,27,'αρχιμάγειρας'),(106,'Θεόφιλος','Παπακωνσταντίνου','+306696890134','1985-08-17',38,20,15,'Α μάγειρας'),(107,'Τρυφωνία','Κορομηλάς','2693 352072','1977-05-07',47,29,34,'Βοηθός αρχιμάγειρα'),(108,'Ναπολέων','Μπλέτσας','2615824201','1974-01-18',50,32,40,'Β μάγειρας'),(110,'Παναγία','Διδασκάλου','2386 219850','1982-11-27',41,23,11,'Β μάγειρας'),(112,'Ερατώ','Ανυφαντή','2582 715683','1999-05-28',24,6,23,'Β μάγειρας'),(114,'Αναγνώστης','Παπαστεφάνου','+30 63 64935884','1989-12-22',34,16,36,'Α μάγειρας'),(115,'Φανούριος','Ράφτη','+30 2257 213518','1991-07-25',32,14,26,'Γ μάγειρας'),(116,'Ζαφείριος','Σπανού','6722233090','1977-02-12',47,29,21,'Βοηθός αρχιμάγειρα'),(117,'Λητώ','Κωνσταντίνου','+30 2394 753457','1982-06-25',41,23,27,'Γ μάγειρας'),(118,'Εύα','Δημητριάδης','2230 999440','1995-08-31',28,10,29,'Γ μάγειρας'),(121,'Θέμις','Σαμαράς','2280997429','2000-11-25',23,5,19,'Β μάγειρας'),(123,'Τρύφων','Δασκαλόπουλος','+30 6876 850757','1980-05-29',43,25,7,'Α μάγειρας'),(124,'Αντίγονος','Γεωγιάδου','6917953044','1981-03-11',43,25,21,'Β μάγειρας'),(125,'Ασημίνα','Σακελλαρίου','+30 65 13918294','1984-08-19',39,21,39,'αρχιμάγειρας'),(126,'Σεβαστιανή','Καπετανάκη','6431 139033','1985-09-24',38,20,4,'Βοηθός αρχιμάγειρα'),(127,'Γλυκερία','Παπαμάρκου','2487 124288','2005-02-24',19,1,32,'Βοηθός αρχιμάγειρα'),(128,'Παύλος','Οικονομοπούλου','+306931005290','2003-11-09',20,2,19,'Γ μάγειρας'),(129,'Ευθαλία','Αλεξόπουλος','2953 744448','1976-08-09',47,29,42,'Β μάγειρας'),(130,'Μαρίνα','Φοσκιά','2902 462803','2003-09-17',20,2,24,'Β μάγειρας'),(131,'Βάγια','Κοσμόπουλος','2368 963739','1972-08-30',51,33,35,'Γ μάγειρας'),(132,'Δημοσθένης','Κόκκινος','6332 915593','1990-12-29',33,15,15,'Βοηθός αρχιμάγειρα'),(133,'Αθανάσιος','Χαραλαμπίδου','2854 154386','1976-05-02',48,30,15,'Γ μάγειρας'),(135,'Ανθούλης','Παπαϊωάννου','+30 66 98468919','1971-06-12',52,34,27,'Β μάγειρας'),(136,'Ινώ','Παπαγεωργίου','2629 609308','1972-12-15',51,33,5,'αρχιμάγειρας'),(137,'Βαρδής','Δημητριάδου','6906178425','1996-11-12',27,9,29,'Γ μάγειρας'),(138,'Κυριαζής','Μακρής','6596 681749','1972-08-07',51,33,43,'Γ μάγειρας'),(141,'Αποστολία','Γεννήτη','2124 568861','2000-02-11',24,6,1,'Α μάγειρας'),(142,'Θεόπιστος','Οικονόμου','2699 473945','1976-07-29',47,29,2,'Βοηθός αρχιμάγειρα'),(143,'Αιμιλία','Γούσιος','+30 69 25508167','1986-01-27',38,20,8,'αρχιμάγειρας'),(145,'Πανδώρα','Ελευθερίου','+30 68 58518094','1999-11-01',24,6,31,'Β μάγειρας'),(147,'Κλήμης','Ρούσσος','6357 058977','1986-06-06',37,19,2,'Βοηθός αρχιμάγειρα'),(151,'Σάββας','Καπνού','2131970966','1982-05-31',41,23,4,'Γ μάγειρας'),(156,'Σουμέλα','Ιωάννου','+30 25 60947247','1982-06-29',41,23,15,'Γ μάγειρας'),(157,'Λαυρέντιος','Ανδρέου','+30 2023 993024','1975-12-20',48,30,16,'Γ μάγειρας'),(158,'Μεγακλής','Καπνού','+30 2937 055924','1984-03-29',40,22,35,'Α μάγειρας'),(159,'Ισίδωρος','Κωνσταντόπουλος','+30 60 85296428','1998-01-19',26,8,43,'Α μάγειρας'),(160,'Γκίκας','Ανυφαντή','+30 2546 186074','1988-06-17',35,17,23,'Α μάγειρας'),(162,'Κλεομένης','Θεοτόκου','+30 25 85797582','1972-04-01',52,34,28,'Β μάγειρας'),(163,'Αφέντης','Παπαστάμου','6754 199150','1998-11-16',25,7,28,'Γ μάγειρας'),(165,'Κλειώ','Αναστασίου','2527 616127','1975-10-24',48,30,11,'Γ μάγειρας'),(166,'Γλαύκη','Γεννήτη','+30 2622 192502','1999-03-27',25,7,13,'Γ μάγειρας'),(167,'Βασίλειος','Βαρουξής','+306663442780','1973-12-25',50,32,34,'Γ μάγειρας'),(170,'Ζωή','Παναγιωτίδης','6836524960','1988-06-24',35,17,2,'Β μάγειρας'),(171,'Θηρεσία','Παπακώστας','6813623296','2001-02-19',23,5,34,'αρχιμάγειρας'),(173,'Σέργιος','Διαμαντόπουλος','+30 6988 745889','2000-08-26',23,5,36,'Βοηθός αρχιμάγειρα'),(174,'Λουκία','Ευσταθιάδης','+302046372998','1981-12-27',42,24,33,'Α μάγειρας'),(175,'Μιλτιάδης','Μάκρη','6570963691','2005-01-03',19,1,15,'αρχιμάγειρας'),(176,'Φωκίων','Μυλωνά','6925292968','1973-04-20',51,33,19,'Γ μάγειρας'),(178,'Καλλιρρόη','Σκουτέρη','6959 438692','2003-09-01',20,2,5,'Α μάγειρας'),(180,'Θεοχάρης','Θεοτόκου','+30 21 04273453','1974-01-24',50,32,10,'αρχιμάγειρας'),(182,'Δίκαιος','Πανταζής','+30 2151 603157','1975-10-27',48,30,36,'Γ μάγειρας'),(183,'Δαμασκηνός','Καραγιάννης','+30 24 12023869','1989-04-03',35,17,21,'Β μάγειρας'),(185,'Μελένια','Σταματιάδου','2230418306','1992-12-14',31,13,37,'αρχιμάγειρας'),(186,'Καλλίνικος','Κόκκινος','+30 65 03033542','2001-05-03',23,5,35,'αρχιμάγειρας'),(187,'Πέτρος','Βαρουξής','+302068901804','2005-02-13',19,1,23,'Γ μάγειρας'),(189,'Δήμητρα','Λάσκαρη','+30 64 36919538','1970-05-22',53,35,11,'Βοηθός αρχιμάγειρα'),(190,'Δαμασκηνή','Κορωναίος','+302101310977','1981-08-04',42,24,25,'Β μάγειρας'),(192,'Θεοφύλακτη','Ηλιοπούλου','+30 2913 632234','1992-10-09',31,13,7,'Γ μάγειρας'),(194,'Σελήνη','Θεωδωροπούλου','+30 2515 478813','1997-11-17',26,8,2,'Β μάγειρας'),(195,'Στέφανος','Παπαδοπούλου','+30 2188 472612','1974-07-20',49,31,33,'Γ μάγειρας'),(196,'Μαρκέλλα','Φιλιππίδης','+30 25 00003017','1996-11-05',27,9,27,'αρχιμάγειρας'),(197,'Παναγιώτης','Αλεξάνδρου','6735165029','1992-06-12',31,13,38,'Α μάγειρας'),(198,'Θεόπιστος','Αλεξάνδρου','+302092864761','1981-10-28',42,24,22,'Βοηθός αρχιμάγειρα'),(200,'Σωτηρία','Ευσταθιάδης','+30 2419 827185','1984-12-08',39,21,40,'Βοηθός αρχιμάγειρα');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooking_steps`
--

DROP TABLE IF EXISTS `cooking_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooking_steps` (
  `step_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`step_id`),
  UNIQUE KEY `step_id` (`step_id`),
  KEY `cooking_steps_fk_recipes` (`recipe_id`),
  CONSTRAINT `cooking_steps_fk_recipes` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_steps`
--

LOCK TABLES `cooking_steps` WRITE;
/*!40000 ALTER TABLE `cooking_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `cooking_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode_chef_cousine`
--

DROP TABLE IF EXISTS `episode_chef_cousine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode_chef_cousine` (
  `episode_id` int NOT NULL,
  `chef_id` int NOT NULL,
  `national_cousine_id` int NOT NULL,
  `rating_1` enum('1','2','3','4','5') DEFAULT NULL,
  `rating_2` enum('1','2','3','4','5') DEFAULT NULL,
  `rating_3` enum('1','2','3','4','5') DEFAULT NULL,
  PRIMARY KEY (`episode_id`,`chef_id`,`national_cousine_id`),
  KEY `episode_chef_cousine_fk_chef` (`chef_id`),
  KEY `episode_chef_cousine_fk_national_cousine` (`national_cousine_id`),
  CONSTRAINT `episode_chef_cousine_fk_chef` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`) ON DELETE CASCADE,
  CONSTRAINT `episode_chef_cousine_fk_national_cousine` FOREIGN KEY (`national_cousine_id`) REFERENCES `national_cousine` (`national_cousine_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode_chef_cousine`
--

LOCK TABLES `episode_chef_cousine` WRITE;
/*!40000 ALTER TABLE `episode_chef_cousine` DISABLE KEYS */;
/*!40000 ALTER TABLE `episode_chef_cousine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode_judge`
--

DROP TABLE IF EXISTS `episode_judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode_judge` (
  `episode_id` int NOT NULL,
  `chef_id` int NOT NULL,
  PRIMARY KEY (`episode_id`,`chef_id`),
  KEY `episode_judge_fk_chef` (`chef_id`),
  CONSTRAINT `episode_judge_fk_chef` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode_judge`
--

LOCK TABLES `episode_judge` WRITE;
/*!40000 ALTER TABLE `episode_judge` DISABLE KEYS */;
/*!40000 ALTER TABLE `episode_judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `equipment_manual` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`equipment_id`),
  UNIQUE KEY `equipment_id` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_tags`
--

DROP TABLE IF EXISTS `extra_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_tags` (
  `name` varchar(30) NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`name`,`recipe_id`),
  KEY `extra_tags_fk_recipes` (`recipe_id`),
  CONSTRAINT `extra_tags_fk_recipes` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_tags`
--

LOCK TABLES `extra_tags` WRITE;
/*!40000 ALTER TABLE `extra_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_group`
--

DROP TABLE IF EXISTS `ingredient_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_group` (
  `name` varchar(30) NOT NULL,
  `description` varchar(90) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_group`
--

LOCK TABLES `ingredient_group` WRITE;
/*!40000 ALTER TABLE `ingredient_group` DISABLE KEYS */;
INSERT INTO `ingredient_group` (`name`, `description`) VALUES ('Animal Fat','Various types of animal fats including lard, tallow, and chicken fat.'),('Beverage','Various types of beverages including plant-based milks.'),('Dairy','Dairy products such as milk, cheese, and yogurt.'),('Fruit','Fruits such as apples, bananas, and berries.'),('Grain','Grains including rice, oats, and wheat.'),('Legumes','Legumes such as beans, lentils, and chickpeas.'),('Meat','Various types of meat including beef, pork, and poultry.'),('Nuts','Various types of nuts and seeds.'),('Oil','Various types of cooking oils.'),('Protein','Various protein-rich foods.'),('Seafood','Various types of seafood including fish and shellfish.'),('Spread','Spreads including peanut butter, tahini, and hummus.'),('Sweetener','Natural and artificial sweeteners.'),('Vegetable','Vegetables including leafy greens, roots, and tubers.');
/*!40000 ALTER TABLE `ingredient_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `calories_fat_p100` int NOT NULL,
  `calories_protein_p100` int NOT NULL,
  `calories_carbohydrates_p100` int NOT NULL,
  `total_calories` int NOT NULL,
  PRIMARY KEY (`ingredient_id`),
  UNIQUE KEY `ingredient_id` (`ingredient_id`),
  KEY `ingredient_group_fk_recipes` (`group_name`),
  CONSTRAINT `ingredient_group_fk_recipes` FOREIGN KEY (`group_name`) REFERENCES `ingredient_group` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` (`ingredient_id`, `name`, `group_name`, `calories_fat_p100`, `calories_protein_p100`, `calories_carbohydrates_p100`, `total_calories`) VALUES (1,'Apple','Fruit',0,0,14,52),(2,'Banana','Fruit',0,1,23,96),(3,'Beef','Meat',20,26,0,250),(4,'Chicken Breast','Meat',4,31,0,165),(5,'Salmon','Seafood',13,20,0,208),(6,'Broccoli','Vegetable',0,3,7,34),(7,'Carrot','Vegetable',0,1,10,41),(8,'Rice','Grain',0,2,28,130),(9,'Potato','Vegetable',0,2,17,77),(10,'Tomato','Vegetable',0,1,4,18),(11,'Cheddar Cheese','Dairy',33,25,1,402),(12,'Milk','Dairy',1,3,5,42),(13,'Yogurt','Dairy',0,4,7,61),(14,'Almonds','Nuts',49,21,22,576),(15,'Oats','Grain',7,17,66,389),(16,'Eggs','Protein',10,13,1,155),(17,'Butter','Dairy',81,1,0,717),(18,'Olive Oil','Oil',100,0,0,884),(19,'Spinach','Vegetable',0,3,4,23),(20,'Orange','Fruit',0,1,12,47),(21,'Peanut Butter','Spread',50,25,20,588),(22,'Strawberries','Fruit',0,1,8,32),(23,'Pork','Meat',21,27,0,242),(24,'Tofu','Protein',5,8,2,76),(25,'Lentils','Legumes',1,9,20,116),(26,'Chickpeas','Legumes',3,19,27,164),(27,'Cucumber','Vegetable',0,1,4,16),(28,'Bell Pepper','Vegetable',0,1,6,26),(29,'Mushroom','Vegetable',0,3,3,22),(30,'Peas','Vegetable',0,5,14,81),(31,'Shrimp','Seafood',1,24,0,99),(32,'Quinoa','Grain',6,14,64,368),(33,'Walnuts','Nuts',65,15,14,654),(34,'Avocado','Fruit',15,2,9,160),(35,'Blueberries','Fruit',0,1,14,57),(36,'Pineapple','Fruit',0,1,13,50),(37,'Mango','Fruit',0,1,15,60),(38,'Garlic','Vegetable',1,2,33,149),(39,'Ginger','Vegetable',1,2,18,80),(40,'Honey','Sweetener',0,0,82,304),(41,'Kale','Vegetable',2,4,9,49),(42,'Cauliflower','Vegetable',0,2,5,25),(43,'Pumpkin','Vegetable',0,1,4,20),(44,'Zucchini','Vegetable',0,1,3,17),(45,'Cabbage','Vegetable',0,1,6,25),(46,'Brussels Sprouts','Vegetable',0,3,9,43),(47,'Beets','Vegetable',0,2,10,43),(48,'Grapes','Fruit',0,1,17,69),(49,'Watermelon','Fruit',0,1,8,30),(50,'Lemon','Fruit',0,1,9,29),(51,'Pomegranate','Fruit',1,2,19,83),(52,'Blackberries','Fruit',1,1,10,43),(53,'Raspberries','Fruit',1,1,12,52),(54,'Peach','Fruit',0,1,10,39),(55,'Plum','Fruit',0,1,11,46),(56,'Cherries','Fruit',0,1,12,50),(57,'Coconut','Fruit',33,3,15,354),(58,'Pear','Fruit',0,0,15,57),(59,'Kiwi','Fruit',1,1,15,61),(60,'Apricot','Fruit',0,1,11,48),(61,'Nectarine','Fruit',0,1,11,44),(62,'Tangerine','Fruit',0,1,13,53),(63,'Lychee','Fruit',0,1,17,66),(64,'Papaya','Fruit',0,1,11,43),(65,'Passion Fruit','Fruit',0,2,23,97),(66,'Persimmon','Fruit',0,1,18,81),(67,'Dragon Fruit','Fruit',0,1,11,50),(68,'Star Fruit','Fruit',0,1,6,31),(69,'Durian','Fruit',5,3,27,147),(70,'Jackfruit','Fruit',1,2,23,95),(71,'Guava','Fruit',1,3,14,68),(72,'Fig','Fruit',0,1,19,74),(73,'Dates','Fruit',0,3,75,282),(74,'Raisins','Fruit',1,3,79,299),(75,'Almond Milk','Beverage',1,0,0,13),(76,'Soy Milk','Beverage',2,3,3,33),(77,'Coconut Milk','Beverage',24,2,6,230),(78,'Oat Milk','Beverage',2,1,7,43),(79,'Rice Milk','Beverage',1,0,9,47),(80,'Cashew Milk','Beverage',2,1,2,25),(81,'Hemp Milk','Beverage',6,2,0,33),(82,'Maple Syrup','Sweetener',0,0,67,260),(83,'Molasses','Sweetener',0,0,75,290),(84,'Agave Nectar','Sweetener',0,0,76,310),(85,'Brown Rice','Grain',2,3,23,110),(86,'Barley','Grain',1,2,22,100),(87,'Buckwheat','Grain',3,3,19,92),(88,'Millet','Grain',4,4,23,119),(89,'Sorghum','Grain',2,3,20,97),(90,'Amaranth','Grain',2,4,19,102),(91,'Teff','Grain',2,4,23,122),(92,'Spelt','Grain',1,3,21,111),(93,'Rye','Grain',2,3,21,110),(94,'Farro','Grain',1,3,22,105),(95,'Freekeh','Grain',2,3,22,110),(96,'Kamut','Grain',3,3,21,113),(97,'Polenta','Grain',0,2,18,78),(98,'Orzo','Grain',1,4,25,130),(99,'Arborio Rice','Grain',0,2,28,130),(100,'Couscous','Grain',0,4,23,112),(101,'Tempeh','Protein',11,19,9,193),(102,'Seitan','Protein',2,21,3,118),(103,'Hummus','Spread',6,8,14,166),(104,'Tahini','Spread',53,17,21,595),(105,'Almond Butter','Spread',50,21,20,614),(106,'Cashew Butter','Spread',47,18,26,574),(107,'Sunflower Seed Butter','Spread',51,17,21,617),(108,'Pumpkin Seed','Nuts',49,19,15,574),(109,'Chia Seeds','Nuts',31,17,42,486),(110,'Flax Seeds','Nuts',42,18,29,534),(111,'Hemp Seeds','Nuts',49,32,8,553),(112,'Sesame Seeds','Nuts',50,18,23,573),(113,'Sunflower Seeds','Nuts',51,21,20,584),(114,'Poppy Seeds','Nuts',42,21,28,525),(115,'Pine Nuts','Nuts',68,14,13,673),(116,'Macadamia Nuts','Nuts',76,8,14,718),(117,'Pistachios','Nuts',45,21,28,562),(118,'Hazelnuts','Nuts',61,15,17,628),(119,'Brazil Nuts','Nuts',66,14,12,656),(120,'Pecans','Nuts',72,9,14,691),(121,'Walnuts','Nuts',65,15,14,654),(122,'Almonds','Nuts',49,21,22,576),(123,'Coconut Oil','Oil',100,0,0,884),(124,'Avocado Oil','Oil',100,0,0,884),(125,'Canola Oil','Oil',100,0,0,884),(126,'Grapeseed Oil','Oil',100,0,0,884),(127,'Sesame Oil','Oil',100,0,0,884),(128,'Peanut Oil','Oil',100,0,0,884),(129,'Sunflower Oil','Oil',100,0,0,884),(130,'Vegetable Oil','Oil',100,0,0,884),(131,'Butter','Dairy',81,1,0,717),(132,'Ghee','Dairy',100,0,0,900),(133,'Lard','Animal Fat',100,0,0,884),(134,'Beef Tallow','Animal Fat',100,0,0,884),(135,'Chicken Fat','Animal Fat',100,0,0,884),(136,'Duck Fat','Animal Fat',100,0,0,884),(137,'Bacon','Meat',42,37,1,541),(138,'Ham','Meat',9,17,2,145),(139,'Turkey','Meat',7,29,0,189),(140,'Venison','Meat',8,30,0,158),(141,'Lamb','Meat',21,25,0,294),(142,'Veal','Meat',7,31,0,172),(143,'Buffalo','Meat',8,28,0,143),(144,'Elk','Meat',8,30,0,156),(145,'Rabbit','Meat',8,21,0,173),(146,'Goat','Meat',3,27,0,143),(147,'Quail','Meat',6,22,0,153),(148,'Ostrich','Meat',2,29,0,142),(149,'Squid','Seafood',1,15,2,92),(150,'Octopus','Seafood',1,15,2,82),(151,'Clams','Seafood',2,14,4,74),(152,'Mussels','Seafood',2,18,4,86),(153,'Oysters','Seafood',3,9,5,68),(154,'Scallops','Seafood',1,14,5,69),(155,'Crab','Seafood',2,19,0,87),(156,'Lobster','Seafood',1,19,0,89),(157,'Crawfish','Seafood',1,19,0,77),(158,'Seaweed','Seafood',1,2,9,45),(159,'Kombu','Seafood',0,2,6,43),(160,'Nori','Seafood',0,6,5,35),(161,'Wakame','Seafood',1,3,9,45),(162,'Arugula','Vegetable',1,3,4,25),(163,'Bok Choy','Vegetable',0,2,2,13),(164,'Collard Greens','Vegetable',0,3,4,32),(165,'Swiss Chard','Vegetable',0,2,4,19),(166,'Mustard Greens','Vegetable',0,3,5,27),(167,'Turnip Greens','Vegetable',0,2,4,19),(168,'Endive','Vegetable',0,1,3,17),(169,'Radicchio','Vegetable',0,1,5,23),(170,'Watercress','Vegetable',0,2,1,11),(171,'Butternut Squash','Vegetable',0,1,12,45),(172,'Acorn Squash','Vegetable',0,1,10,40),(173,'Spaghetti Squash','Vegetable',1,1,7,31),(174,'Kohlrabi','Vegetable',0,2,6,27),(175,'Parsnips','Vegetable',0,1,17,75),(176,'Rutabaga','Vegetable',0,1,9,38),(177,'Turnips','Vegetable',0,1,6,28),(178,'Taro','Vegetable',0,2,26,112),(179,'Cassava','Vegetable',0,1,38,160),(180,'Yam','Vegetable',0,2,28,118),(181,'Jicama','Vegetable',0,1,9,38),(182,'Lotus Root','Vegetable',0,2,17,74),(183,'Daikon','Vegetable',0,1,4,18),(184,'Celery Root','Vegetable',0,2,9,42),(185,'Horseradish','Vegetable',0,1,11,48),(186,'Bamboo Shoots','Vegetable',0,3,5,27),(187,'Snow Peas','Vegetable',0,3,8,42),(188,'Fava Beans','Legumes',1,8,19,110),(189,'Edamame','Legumes',5,11,8,122),(190,'Navy Beans','Legumes',1,8,27,142),(191,'Kidney Beans','Legumes',1,9,23,127),(192,'Pinto Beans','Legumes',1,9,21,122),(193,'Black Beans','Legumes',1,9,23,132),(194,'Great Northern Beans','Legumes',1,8,23,128),(195,'Lima Beans','Legumes',0,8,20,115),(196,'Garbanzo Beans','Legumes',3,9,27,164),(197,'Green Beans','Legumes',0,2,7,31),(198,'Adzuki Beans','Legumes',0,8,29,128),(199,'Mung Beans','Legumes',0,7,19,105),(200,'Soybeans','Legumes',9,17,10,173);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients_recipe`
--

DROP TABLE IF EXISTS `ingredients_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients_recipe` (
  `ingredient_recipe_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `quantity` int NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`ingredient_recipe_id`),
  UNIQUE KEY `ingredient_recipe_id` (`ingredient_recipe_id`),
  KEY `ingredients_recipe_fk_recipes` (`recipe_id`),
  CONSTRAINT `ingredients_recipe_fk_recipes` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients_recipe`
--

LOCK TABLES `ingredients_recipe` WRITE;
/*!40000 ALTER TABLE `ingredients_recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredients_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `national_cousine`
--

DROP TABLE IF EXISTS `national_cousine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `national_cousine` (
  `national_cousine_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`national_cousine_id`),
  UNIQUE KEY `national_cousine_id` (`national_cousine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `national_cousine`
--

LOCK TABLES `national_cousine` WRITE;
/*!40000 ALTER TABLE `national_cousine` DISABLE KEYS */;
INSERT INTO `national_cousine` (`national_cousine_id`, `name`) VALUES (1,'Ethiopian'),(2,'American'),(3,'Finnish'),(4,'Chilean'),(5,'Thai'),(6,'Polish'),(7,'Irish'),(8,'Peruvian'),(9,'Uzbek'),(10,'Portuguese'),(11,'Sicilian'),(12,'Singaporean'),(13,'Andalusian'),(14,'Greek'),(15,'Russian'),(16,'Israeli'),(17,'African'),(18,'Icelandic'),(19,'Iranian'),(20,'Maltese'),(21,'Malaysian'),(22,'Ecuadorian'),(23,'Philippine'),(24,'Hungarian'),(25,'Argentine'),(26,'Moroccan'),(27,'Republic'),(28,'Jamaican'),(29,'Korean'),(30,'Italian'),(31,'Brazilian'),(32,'Palestinian'),(33,'Vietnamese'),(34,'Norwegian'),(35,'Nepalese'),(36,'Japanese'),(37,'Mexican'),(38,'Sámi'),(39,'Burmese'),(40,'Bangladeshi'),(41,'Tibetan'),(42,'Indian'),(43,'Chinese');
/*!40000 ALTER TABLE `national_cousine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_equipment`
--

DROP TABLE IF EXISTS `recipe_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_equipment` (
  `recipe_equipment_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  PRIMARY KEY (`recipe_equipment_id`),
  UNIQUE KEY `recipe_equipment_id` (`recipe_equipment_id`),
  KEY `recipe_equipment_fk_recipes` (`recipe_id`),
  KEY `recipe_equipment_fk_equipment` (`equipment_id`),
  CONSTRAINT `recipe_equipment_fk_equipment` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_equipment_fk_recipes` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_equipment`
--

LOCK TABLES `recipe_equipment` WRITE;
/*!40000 ALTER TABLE `recipe_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_time`
--

DROP TABLE IF EXISTS `recipe_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_time` (
  `recipe_id` int NOT NULL,
  `preparation_time` int NOT NULL,
  `cooking_time` int NOT NULL,
  PRIMARY KEY (`recipe_id`),
  UNIQUE KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `recipe_time_fk_recipes` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_time`
--

LOCK TABLES `recipe_time` WRITE;
/*!40000 ALTER TABLE `recipe_time` DISABLE KEYS */;
INSERT INTO `recipe_time` (`recipe_id`, `preparation_time`, `cooking_time`) VALUES (1,20,45),(2,15,60),(3,10,30),(4,10,20),(5,10,15),(6,15,30),(7,20,40),(8,10,15),(9,10,20),(10,10,20),(11,15,25),(12,5,0),(13,15,25),(14,15,20),(15,10,0),(16,10,20),(17,5,0),(18,15,20),(19,15,20),(20,10,20),(21,10,20),(22,10,15),(23,10,20),(24,10,15),(25,15,30),(26,10,20),(27,10,30),(28,15,60),(29,10,10),(30,15,30),(31,5,0),(32,5,0),(33,15,20),(34,10,15),(35,5,0),(36,15,30),(37,10,0),(38,10,0),(39,15,10),(40,30,60),(41,10,20),(42,10,15),(43,10,30),(44,10,0),(45,10,0),(46,10,20),(47,15,20),(48,10,20),(49,10,0),(50,15,30),(51,10,15),(52,15,30),(53,10,20),(54,20,45),(55,10,15),(56,15,30),(57,15,20),(58,20,60),(59,10,15),(60,10,15),(61,20,45),(62,15,30),(63,15,45),(64,15,30),(65,10,20),(66,15,30),(67,10,0),(68,10,15),(69,10,15),(70,15,45),(71,10,15),(72,15,30),(73,10,20),(74,15,30),(75,10,20),(76,10,15),(77,10,20),(78,10,20),(79,10,15),(80,10,20),(81,10,15),(82,15,20),(83,10,20),(84,10,20),(85,10,15),(86,10,20),(87,10,20),(88,10,20),(89,10,20),(90,10,20),(91,10,20),(92,15,30),(93,15,20),(94,10,20),(95,10,20),(96,10,20),(97,10,15),(98,10,15),(99,10,20),(100,10,15),(101,10,20),(102,10,20),(103,5,0),(104,5,0),(105,5,0),(106,5,0),(107,10,15),(108,10,15),(109,5,0),(110,10,15),(111,5,0),(112,10,15),(113,15,30),(114,15,20),(115,10,15),(116,15,20),(117,15,30),(118,15,20),(119,15,20),(120,15,30),(121,10,15),(122,10,15),(123,10,20),(124,5,0),(125,5,0),(126,10,20),(127,10,15),(128,10,20),(129,5,0),(130,10,20),(131,15,30),(132,5,0),(133,15,30),(134,10,15),(135,10,15),(136,10,15),(137,10,15),(138,5,0),(139,15,30),(140,20,45),(141,20,45),(142,15,30),(143,10,15),(144,20,45),(145,20,45),(146,20,45),(147,15,30),(148,15,30),(149,15,30),(150,15,20),(151,20,30),(152,15,20),(153,15,30),(154,15,20),(155,15,30),(156,15,30),(157,20,45),(158,20,45),(159,20,45),(160,15,30),(161,10,15),(162,10,20),(163,10,20),(164,10,20),(165,10,15),(166,10,20),(167,10,20),(168,10,15),(169,10,15),(170,10,15),(171,10,15),(172,15,30),(173,15,30),(174,10,15),(175,10,20),(176,10,20),(177,10,20),(178,10,15),(179,10,15),(180,15,30),(181,10,15),(182,10,20),(183,10,20),(184,10,15),(185,10,15),(186,10,10),(187,10,10),(188,10,15),(189,10,20),(190,15,40),(191,15,30),(192,10,15),(193,10,20),(194,10,15),(195,10,20),(196,10,15),(197,10,20),(198,15,40),(199,10,10),(200,10,15);
/*!40000 ALTER TABLE `recipe_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `description` varchar(120) NOT NULL,
  `is_bakery` tinyint(1) NOT NULL,
  `difficulty_level` enum('1','2','3','4','5') NOT NULL,
  `national_cousine_id` int NOT NULL,
  `main_igredient_id` int NOT NULL,
  `meal_type` varchar(255) NOT NULL,
  PRIMARY KEY (`recipe_id`),
  UNIQUE KEY `recipe_id` (`recipe_id`),
  KEY `recipe_fk_national_cousine` (`national_cousine_id`),
  KEY `recipe_fk_ingredients` (`main_igredient_id`),
  KEY `recipes_meal_type_fk` (`meal_type`),
  CONSTRAINT `recipe_fk_ingredients` FOREIGN KEY (`main_igredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_fk_national_cousine` FOREIGN KEY (`national_cousine_id`) REFERENCES `national_cousine` (`national_cousine_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` (`recipe_id`, `name`, `description`, `is_bakery`, `difficulty_level`, `national_cousine_id`, `main_igredient_id`, `meal_type`) VALUES (1,'Apple Pie','Classic American dessert with apples and cinnamon.',1,'3',2,1,'tea'),(2,'Banana Bread','Moist and delicious banana bread with walnuts.',1,'2',2,2,'brunch'),(3,'Beef Stroganoff','Creamy beef dish with mushrooms and sour cream.',0,'4',15,3,'dinner'),(4,'Grilled Chicken Breast','Juicy grilled chicken breast with herbs.',0,'2',30,4,'lunch'),(5,'Salmon Teriyaki','Grilled salmon with a sweet and savory teriyaki glaze.',0,'3',36,5,'lunch'),(6,'Broccoli Cheddar Soup','Creamy soup with broccoli and cheddar cheese.',0,'2',30,6,'brunch'),(7,'Carrot Cake','Spiced carrot cake with cream cheese frosting.',1,'3',2,7,'tea'),(8,'Vegetable Fried Rice','Fried rice with mixed vegetables and soy sauce.',0,'2',33,8,'lunch'),(9,'Mashed Potatoes','Creamy mashed potatoes with butter and garlic.',0,'1',30,9,'brunch'),(10,'Tomato Soup','Classic tomato soup with basil and cream.',0,'1',30,10,'brunch'),(11,'Cheddar Biscuits','Flaky biscuits with sharp cheddar cheese.',1,'2',30,11,'tea'),(12,'Yogurt Parfait','Layered yogurt with granola and fresh fruit.',0,'1',30,13,'breakfast'),(13,'Almond Crusted Chicken','Chicken breast crusted with almonds and baked.',0,'3',30,14,'lunch'),(14,'Oatmeal Cookies','Chewy oatmeal cookies with raisins.',1,'2',30,15,'elevenses'),(15,'Spinach Salad','Fresh spinach salad with a light vinaigrette.',0,'1',30,19,'brunch'),(16,'Orange Chicken','Sweet and tangy orange chicken stir-fry.',0,'3',1,20,'lunch'),(17,'Peanut Butter Smoothie','Creamy smoothie with peanut butter and bananas.',0,'1',2,21,'breakfast'),(18,'Strawberry Shortcake','Classic shortcake with fresh strawberries and whipped cream.',1,'2',30,22,'tea'),(19,'Pork Chops','Juicy pork chops with a savory herb crust.',0,'3',30,23,'dinner'),(20,'Vegetarian Tofu Stir-Fry','Stir-fried tofu with mixed vegetables.',0,'2',5,24,'lunch'),(21,'Banana Pancakes','Fluffy banana pancakes with maple syrup.',1,'1',2,2,'breakfast'),(22,'Beef Tacos','Spicy beef tacos with salsa and cheese.',0,'2',37,3,'dinner'),(23,'Chicken Stir Fry','Quick stir fry with chicken and vegetables.',0,'2',36,4,'dinner'),(24,'Salmon Salad','Fresh salmon salad with a lemon vinaigrette.',0,'1',36,5,'supper'),(25,'Broccoli Casserole','Cheesy broccoli casserole with a crunchy topping.',0,'2',2,6,'supper'),(26,'Carrot Soup','Creamy carrot soup with a hint of ginger.',0,'1',2,7,'breakfast'),(27,'Rice Pudding','Classic rice pudding with cinnamon.',1,'1',30,8,'brunch'),(28,'Potato Gratin','Layered potato gratin with cheese and cream.',0,'3',30,9,'brunch'),(29,'Tomato Bruschetta','Toasted bread topped with tomato and basil.',0,'1',30,10,'dinner'),(30,'Cheddar Mac and Cheese','Creamy mac and cheese with sharp cheddar.',1,'2',2,11,'brunch'),(31,'Milkshake','Classic vanilla milkshake.',0,'1',30,12,'breakfast'),(32,'Yogurt Smoothie','Healthy smoothie with yogurt and berries.',0,'1',30,13,'breakfast'),(33,'Almond Crusted Fish','Baked fish with an almond crust.',0,'3',5,14,'lunch'),(34,'Oatmeal Porridge','Warm oatmeal porridge with honey.',1,'1',2,15,'breakfast'),(35,'Scrambled Eggs','Fluffy scrambled eggs with cheese.',0,'1',30,16,'breakfast'),(36,'Butter Chicken','Rich and creamy butter chicken.',0,'3',42,17,'dinner'),(37,'Spinach and Olive Oil Salad','Simple spinach salad with olive oil.',0,'1',30,18,'brunch'),(38,'Orange Sorbet','Refreshing orange sorbet.',1,'2',2,20,'tea'),(39,'Peanut Butter Cookies','Soft and chewy peanut butter cookies.',1,'2',2,21,'elevenses'),(40,'Strawberry Cheesecake','Classic cheesecake with a strawberry topping.',1,'3',30,22,'tea'),(41,'Pork Chops','Grilled pork chops with herbs.',0,'2',30,23,'dinner'),(42,'Tofu Stir Fry','Stir-fried tofu with vegetables.',0,'2',5,24,'lunch'),(43,'Lentil Soup','Hearty lentil soup with vegetables.',0,'2',42,25,'lunch'),(44,'Chickpea Salad','Fresh chickpea salad with cucumbers and tomatoes.',0,'1',30,26,'supper'),(45,'Cucumber Sandwiches','Tea sandwiches with cucumber and cream cheese.',1,'1',2,27,'tea'),(46,'Bell Pepper Pizza','Homemade pizza with bell peppers.',0,'3',30,28,'lunch'),(47,'Mushroom Risotto','Creamy mushroom risotto.',0,'3',30,29,'lunch'),(48,'Pea Soup','Smooth pea soup with mint.',0,'1',30,30,'brunch'),(49,'Shrimp Scampi','Garlicky shrimp scampi over pasta.',0,'3',30,31,'supper'),(50,'Quinoa Salad','Healthy quinoa salad with vegetables.',0,'1',2,32,'brunch'),(51,'Walnut Brownies','Fudgy brownies with walnuts.',1,'2',2,33,'elevenses'),(52,'Avocado Toast','Avocado spread on toasted bread.',0,'1',30,34,'brunch'),(53,'Blueberry Muffins','Moist blueberry muffins.',1,'2',2,35,'elevenses'),(54,'Pineapple Upside Down Cake','Classic pineapple upside down cake.',1,'3',2,36,'tea'),(55,'Mango Salsa','Fresh mango salsa with cilantro.',0,'1',5,37,'supper'),(56,'Garlic Bread','Toasted bread with garlic butter.',0,'1',30,38,'supper'),(57,'Gingerbread Cookies','Spiced gingerbread cookies.',1,'2',2,39,'tea'),(58,'Honey Glazed Ham','Baked ham with a honey glaze.',0,'3',30,40,'lunch'),(59,'Kale Chips','Crispy baked kale chips.',0,'1',2,41,'brunch'),(60,'Cauliflower Rice','Healthy cauliflower rice.',0,'1',2,42,'dinner'),(61,'Pumpkin Pie','Classic pumpkin pie with spices.',1,'3',2,43,'tea'),(62,'Zucchini Bread','Moist zucchini bread.',1,'2',2,44,'tea'),(63,'Cabbage Rolls','Stuffed cabbage rolls with rice and meat.',0,'3',30,45,'brunch'),(64,'Brussels Sprouts with Bacon','Roasted Brussels sprouts with crispy bacon.',0,'2',30,46,'brunch'),(65,'Beet Salad','Fresh beet salad with goat cheese.',0,'1',2,47,'brunch'),(66,'Grape Jelly','Homemade grape jelly.',1,'2',2,48,'brunch'),(67,'Watermelon Sorbet','Refreshing watermelon sorbet.',1,'2',2,49,'tea'),(68,'Lemon Bars','Tangy lemon bars with a shortbread crust.',1,'2',2,50,'tea'),(69,'Pomegranate Salad','Pomegranate salad with mixed greens.',0,'1',30,51,'brunch'),(70,'Blackberry Cobbler','Warm blackberry cobbler with a biscuit topping.',1,'3',2,52,'elevenses'),(71,'Raspberry Jam','Homemade raspberry jam.',1,'2',2,53,'tea'),(72,'Peach Cobbler','Classic peach cobbler.',1,'3',2,54,'tea'),(73,'Plum Tart','Rustic plum tart with a flaky crust.',1,'3',2,55,'tea'),(74,'Cherry Pie','Classic cherry pie with a lattice crust.',1,'3',2,56,'tea'),(75,'Coconut Macaroons','Chewy coconut macaroons.',1,'2',2,57,'tea'),(76,'Pear Salad','Fresh pear salad with walnuts and blue cheese.',0,'1',2,58,'brunch'),(77,'Kiwi Sorbet','Refreshing kiwi sorbet.',1,'2',2,59,'tea'),(78,'Apricot Jam','Homemade apricot jam.',1,'2',2,60,'tea'),(79,'Nectarine Salad','Nectarine salad with arugula and goat cheese.',0,'1',2,61,'brunch'),(80,'Tangerine Chicken','Sweet and tangy tangerine chicken.',0,'3',1,62,'brunch'),(81,'Lychee Martini','Refreshing lychee martini.',0,'1',1,63,'tea'),(82,'Papaya Salad','Fresh papaya salad with a lime dressing.',0,'1',5,64,'breakfast'),(83,'Passion Fruit Sorbet','Tropical passion fruit sorbet.',1,'2',2,65,'breakfast'),(84,'Persimmon Bread','Moist persimmon bread with spices.',1,'3',2,66,'tea'),(85,'Dragon Fruit Smoothie','Exotic dragon fruit smoothie.',0,'1',2,67,'breakfast'),(86,'Star Fruit Salad','Fresh star fruit salad with mint.',0,'1',1,68,'breakfast'),(87,'Durian Ice Cream','Rich and creamy durian ice cream.',1,'3',1,69,'elevenses'),(88,'Jackfruit Curry','Spicy jackfruit curry.',0,'3',40,70,'dinner'),(89,'Guava Smoothie','Tropical guava smoothie.',0,'1',1,71,'breakfast'),(90,'Fig Tart','Rustic fig tart with a honey glaze.',1,'3',2,72,'tea'),(91,'Date Bars','Chewy date bars with oats.',1,'2',2,73,'tea'),(92,'Raisin Bread','Sweet raisin bread with cinnamon.',1,'2',2,74,'tea'),(93,'Almond Milk Latte','Creamy almond milk latte.',0,'1',2,75,'tea'),(94,'Soy Milk Smoothie','Healthy soy milk smoothie with berries.',0,'1',2,76,'breakfast'),(95,'Coconut Milk Curry','Creamy coconut milk curry with vegetables.',0,'3',40,77,'dinner'),(96,'Oat Milk Pancakes','Fluffy oat milk pancakes.',1,'1',2,78,'breakfast'),(97,'Rice Milk Pudding','Creamy rice milk pudding.',1,'1',2,79,'breakfast'),(98,'Cashew Milk Ice Cream','Rich and creamy cashew milk ice cream.',1,'3',2,80,'tea'),(99,'Hemp Milk Smoothie','Healthy hemp milk smoothie with greens.',0,'1',2,81,'dinner'),(100,'Maple Syrup Cookies','Chewy cookies with a hint of maple syrup.',1,'2',2,82,'elevenses'),(101,'Molasses Gingerbread','Spiced gingerbread with molasses.',1,'2',2,83,'elevenses'),(102,'Agave Nectar Granola','Crunchy granola sweetened with agave nectar.',1,'1',2,84,'elevenses'),(103,'Brown Rice Salad','Healthy brown rice salad with vegetables.',0,'1',2,85,'brunch'),(104,'Barley Soup','Hearty barley soup with vegetables.',0,'2',2,86,'brunch'),(105,'Buckwheat Pancakes','Fluffy buckwheat pancakes.',1,'1',2,87,'breakfast'),(106,'Millet Pilaf','Flavorful millet pilaf with vegetables.',0,'2',2,88,'lunch'),(107,'Sorghum Porridge','Warm sorghum porridge with honey.',1,'1',2,89,'breakfast'),(108,'Amaranth Salad','Fresh amaranth salad with herbs.',0,'1',2,90,'brunch'),(109,'Teff Pancakes','Fluffy teff pancakes with berries.',1,'1',2,91,'elevenses'),(110,'Spelt Bread','Rustic spelt bread with seeds.',1,'3',2,92,'elevenses'),(111,'Rye Crackers','Crispy rye crackers with herbs.',1,'2',2,93,'elevenses'),(112,'Farro Salad','Healthy farro salad with vegetables.',0,'1',2,94,'supper'),(113,'Freekeh Pilaf','Flavorful freekeh pilaf with spices.',0,'2',2,95,'dinner'),(114,'Kamut Porridge','Warm kamut porridge with maple syrup.',1,'1',2,96,'breakfast'),(115,'Polenta Fries','Crispy polenta fries with dipping sauce.',0,'2',2,97,'lunch'),(116,'Orzo Salad','Light orzo salad with lemon dressing.',0,'1',2,98,'supper'),(117,'Arborio Rice Risotto','Creamy arborio rice risotto with parmesan.',0,'3',2,99,'lunch'),(118,'Couscous Salad','Fresh couscous salad with vegetables.',0,'1',2,100,'supper'),(119,'Tempeh Stir Fry','Tempeh stir fry with vegetables.',0,'2',5,101,'lunch'),(120,'Seitan Fajitas','Spicy seitan fajitas with peppers and onions.',0,'2',30,102,'dinner'),(121,'Hummus Platter','Hummus served with pita and vegetables.',0,'1',16,103,'lunch'),(122,'Tahini Dressing','Creamy tahini dressing for salads.',0,'1',16,104,'dinner'),(123,'Almond Butter Toast','Almond butter spread on toast.',0,'1',2,105,'breakfast'),(124,'Cashew Butter Smoothie','Smoothie with cashew butter and bananas.',0,'1',2,106,'dinner'),(125,'Sunflower Seed Butter Cookies','Chewy cookies with sunflower seed butter.',1,'2',2,107,'elevenses'),(126,'Pumpkin Seed Granola','Crunchy granola with pumpkin seeds.',1,'1',2,108,'breakfast'),(127,'Chia Seed Pudding','Healthy chia seed pudding with berries.',0,'1',2,109,'lunch'),(128,'Flax Seed Muffins','Moist muffins with flax seeds.',1,'2',2,110,'elevenses'),(129,'Hemp Seed Salad','Fresh salad with hemp seeds.',0,'1',2,111,'dinner'),(130,'Sesame Seed Crackers','Crispy crackers with sesame seeds.',1,'2',2,112,'elevenses'),(131,'Sunflower Seed Bread','Rustic bread with sunflower seeds.',1,'3',2,113,'elevenses'),(132,'Poppy Seed Cake','Lemon poppy seed cake with glaze.',1,'3',2,114,'elevenses'),(133,'Pine Nut Pasta','Pasta with pine nuts and spinach.',0,'2',30,115,'lunch'),(134,'Macadamia Nut Cookies','Chewy macadamia nut cookies.',1,'2',2,116,'elevenses'),(135,'Pistachio Ice Cream','Creamy pistachio ice cream.',1,'3',2,117,'elevenses'),(136,'Hazelnut Spread','Homemade hazelnut spread with chocolate.',1,'2',2,118,'elevenses'),(137,'Brazil Nut Brownies','Fudgy brownies with brazil nuts.',1,'2',2,119,'elevenses'),(138,'Pecan Pie','Classic pecan pie with a buttery crust.',1,'3',2,120,'elevenses'),(139,'Walnut Bread','Moist walnut bread with spices.',1,'2',2,121,'elevenses'),(140,'Almond Flour Pancakes','Fluffy almond flour pancakes.',1,'1',2,122,'breakfast'),(141,'Coconut Oil Granola','Crunchy granola with coconut oil.',1,'1',2,123,'elevenses'),(142,'Avocado Oil Salad Dressing','Light salad dressing with avocado oil.',0,'1',2,124,'supper'),(143,'Canola Oil Mayonnaise','Homemade mayonnaise with canola oil.',0,'1',2,125,'dinner'),(144,'Grapeseed Oil Vinaigrette','Citrusy vinaigrette with grapeseed oil.',0,'1',2,126,'dinner'),(145,'Sesame Oil Noodles','Noodles with a sesame oil dressing.',0,'1',5,127,'lunch'),(146,'Peanut Oil Stir Fry','Stir-fry with peanut oil and vegetables.',0,'1',2,128,'lunch'),(147,'Sunflower Oil Muffins','Moist muffins with sunflower oil.',1,'2',2,129,'breakfast'),(148,'Vegetable Oil Cake','Moist cake with vegetable oil.',1,'2',2,130,'lunch'),(149,'Butter Chicken','Rich and creamy butter chicken.',0,'3',42,131,'dinner'),(150,'Ghee Rice','Fluffy rice cooked with ghee.',0,'1',42,132,'dinner'),(151,'Lard Pastry','Flaky pastry made with lard.',1,'3',2,133,'elevenses'),(152,'Beef Tallow Fries','Crispy fries cooked in beef tallow.',0,'2',2,134,'lunch'),(153,'Chicken Fat Roasted Potatoes','Roasted potatoes with chicken fat.',0,'2',2,135,'supper'),(154,'Duck Fat Potatoes','Crispy potatoes roasted in duck fat.',0,'2',2,136,'dinner'),(155,'Bacon Wrapped Asparagus','Asparagus wrapped in crispy bacon.',0,'2',2,137,'supper'),(156,'Ham and Cheese Sandwich','Classic ham and cheese sandwich.',0,'1',2,138,'lunch'),(157,'Turkey Chili','Hearty turkey chili with beans.',0,'2',30,139,'lunch'),(158,'Venison Stew','Rich venison stew with vegetables.',0,'3',30,140,'dinner'),(159,'Lamb Curry','Spicy lamb curry with rice.',0,'3',42,141,'dinner'),(160,'Veal Scallopini','Tender veal scallopini with lemon sauce.',0,'3',30,142,'supper'),(161,'Buffalo Burgers','Juicy buffalo burgers with cheese.',0,'2',30,143,'supper'),(162,'Elk Stew','Hearty elk stew with potatoes.',0,'3',30,144,'dinner'),(163,'Rabbit Stew','Rich rabbit stew with vegetables.',0,'3',30,145,'dinner'),(164,'Goat Curry','Spicy goat curry with rice.',0,'3',42,146,'dinner'),(165,'Quail Eggs Benedict','Elegant eggs benedict with quail eggs.',1,'3',2,147,'brunch'),(166,'Ostrich Steak','Juicy ostrich steak with garlic butter.',0,'3',30,148,'supper'),(167,'Squid Ink Pasta','Unique pasta with squid ink and garlic.',0,'3',30,149,'supper'),(168,'Octopus Salad','Fresh octopus salad with lemon dressing.',0,'2',30,150,'supper'),(169,'Clam Chowder','Creamy clam chowder with potatoes.',0,'3',30,151,'dinner'),(170,'Mussels in White Wine','Mussels cooked in a white wine sauce.',0,'2',30,152,'dinner'),(171,'Oyster Rockefeller','Baked oysters with spinach and cheese.',0,'3',30,153,'supper'),(172,'Scallop Ceviche','Fresh scallop ceviche with lime.',0,'2',30,154,'supper'),(173,'Crab Cakes','Delicious crab cakes with a spicy aioli.',0,'3',30,155,'dinner'),(174,'Lobster Bisque','Rich and creamy lobster bisque.',0,'3',30,156,'dinner'),(175,'Crawfish Étouffée','Spicy crawfish étouffée with rice.',0,'3',30,157,'dinner'),(176,'Seaweed Salad','Fresh seaweed salad with sesame dressing.',0,'1',5,158,'supper'),(177,'Kombu Dashi','Umami-rich kombu dashi broth.',0,'1',5,159,'breakfast'),(178,'Nori Wraps','Healthy nori wraps with vegetables.',0,'1',5,160,'brunch'),(179,'Wakame Miso Soup','Traditional wakame miso soup.',0,'1',5,161,'brunch'),(180,'Arugula Salad','Fresh arugula salad with lemon dressing.',0,'1',30,162,'lunch'),(181,'Bok Choy Stir Fry','Quick bok choy stir fry with garlic.',0,'2',36,163,'dinner'),(182,'Collard Greens with Ham','Southern-style collard greens with ham.',0,'2',30,164,'dinner'),(183,'Swiss Chard Sauté','Sautéed Swiss chard with garlic.',0,'1',30,165,'dinner'),(184,'Mustard Greens Soup','Healthy mustard greens soup.',0,'1',30,166,'dinner'),(185,'Turnip Greens and Bacon','Turnip greens cooked with bacon.',0,'2',30,167,'dinner'),(186,'Endive Salad','Crisp endive salad with a citrus vinaigrette.',0,'1',30,168,'dinner'),(187,'Radicchio Salad','Bitter radicchio salad with a sweet dressing.',0,'1',30,169,'dinner'),(188,'Watercress Soup','Refreshing watercress soup.',0,'1',30,170,'dinner'),(189,'Butternut Squash Soup','Creamy butternut squash soup.',0,'1',2,171,'dinner'),(190,'Acorn Squash Stuffed with Quinoa','Roasted acorn squash stuffed with quinoa.',0,'2',2,172,'dinner'),(191,'Spaghetti Squash Primavera','Healthy spaghetti squash primavera.',0,'2',2,173,'dinner'),(192,'Kohlrabi Slaw','Crisp kohlrabi slaw with a tangy dressing.',0,'1',2,174,'dinner'),(193,'Parsnip Soup','Creamy parsnip soup with herbs.',0,'1',2,175,'brunch'),(194,'Rutabaga Mash','Smooth rutabaga mash with butter.',0,'1',2,176,'dinner'),(195,'Turnip Soup','Comforting turnip soup with potatoes.',0,'1',2,177,'dinner'),(196,'Taro Chips','Crispy taro chips with sea salt.',0,'1',2,178,'supper'),(197,'Cassava Fries','Crispy cassava fries with dipping sauce.',0,'2',2,179,'dinner'),(198,'Yam Casserole','Sweet yam casserole with marshmallows.',0,'2',2,180,'dinner'),(199,'Jicama Salad','Fresh jicama salad with a lime dressing.',0,'1',2,181,'brunch'),(200,'Lotus Root Stir Fry','Crispy lotus root stir fry with soy sauce.',0,'2',5,182,'supper');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme` (
  `name` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_recipe`
--

DROP TABLE IF EXISTS `theme_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_recipe` (
  `theme_recipe_id` int NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(30) NOT NULL,
  `recipe_id` int NOT NULL,
  PRIMARY KEY (`theme_recipe_id`),
  UNIQUE KEY `theme_recipe_id` (`theme_recipe_id`),
  KEY `theme_recipe_fk_theme` (`theme_name`),
  KEY `theme_recipe_fk_recipes` (`recipe_id`),
  CONSTRAINT `theme_recipe_fk_recipes` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE,
  CONSTRAINT `theme_recipe_fk_theme` FOREIGN KEY (`theme_name`) REFERENCES `theme` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_recipe`
--

LOCK TABLES `theme_recipe` WRITE;
/*!40000 ALTER TABLE `theme_recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `theme_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tips`
--

DROP TABLE IF EXISTS `tips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tips` (
  `recipe_id` int NOT NULL,
  `tip_1` varchar(30) NOT NULL,
  `tip_2` varchar(30) NOT NULL,
  `tip_3` varchar(30) NOT NULL,
  PRIMARY KEY (`recipe_id`),
  UNIQUE KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `tips_fk_recipes` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tips`
--

LOCK TABLES `tips` WRITE;
/*!40000 ALTER TABLE `tips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tips` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 22:58:19
