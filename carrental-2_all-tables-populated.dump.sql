-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: codereview_sebastien_pflanzl_carrental
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `car_model`
--

DROP TABLE IF EXISTS `car_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maker` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model`
--

LOCK TABLES `car_model` WRITE;
/*!40000 ALTER TABLE `car_model` DISABLE KEYS */;
INSERT INTO `car_model` VALUES (1,'Phord','Phieszda 7'),(2,'Phord','Phieszda 8'),(3,'Merkedes','OberklasseT'),(4,'Merkedes','10'),(5,'Merkedes','Merk 1'),(6,'Metalmaster','7000'),(7,'Metalmaster','8000'),(8,'Metalmaster','Doomslayer'),(9,'Metalmaster','Doomslayer 666 premium'),(10,'Dyson','Staubsaugomobil 1'),(11,'Melitta','Kaffemaschinomobil 3plus'),(14,'Melitta','Kaffemaschinomobil 3plus latte');
/*!40000 ALTER TABLE `car_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_object`
--

DROP TABLE IF EXISTS `car_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition_desc` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `car_object_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `car_object_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_object`
--

LOCK TABLES `car_object` WRITE;
/*!40000 ALTER TABLE `car_object` DISABLE KEYS */;
INSERT INTO `car_object` VALUES (2,'schimmelgrün','alles super toll',2,14),(3,'schimmelgelb','bester zustand 10/10',2,14),(4,'schimmelschwarz','kratzer auf der linken seite an der vordertür',2,11),(5,'nachtschwarz','epische narben von der schlacht sonst alles ok',1,6),(6,'kohlrabenschwarz','legendäre narben von der schlacht sonst alles ok',1,6),(7,'schwarzwiemeineseele','unsterbliche narben von der schlacht sonst alles ok',1,7),(8,'episch-pink','supercoole narben von der schlacht sonst alles ok',1,8),(9,'gelb','irgendwer hat hinten in den sitz gekotzt wer macht das sauber fuck',1,1),(10,'gelb','nullo problemo',1,1),(11,'gelb','es ist eigentlich mein auto aber die firma tut so als wär es ihres',2,2),(12,'gelb','Maria bitte geh mit mir mal essen!',2,2),(13,'graugrün','Überall bisschen zerkratzt, der machts nicht mehr lang.',2,3),(14,'altrosa','Pikobello',2,4),(15,'altrosa','Pikobellissimo',2,4),(16,'pornogold','alles supa dupa',3,3),(17,'pornosilber','alles pipifein',3,3),(18,'pornopink','motor fehlt',3,3),(19,'grau','kofferraum lässt sich nicht ordentlich schließen',3,5),(20,'grau','staubsaugerfunktion ist defekt',3,10),(21,'graugrün','staubsaugermodus lässt sich nicht abschalten',3,10),(22,'silbergrau','schleudert den staub zu heftig aus der luft',3,10),(23,'silbergrau','der kaffee kommt nur kalt raus',4,11),(24,'altweiß','exzellent',4,11),(25,'altweiß','der kaffee ist zu heiß',4,11),(26,'altgelb','nummernschild vorne stimmt nicht überein mit nummernschild hinten',4,2),(27,'hellgelb','passt',5,2),(28,'gelb','passt',5,2),(29,'gelb','passt',5,2),(30,'gelb','passt',5,2),(31,'gelb','passt',5,2),(32,'schwarzgrau','radio spielt nur cradle of filth',5,8),(33,'schwarzgrau','radio spielt nur mastodon',5,8),(34,'silbergrau','radio spielt nur shakira',5,8);
/*!40000 ALTER TABLE `car_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in`
--

DROP TABLE IF EXISTS `check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_in` (
  `id` int(11) NOT NULL,
  `passport_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licence_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `check_in_ibfk_1` FOREIGN KEY (`id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `check_in_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in`
--

LOCK TABLES `check_in` WRITE;
/*!40000 ALTER TABLE `check_in` DISABLE KEYS */;
INSERT INTO `check_in` VALUES (18,'ABC123HELLOGOODBYE77789','2770745345',2),(20,'XZYZ89352304JBLUBBFISCH','5398023235',9),(21,'GSK8933ALLURBAESAREBEL7','8953240000',4),(22,'XZYZ89352304JBLUBBFISCH','5398023235',8),(25,'JFS898SIMSALABIM8987777','1231535532',3),(26,'AAA8923KATZENKARTONAGE8','9990033005',2),(27,'JFS898SIMSALABIM8987777','1231535532',6),(28,'XXX28934BITTEGERNE83042','0902399093',17),(29,'XXX28934BITTEGERNE83042','0902399093',17),(30,'GSK8933ALLURBAESAREBEL7','8953240000',4),(32,'JEDI80942348YODAGESICHT','1010101099',9),(33,'SXJ893HERSTOIDA8234JKJL','7777733232',16),(34,'JFS898SIMSALABIM8987777','1231535533',11),(36,'VVV1093REGENTAG898NEBEL','8291412894',1),(37,'XXX28934BITTEGERNE83042','0902399094',1);
/*!40000 ALTER TABLE `check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_out`
--

DROP TABLE IF EXISTS `check_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_out` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `check_out_ibfk_1` FOREIGN KEY (`id`) REFERENCES `check_in` (`id`),
  CONSTRAINT `check_out_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `check_out_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_out`
--

LOCK TABLES `check_out` WRITE;
/*!40000 ALTER TABLE `check_out` DISABLE KEYS */;
INSERT INTO `check_out` VALUES (18,'2007-05-09',1,3),(20,'2007-05-20',1,2),(21,'2007-06-07',2,5),(22,'2008-01-07',3,8),(25,'2008-02-18',2,4),(27,'2008-04-06',3,8),(28,'2008-07-15',5,16),(29,'2008-07-21',4,10),(30,'2008-11-06',4,10),(32,'2009-02-10',4,13),(33,'2009-01-15',5,15),(34,'2009-01-22',1,3),(37,'2009-07-19',3,9);
/*!40000 ALTER TABLE `check_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Bronko','Borkendork','8098890234','Lange Straße 3','Kleindorf','3423','Österreich'),(2,'Fritz','Witzmann','23849203','Kurze Straße 7','Kleindorf','3423','Österreich'),(3,'Aurelia','Grashüpfer','23890412','Mittellange Straße 15','Großdorf','3300','Österreich'),(4,'Plonk','Honk','19248910','Superkurze Straße 1','Mitteldorf','4444','Österreich'),(5,'Friedrich','Schmiependiep','12940128409','Meeresgrund 3','Knork','12940','Deutschland'),(6,'Peter','Horgentorg','2398042','Holzkopfgasse 10','Knork','12940','Deutschland'),(7,'Pjotr','Hergenberg','238439023','Holztopfgasse 11','Knork','12940','Deutschland'),(8,'Grieskoch','Weizmann','1248109248','Hauptstraße 7','Zwei Berge','24324','Deutschland'),(9,'Filzlaus','Schmelzkäse','2348293','Hauptstraße 8','Zwei Berge','24324','Deutschland'),(10,'Korinna','Korinthenkalk','12903401','Koksberggasse 9','Krakenkopf','58883','Deutschland'),(11,'Markus','Markowitsch','12841910','Kistenhaufen 7','Hinterdorf','1294','Schweiz'),(12,'Amalia','Fatalia','23852093','Oberstube 123','Oberkatzenbaum','8934','Schweiz'),(13,'Thomas','Aderlass','2942191248','Letzter Weg 77','Oberkatzenbaum','8934','Schweiz'),(14,'Matthias','Miefzimmer','23849124','Letzter Weg 79','Oberkatzenbaum','8934','Schweiz'),(15,'Kerstin','Alteshaus','1289401284','Mittwegstraßengasse 30','Oberkatzenbaum','8934','Schweiz');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Hubert','Schubert',1),(2,'Herbert','Schegert',1),(3,'Hildegard','Hart',1),(4,'Diego','Popowitsch',2),(5,'Akira','Müller',2),(6,'Lisa','Kratzbaum',2),(7,'Selaginella','Helvetika',2),(8,'Ingeborg','Weitgereist',3),(9,'Filius','Mater',3),(10,'Samson','Kaminaga',4),(11,'Jette','Kuul',4),(12,'Simon','Simerich',4),(13,'Gaston','LeCretin',4),(14,'Mariborg','Borgolov',4),(15,'Sauron','von Düsternis',5),(16,'Frodo','Beutelchen',5),(17,'Thorus','Thorwächter',5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `state` enum('contested','agreed','paid','retracted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_out_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `check_out_id` (`check_out_id`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`check_out_id`) REFERENCES `check_out` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
INSERT INTO `issue` VALUES (1,'fluxkapazitator verdreht',NULL,37.90,'paid',18),(2,'deckel für quantenverschränker fehlt',NULL,33.90,'paid',18),(3,'is kratzer','riesen kratzer rechts an der tür oida vorne',17.90,'paid',21),(4,'delle','mega delle bei motor haube scheisse man',22.50,'paid',21),(5,'duftbaum verschwunden','war mein lieblingsduft',5.25,'contested',27),(6,'polsterbezug weg','gute qualität',7.50,'contested',27),(7,'anderer motor eingebaut','???',550.00,'contested',28),(8,'katze im kofferraum gefunden (lebend)',NULL,NULL,'agreed',30),(9,'neu lackiert (ur schiarch)',NULL,120.00,'agreed',33),(10,'komischer geruch','is wie von alten socken oder faules ei oder so',40.00,'paid',34);
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `flexible_return` tinyint(1) DEFAULT 0,
  `fee` decimal(10,2) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `object_id` (`object_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`object_id`) REFERENCES `car_object` (`id`),
  CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `fromdate_leq_todate` CHECK (`from_date` <= `to_date`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (18,'2007-05-06','2007-05-09',0,80.00,2,10,1),(19,'2007-10-07','2007-10-10',0,90.00,4,5,3),(20,'2007-05-10','2007-05-20',1,270.00,1,6,3),(21,'2007-06-01','2007-06-07',0,130.00,6,10,2),(22,'2008-01-02','2008-01-06',1,70.00,1,6,3),(23,'2007-11-07','2007-11-15',0,170.00,9,19,4),(24,'2007-12-24','2007-12-30',0,100.00,9,19,4),(25,'2008-02-16','2008-02-18',1,70.00,11,7,1),(26,'2008-05-05','2008-05-06',0,55.00,12,30,1),(27,'2008-04-04','2008-04-07',1,110.00,11,7,2),(28,'2008-07-12','2008-07-17',0,140.00,7,29,5),(29,'2008-07-20','2008-07-21',0,40.00,7,29,5),(30,'2008-11-03','2008-11-04',0,45.00,6,10,2),(31,'2008-10-02','2008-10-10',0,140.00,2,34,2),(32,'2009-02-10','2009-02-11',0,55.00,8,33,3),(33,'2009-01-09','2009-01-19',1,310.00,14,10,5),(34,'2009-01-17','2009-01-22',0,120.00,11,10,4),(35,'2008-12-31','2009-01-10',1,320.00,3,10,3),(36,'2009-04-01','2009-04-01',1,40.00,15,4,1),(37,'2009-07-07','2009-07-20',1,370.00,7,3,1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'Siebensachenstraße 7'),(2,'Oktogoniengasse 88'),(3,'Dodekallee 12'),(4,'Quadratweg 64'),(5,'Polygoniensteig 123');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_user`
--

DROP TABLE IF EXISTS `web_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_user` (
  `name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dummy_password` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `web_user_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_user`
--

LOCK TABLES `web_user` WRITE;
/*!40000 ALTER TABLE `web_user` DISABLE KEYS */;
INSERT INTO `web_user` VALUES ('autofan42','brummbrumm@bmx.de','password',5),('blumenwiese7','amaliadiegrosse@gmail.ch','bleibweg',12),('entsafter-no1','qualitaetsentsaftermiefzimmer@gmail.com','jetztkaufen',14),('kerstinistcool','kerstinistdiebeste@gmail.com','kerstin',15),('masterofdisaste','deinlieblingspjotr@fmail.de','perswert',7),('michelvaillant','michel@michelin.fr','0000000',9),('schmalzlocke','heyda@gmx.at','7654',3),('sexyhexy777','sexy@hexy.at','1234',1),('siebensachen','megageil@email.com','passwort',6),('ultimarkus','ultimatemarkus@markus.markus','yes',11);
/*!40000 ALTER TABLE `web_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-23 22:08:04
