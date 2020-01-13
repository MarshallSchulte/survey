-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: panception_development
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tier` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complexity_weight` int(11) DEFAULT NULL,
  `performance_review_number` int(11) DEFAULT NULL,
  `executive_sponsor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `specialist_id` int(11) DEFAULT NULL,
  `survey_sent` tinyint(1) DEFAULT NULL,
  `template` tinyint(1) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `rr` tinyint(1) DEFAULT NULL,
  `ready` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_campaigns_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,1,'template_changed_by_sameer_for_testing',NULL,'2015-01-30','2015-03-30',NULL,'2015-02-03 20:51:33','2015-02-24 23:07:59',NULL,NULL,NULL,NULL,1,NULL,NULL,4,NULL,1,NULL,NULL,NULL),(2,1,'Oracle PR1','In Process','2015-02-25','2015-04-01',NULL,'2015-02-03 20:54:00','2015-02-05 02:04:21',NULL,NULL,NULL,NULL,NULL,1,2,4,1,0,1,NULL,NULL),(3,NULL,'template_3',NULL,'2015-01-30','2015-03-30',NULL,'2015-02-04 00:04:22','2015-02-04 00:04:22',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(4,1,'Vamanos Pest 3 2/20/15','Complete','2015-02-20','2015-03-26',NULL,'2015-02-04 00:05:39','2015-03-29 04:16:39',NULL,NULL,NULL,NULL,NULL,2,7,8,0,0,3,NULL,NULL),(5,1,'testing02032015_01','Complete','2015-02-26','2015-03-24',NULL,'2015-02-04 04:19:32','2015-02-04 22:33:13',NULL,NULL,NULL,NULL,NULL,1,11,4,1,0,1,1,NULL),(6,1,'testing_02021015','Complete','2015-02-10','2015-02-27',NULL,'2015-02-04 04:20:33','2015-03-16 20:31:58',NULL,NULL,NULL,NULL,NULL,1,11,4,1,0,3,NULL,NULL),(7,NULL,'iT_HW_SW',NULL,'2015-01-30','2015-03-30',NULL,'2015-02-11 00:15:50','2015-02-11 00:24:18',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(8,1,'Tyler testing tuesday','Complete','2015-02-03','2015-02-28',NULL,'2015-02-11 00:26:10','2015-03-01 23:50:30',NULL,NULL,NULL,NULL,NULL,2,7,4,0,0,7,NULL,NULL),(9,NULL,NULL,'Draft',NULL,NULL,NULL,'2015-02-19 16:31:09','2015-04-01 22:16:27',NULL,NULL,NULL,NULL,4,1,7,9,0,0,NULL,NULL,1),(10,NULL,'Vamanos Pest 4 2/20/16','Draft',NULL,NULL,NULL,'2015-02-19 16:31:15','2015-03-30 23:57:42',NULL,NULL,NULL,NULL,4,2,7,8,0,0,NULL,NULL,NULL),(11,NULL,NULL,'Draft',NULL,NULL,NULL,'2015-02-19 16:31:17','2015-02-23 23:00:15',NULL,NULL,NULL,NULL,4,3,7,9,0,0,NULL,NULL,NULL),(12,1,'Darkness Inc 2 2/20/15','Complete','2015-11-02',NULL,NULL,'2015-02-23 22:50:52','2015-03-20 22:17:52',NULL,NULL,NULL,NULL,4,4,7,9,0,0,3,NULL,NULL),(13,NULL,NULL,'Complete',NULL,'2015-02-03',NULL,'2015-02-23 22:55:44','2015-03-20 21:48:55',NULL,NULL,NULL,NULL,4,8,7,14,0,0,NULL,NULL,NULL),(14,1,'Testing 02232015 1 2/24/15','Complete','2015-05-03','2015-05-11',NULL,'2015-02-23 22:56:38','2015-05-12 18:33:55',NULL,NULL,NULL,NULL,4,9,7,14,0,0,1,NULL,NULL),(15,1,'Dar Inc 1 2/17/15','Complete','2015-02-17','2015-02-22',NULL,'2015-02-24 00:08:23','2015-02-26 00:29:47',NULL,NULL,NULL,NULL,4,10,7,14,1,0,3,1,NULL),(16,1,'Ballerco 5 2/21/15','Complete','2015-02-12','2015-02-22',NULL,'2015-02-24 22:48:33','2015-02-26 00:35:03',NULL,NULL,NULL,NULL,4,5,7,14,0,0,1,NULL,NULL),(17,NULL,'created_fresh_by_sameer_02242015','Draft',NULL,NULL,NULL,'2015-02-24 23:23:09','2015-02-24 23:23:09',NULL,NULL,NULL,NULL,1,NULL,1,NULL,0,1,NULL,NULL,NULL),(18,1,'Campaign name changed by sameer once again','Complete','2015-02-24','2015-02-28',NULL,'2015-02-24 23:23:29','2015-02-25 00:47:45',NULL,NULL,NULL,NULL,4,10,7,14,0,0,17,1,NULL),(19,1,'testing02232015_2_02232-151922','Complete','2015-02-24','2015-02-28',NULL,'2015-02-25 00:07:47','2015-02-25 00:37:30',NULL,NULL,NULL,NULL,4,8,7,14,0,0,17,1,NULL),(20,NULL,'exhibiting import templates',NULL,'2015-01-30','2015-03-30',NULL,'2015-02-25 00:25:21','2015-02-25 00:26:54',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(21,NULL,'Campaign 21','Complete','2015-03-11','2015-03-28',NULL,'2015-02-26 01:51:48','2015-03-29 04:16:40',NULL,NULL,NULL,NULL,4,4,7,9,0,0,NULL,NULL,1),(22,1,'Campaign 22','Draft','2015-04-03',NULL,NULL,'2015-02-26 01:51:57','2015-03-20 21:48:09',NULL,NULL,NULL,NULL,4,8,7,8,0,0,25,NULL,NULL),(23,1,'Campaign 23','Draft','2015-03-12',NULL,NULL,'2015-02-26 01:58:50','2015-03-20 22:22:56',NULL,NULL,NULL,NULL,4,10,7,8,0,0,25,NULL,NULL),(24,1,'Campaign 24','Complete','2015-02-03','2015-03-31',NULL,'2015-02-26 01:58:57','2015-04-01 21:37:38',NULL,NULL,NULL,NULL,4,11,7,8,0,0,25,NULL,NULL),(25,NULL,'template_25',NULL,'2015-01-30','2015-03-30',NULL,'2015-03-18 22:03:27','2015-03-18 22:03:27',NULL,NULL,NULL,NULL,1,NULL,NULL,4,NULL,1,NULL,NULL,NULL),(26,NULL,'template_sameer_03182015','Draft',NULL,NULL,NULL,'2015-03-18 22:31:31','2015-03-18 22:31:31',NULL,NULL,NULL,NULL,1,NULL,1,NULL,0,1,NULL,NULL,NULL),(27,1,'testing555_27_2015-03-18','Complete','2015-03-10','2015-03-27',NULL,'2015-03-18 22:48:26','2015-03-29 04:16:41',NULL,NULL,NULL,NULL,4,12,7,14,1,0,26,1,NULL),(28,1,'testedRSI03262015_28_2015-03-26','Complete','2015-03-01','2015-03-24',NULL,'2015-03-27 03:18:59','2015-03-27 03:24:15',NULL,NULL,NULL,NULL,4,14,7,14,0,0,26,1,1),(29,NULL,'Darkness Inc._29_2015-03-30','Draft',NULL,NULL,NULL,'2015-03-30 23:51:48','2015-05-20 15:53:14',NULL,NULL,NULL,NULL,4,4,7,8,0,0,NULL,NULL,1),(30,NULL,'testedRSI03262015_30_2015-04-01','Draft',NULL,NULL,NULL,'2015-04-01 22:14:45','2015-04-01 22:22:44',NULL,NULL,NULL,NULL,4,14,7,14,0,0,NULL,NULL,0),(31,NULL,'Blue Cheese Vendor_31_2015-04-01','Draft',NULL,NULL,NULL,'2015-04-01 22:15:50','2015-04-01 22:16:06',NULL,NULL,NULL,NULL,4,11,7,14,0,0,NULL,NULL,0),(32,NULL,'Blue Cheese Vendor_31_2015-04-01','Draft',NULL,NULL,NULL,'2015-04-01 22:16:10','2015-04-01 22:16:10',NULL,NULL,NULL,NULL,4,11,7,9,0,0,NULL,NULL,0),(33,NULL,'testing555_33_2015-04-01','Draft',NULL,NULL,NULL,'2015-04-01 22:17:57','2015-04-01 22:18:26',NULL,NULL,NULL,NULL,4,12,7,14,0,0,NULL,NULL,0),(34,NULL,'testing555_33_2015-04-01','Draft',NULL,NULL,NULL,'2015-04-01 22:18:55','2015-04-01 22:18:55',NULL,NULL,NULL,NULL,4,12,7,14,0,0,NULL,NULL,0),(35,NULL,'testing555_33_2015-04-01','Draft',NULL,NULL,NULL,'2015-04-01 22:19:02','2015-04-02 23:02:19',NULL,NULL,NULL,NULL,4,12,7,4,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_questions`
--

DROP TABLE IF EXISTS `campaigns_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_questions`
--

LOCK TABLES `campaigns_questions` WRITE;
/*!40000 ALTER TABLE `campaigns_questions` DISABLE KEYS */;
INSERT INTO `campaigns_questions` VALUES (1,1,1,'2015-02-03 20:51:33','2015-02-03 20:51:33'),(2,1,2,'2015-02-03 20:51:33','2015-02-03 20:51:33'),(3,1,3,'2015-02-03 20:51:33','2015-02-03 20:51:33'),(4,1,4,'2015-02-03 20:51:33','2015-02-03 20:51:33'),(5,1,5,'2015-02-03 20:51:33','2015-02-03 20:51:33'),(6,1,6,'2015-02-03 20:51:33','2015-02-03 20:51:33'),(7,1,7,'2015-02-03 20:51:33','2015-02-03 20:51:33'),(8,2,8,'2015-02-03 20:54:00','2015-02-03 20:54:00'),(9,2,9,'2015-02-03 20:54:00','2015-02-03 20:54:00'),(10,2,10,'2015-02-03 20:54:00','2015-02-03 20:54:00'),(11,2,11,'2015-02-03 20:54:00','2015-02-03 20:54:00'),(12,2,12,'2015-02-03 20:54:00','2015-02-03 20:54:00'),(13,2,13,'2015-02-03 20:54:00','2015-02-03 20:54:00'),(14,2,14,'2015-02-03 20:54:00','2015-02-03 20:54:00'),(15,3,1,'2015-02-04 00:04:22','2015-02-04 00:04:22'),(16,3,2,'2015-02-04 00:04:22','2015-02-04 00:04:22'),(17,3,3,'2015-02-04 00:04:22','2015-02-04 00:04:22'),(18,3,4,'2015-02-04 00:04:22','2015-02-04 00:04:22'),(19,3,5,'2015-02-04 00:04:22','2015-02-04 00:04:22'),(20,3,6,'2015-02-04 00:04:22','2015-02-04 00:04:22'),(21,3,7,'2015-02-04 00:04:22','2015-02-04 00:04:22'),(22,4,15,'2015-02-04 00:05:39','2015-02-04 00:05:39'),(23,4,16,'2015-02-04 00:05:39','2015-02-04 00:05:39'),(24,4,17,'2015-02-04 00:05:39','2015-02-04 00:05:39'),(25,4,18,'2015-02-04 00:05:39','2015-02-04 00:05:39'),(26,4,19,'2015-02-04 00:05:39','2015-02-04 00:05:39'),(27,4,20,'2015-02-04 00:05:39','2015-02-04 00:05:39'),(28,4,21,'2015-02-04 00:05:39','2015-02-04 00:05:39'),(29,5,22,'2015-02-04 04:19:32','2015-02-04 04:19:32'),(30,5,23,'2015-02-04 04:19:32','2015-02-04 04:19:32'),(31,5,24,'2015-02-04 04:19:32','2015-02-04 04:19:32'),(32,5,25,'2015-02-04 04:19:32','2015-02-04 04:19:32'),(33,5,26,'2015-02-04 04:19:32','2015-02-04 04:19:32'),(34,5,27,'2015-02-04 04:19:32','2015-02-04 04:19:32'),(35,5,28,'2015-02-04 04:19:32','2015-02-04 04:19:32'),(36,6,29,'2015-02-04 04:20:33','2015-02-04 04:20:33'),(37,6,30,'2015-02-04 04:20:33','2015-02-04 04:20:33'),(38,6,31,'2015-02-04 04:20:33','2015-02-04 04:20:33'),(39,6,32,'2015-02-04 04:20:33','2015-02-04 04:20:33'),(40,6,33,'2015-02-04 04:20:33','2015-02-04 04:20:33'),(41,6,34,'2015-02-04 04:20:33','2015-02-04 04:20:33'),(42,6,35,'2015-02-04 04:20:33','2015-02-04 04:20:33'),(43,7,36,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(44,7,37,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(45,7,38,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(46,7,39,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(47,7,40,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(48,7,41,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(49,7,42,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(50,7,43,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(51,7,44,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(52,7,45,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(53,7,46,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(54,7,47,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(55,7,48,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(56,7,49,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(57,7,50,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(58,7,51,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(59,7,52,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(60,7,53,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(61,7,54,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(62,7,55,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(63,7,56,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(64,7,57,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(65,7,58,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(66,7,59,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(67,7,60,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(68,7,61,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(69,7,62,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(70,7,63,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(71,7,64,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(72,7,65,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(73,7,66,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(74,7,67,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(75,7,68,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(76,7,69,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(77,7,70,'2015-02-11 00:15:50','2015-02-11 00:15:50'),(78,8,71,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(79,8,72,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(80,8,73,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(81,8,74,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(82,8,75,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(83,8,76,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(84,8,77,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(85,8,78,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(86,8,79,'2015-02-11 00:26:10','2015-02-11 00:26:10'),(87,8,80,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(88,8,81,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(89,8,82,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(90,8,83,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(91,8,84,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(92,8,85,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(93,8,86,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(94,8,87,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(95,8,88,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(96,8,89,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(97,8,90,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(98,8,91,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(99,8,92,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(100,8,93,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(101,8,94,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(102,8,95,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(103,8,96,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(104,8,97,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(105,8,98,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(106,8,99,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(107,8,100,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(108,8,101,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(109,8,102,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(110,8,103,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(111,8,104,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(112,8,105,'2015-02-11 00:26:11','2015-02-11 00:26:11'),(172,15,165,'2015-02-24 22:47:18','2015-02-24 22:47:18'),(173,15,166,'2015-02-24 22:47:18','2015-02-24 22:47:18'),(174,15,167,'2015-02-24 22:47:19','2015-02-24 22:47:19'),(175,15,168,'2015-02-24 22:47:19','2015-02-24 22:47:19'),(176,15,169,'2015-02-24 22:47:19','2015-02-24 22:47:19'),(177,15,170,'2015-02-24 22:47:19','2015-02-24 22:47:19'),(203,17,196,'2015-02-24 23:23:10','2015-02-24 23:23:10'),(204,17,197,'2015-02-24 23:23:10','2015-02-24 23:23:10'),(209,18,202,'2015-02-24 23:31:32','2015-02-24 23:31:32'),(210,18,203,'2015-02-24 23:31:32','2015-02-24 23:31:32'),(211,16,204,'2015-02-24 23:31:44','2015-02-24 23:31:44'),(212,16,205,'2015-02-24 23:31:44','2015-02-24 23:31:44'),(213,16,206,'2015-02-24 23:31:44','2015-02-24 23:31:44'),(214,16,207,'2015-02-24 23:31:44','2015-02-24 23:31:44'),(215,16,208,'2015-02-24 23:31:44','2015-02-24 23:31:44'),(216,16,209,'2015-02-24 23:31:44','2015-02-24 23:31:44'),(217,16,210,'2015-02-24 23:31:45','2015-02-24 23:31:45'),(220,20,196,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(221,20,197,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(222,20,213,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(223,20,214,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(224,20,215,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(225,20,216,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(226,20,42,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(227,20,217,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(228,20,218,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(229,20,219,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(230,20,220,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(231,20,221,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(232,20,48,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(233,20,222,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(234,20,223,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(235,20,224,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(236,20,225,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(237,20,226,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(238,20,227,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(239,20,228,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(240,20,56,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(241,20,229,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(242,20,230,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(243,20,231,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(244,20,232,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(245,20,233,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(246,20,62,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(247,20,234,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(248,20,235,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(249,20,236,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(250,20,237,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(251,20,67,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(252,20,238,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(253,20,239,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(254,20,240,'2015-02-25 00:25:21','2015-02-25 00:25:21'),(255,19,241,'2015-02-25 00:31:09','2015-02-25 00:31:09'),(256,19,242,'2015-02-25 00:31:09','2015-02-25 00:31:09'),(257,14,243,'2015-02-28 03:23:56','2015-02-28 03:23:56'),(258,14,244,'2015-02-28 03:23:57','2015-02-28 03:23:57'),(259,14,245,'2015-02-28 03:23:57','2015-02-28 03:23:57'),(260,14,246,'2015-02-28 03:23:57','2015-02-28 03:23:57'),(261,14,247,'2015-02-28 03:23:57','2015-02-28 03:23:57'),(262,14,248,'2015-02-28 03:23:58','2015-02-28 03:23:58'),(263,14,249,'2015-02-28 03:23:58','2015-02-28 03:23:58'),(264,25,1,'2015-03-18 22:03:27','2015-03-18 22:03:27'),(265,25,250,'2015-03-18 22:03:27','2015-03-18 22:03:27'),(266,25,251,'2015-03-18 22:03:27','2015-03-18 22:03:27'),(267,25,252,'2015-03-18 22:03:27','2015-03-18 22:03:27'),(268,25,253,'2015-03-18 22:03:27','2015-03-18 22:03:27'),(269,25,254,'2015-03-18 22:03:27','2015-03-18 22:03:27'),(270,25,7,'2015-03-18 22:03:27','2015-03-18 22:03:27'),(271,26,255,'2015-03-18 22:31:31','2015-03-18 22:31:31'),(272,26,256,'2015-03-18 22:31:31','2015-03-18 22:31:31'),(275,27,259,'2015-03-18 22:50:50','2015-03-18 22:50:50'),(276,27,260,'2015-03-18 22:50:50','2015-03-18 22:50:50'),(277,28,261,'2015-03-27 03:23:07','2015-03-27 03:23:07'),(278,28,262,'2015-03-27 03:23:07','2015-03-27 03:23:07');
/*!40000 ALTER TABLE `campaigns_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_reviewers`
--

DROP TABLE IF EXISTS `campaigns_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_reviewers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_reviewers`
--

LOCK TABLES `campaigns_reviewers` WRITE;
/*!40000 ALTER TABLE `campaigns_reviewers` DISABLE KEYS */;
INSERT INTO `campaigns_reviewers` VALUES (1,2,1),(2,2,2),(3,5,3),(4,6,4),(5,15,5),(6,18,6),(7,19,7),(8,19,8),(9,27,9),(10,28,10);
/*!40000 ALTER TABLE `campaigns_reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cassociations`
--

DROP TABLE IF EXISTS `cassociations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cassociations` (
  `customer_id` int(11) DEFAULT NULL,
  `ctype_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `index_cassociations_on_customer_id` (`customer_id`),
  KEY `index_cassociations_on_ctype_id` (`ctype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cassociations`
--

LOCK TABLES `cassociations` WRITE;
/*!40000 ALTER TABLE `cassociations` DISABLE KEYS */;
INSERT INTO `cassociations` VALUES (2,1,'2015-02-03 18:57:21','2015-02-03 18:57:21'),(2,4,'2015-02-03 18:57:21','2015-02-03 18:57:21'),(3,1,'2015-02-03 18:58:43','2015-02-03 18:58:43'),(3,2,'2015-02-03 18:58:43','2015-02-03 18:58:43'),(5,4,'2015-02-04 02:55:47','2015-02-04 02:55:47'),(6,4,'2015-02-04 02:55:53','2015-02-04 02:55:53'),(7,4,'2015-02-04 02:56:22','2015-02-04 02:56:22'),(8,4,'2015-02-04 02:56:30','2015-02-04 02:56:30'),(9,4,'2015-02-04 02:57:40','2015-02-04 02:57:40'),(10,4,'2015-02-04 02:57:44','2015-02-04 02:57:44'),(11,4,'2015-02-04 02:58:15','2015-02-04 02:58:15'),(12,1,'2015-02-04 04:16:24','2015-02-04 04:16:24'),(12,2,'2015-02-04 04:16:24','2015-02-04 04:16:24'),(12,3,'2015-02-04 04:16:24','2015-02-04 04:16:24'),(13,2,'2015-02-04 23:54:19','2015-02-04 23:54:19'),(21,3,'2015-02-23 22:41:58','2015-02-23 22:41:58');
/*!40000 ALTER TABLE `cassociations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctypes`
--

DROP TABLE IF EXISTS `ctypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctypes`
--

LOCK TABLES `ctypes` WRITE;
/*!40000 ALTER TABLE `ctypes` DISABLE KEYS */;
INSERT INTO `ctypes` VALUES (1,'Banking','2015-02-03 18:47:16','2015-02-03 18:47:16'),(2,'Financial','2015-02-03 18:47:16','2015-02-03 18:47:16'),(3,'Web Development','2015-02-03 18:47:16','2015-02-03 18:47:16'),(4,'Aeronautical','2015-02-03 18:47:16','2015-02-03 18:47:16');
/*!40000 ALTER TABLE `ctypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poc_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poc_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poc_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poc_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ctype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `gross_revenue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Panception',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-03 18:47:15','2015-02-03 18:47:15',NULL,NULL),(2,'Testing Customer','100 Main St.','Herndon','VA ','eee','rrr','eee@testingcustomer.com','7031112222',NULL,1000,'2015-02-03 18:57:21','2015-02-03 18:57:21',20170,1000000),(3,'abc Consulting','111 abc way','New York','va','','','','',NULL,100,'2015-02-03 18:58:43','2015-02-04 01:55:10',20170,100000),(4,'Green Jackets','100 Main St.','Herndon','VA','some','one','someone@somewhere.com','7031112222',NULL,100,'2015-02-04 00:02:44','2015-02-04 00:02:44',20170,100000),(5,'Hot Dog Seller','Yap St','Des Moines','IA','Jason ','Jones','jasonjones@hotdogseller.com','7023843838',NULL,2000,'2015-02-04 02:55:47','2015-02-04 02:55:47',NULL,6776767),(6,'Hot Dog Seller','Yap St','Des Moines','IA','Jason ','Jones','jasonjones@hotdogseller.com','7023843838',NULL,2000,'2015-02-04 02:55:53','2015-02-04 02:55:53',NULL,6776767),(7,'Hot Dog Seller','Yap St','Des Moines','IA','Jason ','Jones','jasonjones@hotdogseller.com','7023843838',NULL,2000,'2015-02-04 02:56:22','2015-02-04 02:56:22',NULL,6776767),(8,'Hot Dog Seller','Yap St','Des Moines','IA','Jason ','Jones','jasonjones@hotdogseller.com','7023843838',NULL,2000,'2015-02-04 02:56:30','2015-02-04 02:56:30',NULL,1),(9,'Hot Dog Seller','Yap St','Des Moines','IA','Jason ','Jones','jasonjones@hotdogseller.com','7023843838',NULL,2000,'2015-02-04 02:57:40','2015-02-04 02:57:40',NULL,1),(10,'Hot Dog Seller','Yap St','Des Moines','IA','Jason ','Jones','jasonjones@hotdogseller.com','7023843838',NULL,2000,'2015-02-04 02:57:44','2015-02-04 02:57:44',NULL,NULL),(11,'Hot Dog Seller','Yap St','Des Moines','IA','Jason ','Jones','jasonjones@hotdogseller.com','7023843838',NULL,2000,'2015-02-04 02:58:15','2015-02-04 02:58:15',NULL,NULL),(12,'test customer 02032015','100 some st','ashburn','va','','','','',NULL,19,'2015-02-04 04:16:24','2015-02-04 04:16:24',20147,199999),(13,'Oracle','11111 xxx way','Reston','VA','Greg','Favitta','','',NULL,150,'2015-02-04 23:54:19','2015-02-04 23:54:19',NULL,100),(14,'Microsoft',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 19:01:35','2015-02-23 19:01:35',NULL,NULL),(15,'Google',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 19:01:35','2015-02-23 19:01:35',NULL,NULL),(16,'Samerost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 19:01:35','2015-02-23 19:01:35',NULL,NULL),(17,'David Lynch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 19:57:35','2015-02-23 19:57:35',NULL,NULL),(18,'Charles Barkley',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 19:57:35','2015-02-23 19:57:35',NULL,NULL),(19,'Garlico',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 19:57:35','2015-02-23 19:57:35',NULL,NULL),(20,'Resource Stack Inc.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 22:40:03','2015-02-23 22:40:03',NULL,NULL),(21,'Dynamic Technologies','','Alexandria','VA','','','','',NULL,222,'2015-02-23 22:40:03','2015-02-23 22:41:58',NULL,NULL),(22,'Openet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 22:40:03','2015-02-23 22:40:03',NULL,NULL),(23,'Sabianet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-02-23 22:40:03','2015-02-23 22:40:03',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_vendors`
--

DROP TABLE IF EXISTS `customers_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers_vendors` (
  `customer_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  KEY `index_customers_vendors_on_customer_id` (`customer_id`),
  KEY `index_customers_vendors_on_vendor_id` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_vendors`
--

LOCK TABLES `customers_vendors` WRITE;
/*!40000 ALTER TABLE `customers_vendors` DISABLE KEYS */;
INSERT INTO `customers_vendors` VALUES (14,4),(15,4),(16,4),(17,5),(18,5),(19,5),(20,6),(21,6),(22,7),(23,7),(21,3),(21,5),(21,7),(4,1),(4,9),(4,4),(4,3),(4,10),(14,8),(4,8),(4,11),(2,12),(3,12),(4,12),(4,13),(4,14);
/*!40000 ALTER TABLE `customers_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphs`
--

DROP TABLE IF EXISTS `graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slide_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rails_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphs`
--

LOCK TABLES `graphs` WRITE;
/*!40000 ALTER TABLE `graphs` DISABLE KEYS */;
INSERT INTO `graphs` VALUES (124,'app/assets/images/chart_Sameer-Sharma_1_100356-0400.jpg',28,7,NULL,'2015-05-29 14:03:56','2015-05-29 14:03:56','1','assets/chart_Sameer-Sharma_1_100356-0400.jpg',NULL),(125,'app/assets/images/chart_Sameer-Sharma_2_100849-0400.jpg',28,7,NULL,'2015-05-29 14:08:49','2015-05-29 14:08:49','2','assets/chart_Sameer-Sharma_2_100849-0400.jpg',NULL),(126,'app/assets/images/chart_Sameer-Sharma_3_100858-0400.jpg',28,7,NULL,'2015-05-29 14:08:58','2015-05-29 14:08:58','3','assets/chart_Sameer-Sharma_3_100858-0400.jpg',NULL);
/*!40000 ALTER TABLE `graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kpis`
--

DROP TABLE IF EXISTS `kpis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_id` int(11) DEFAULT NULL,
  `kpi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kpi_measurement` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `original_kpi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpis`
--

LOCK TABLES `kpis` WRITE;
/*!40000 ALTER TABLE `kpis` DISABLE KEYS */;
INSERT INTO `kpis` VALUES (1,1,'testing1','testing description 1','2015-02-03 20:51:32','2015-02-03 20:51:32',NULL),(2,1,'testing2','testing description 2','2015-02-03 20:51:32','2015-02-03 20:51:32',NULL),(3,1,'testing3','testing description 3','2015-02-03 20:51:32','2015-02-03 20:51:32',NULL),(4,1,'testing4','testing description 4','2015-02-03 20:51:32','2015-02-03 20:51:32',NULL),(5,1,'testing5','testing description 5','2015-02-03 20:51:33','2015-02-03 20:51:33',NULL),(6,1,'testing6','testing description 6','2015-02-03 20:51:33','2015-02-03 20:51:33',NULL),(7,2,'cs001','customer service is important','2015-02-03 20:51:33','2015-02-03 20:51:33',NULL),(8,1,'testing1','testing description 1','2015-02-03 20:53:59','2015-02-03 20:53:59',1),(9,1,'testing2','testing description 2','2015-02-03 20:53:59','2015-02-03 20:53:59',2),(10,1,'testing3','testing description 3','2015-02-03 20:53:59','2015-02-03 20:53:59',3),(11,1,'testing4','testing description 4','2015-02-03 20:53:59','2015-02-03 20:53:59',4),(12,1,'testing5','testing description 5','2015-02-03 20:53:59','2015-02-03 20:53:59',5),(13,1,'testing6','testing description 6','2015-02-03 20:53:59','2015-02-03 20:53:59',6),(14,2,'cs001','customer service is important','2015-02-03 20:53:59','2015-02-03 20:53:59',7),(15,1,'testing1','testing description 1','2015-02-04 00:05:38','2015-02-04 00:05:38',1),(16,1,'testing2','testing description 2','2015-02-04 00:05:38','2015-02-04 00:05:38',2),(17,1,'testing3','testing description 3','2015-02-04 00:05:38','2015-02-04 00:05:38',3),(18,1,'testing4','testing description 4','2015-02-04 00:05:38','2015-02-04 00:05:38',4),(19,1,'testing5','testing description 5','2015-02-04 00:05:39','2015-02-04 00:05:39',5),(20,1,'testing6','testing description 6','2015-02-04 00:05:39','2015-02-04 00:05:39',6),(21,2,'cs001','customer service is important','2015-02-04 00:05:39','2015-02-04 00:05:39',7),(22,2,'testing by sameer','is it a good question','2015-02-04 04:13:15','2015-02-04 04:13:15',NULL),(23,1,'testing1','testing description 1','2015-02-04 04:19:32','2015-02-04 04:19:32',1),(24,1,'testing2','testing description 2','2015-02-04 04:19:32','2015-02-04 04:19:32',2),(25,1,'testing3','testing description 3','2015-02-04 04:19:32','2015-02-04 04:19:32',3),(26,1,'testing4','testing description 4','2015-02-04 04:19:32','2015-02-04 04:19:32',4),(27,1,'testing5','testing description 5','2015-02-04 04:19:32','2015-02-04 04:19:32',5),(28,1,'testing6','testing description 6','2015-02-04 04:19:32','2015-02-04 04:19:32',6),(29,2,'cs001','customer service is important','2015-02-04 04:19:32','2015-02-04 04:19:32',7),(30,1,'testing1','testing description 1','2015-02-04 04:20:32','2015-02-04 04:20:32',1),(31,1,'testing2','testing description 2','2015-02-04 04:20:32','2015-02-04 04:20:32',2),(32,1,'testing3','testing description 3','2015-02-04 04:20:33','2015-02-04 04:20:33',3),(33,1,'testing4','testing description 4','2015-02-04 04:20:33','2015-02-04 04:20:33',4),(34,1,'testing5','testing description 5','2015-02-04 04:20:33','2015-02-04 04:20:33',5),(35,1,'testing6','testing description 6','2015-02-04 04:20:33','2015-02-04 04:20:33',6),(36,2,'cs001','customer service is important','2015-02-04 04:20:33','2015-02-04 04:20:33',7),(37,4,'How was overall performance','ideniteified as a bug','2015-02-05 02:19:38','2015-02-11 00:23:24',NULL),(38,1,'testing1','testing description 1','2015-02-09 23:29:14','2015-02-09 23:29:14',1),(39,1,'testing1','testing description 1','2015-02-09 23:29:15','2015-02-09 23:29:15',1),(40,1,'testing1','testing description 1','2015-02-09 23:29:15','2015-02-09 23:29:15',1),(41,1,'testing1','testing description 1','2015-02-09 23:29:15','2015-02-09 23:29:15',1),(42,1,'testing1','testing description 1','2015-02-09 23:29:15','2015-02-09 23:29:15',1),(43,1,'testing1','testing description 1','2015-02-09 23:29:15','2015-02-09 23:29:15',1),(44,1,'testing1','testing description 1','2015-02-11 00:11:29','2015-02-11 00:11:29',1),(45,1,'testing1','testing description 1','2015-02-11 00:11:29','2015-02-11 00:11:29',1),(46,1,'testing1','testing description 1','2015-02-11 00:11:29','2015-02-11 00:11:29',1),(47,1,'testing1','testing description 1','2015-02-11 00:11:29','2015-02-11 00:11:29',1),(48,1,'testing1','testing description 1','2015-02-11 00:11:29','2015-02-11 00:11:29',1),(49,1,'testing1','testing description 1','2015-02-11 00:11:29','2015-02-11 00:11:29',1),(50,1,'testing1','testing description 1','2015-02-11 00:12:51','2015-02-11 00:12:51',1),(51,1,'testing1','testing description 1','2015-02-11 00:12:51','2015-02-11 00:12:51',1),(52,1,'testing1','testing description 1','2015-02-11 00:12:51','2015-02-11 00:12:51',1),(53,1,'testing1','testing description 1','2015-02-11 00:12:51','2015-02-11 00:12:51',1),(54,1,'testing1','testing description 1','2015-02-11 00:12:51','2015-02-11 00:12:51',1),(55,1,'testing1','testing description 1','2015-02-11 00:12:51','2015-02-11 00:12:51',1),(56,1,'Application Defects','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(57,1,'Software Functionality','Did the supplier\'s software perform to the specifications/expectations?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(58,1,'Quality Assurance','Did the supplier define, communicate and deliver a robust software quality assurance process?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(59,1,'Technical Expertise','Did the supplier display leading-edge technical expertise and a robust understanding of their solution offerings?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(60,1,'Quality of Product','Did the quality of product meet requirements?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(61,1,'Warranty/Defects','Did the supplier effectively respond to and resolve warranty/defect claims?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(62,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(63,5,'Mean Time to Resolve','Was the timeliness of the supplier\'s resolution of issues, concerns or trouble tickets reasonable?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(64,5,'Joint Problem Resolution','Was the supplier willing and able to collaborate with other suppliers to solve problems?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(65,5,'Strategic Planning','How proactive is the supplier with strategy planning and product roadmaps linked to your future goals and initiatives?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(66,5,'Technical Communication & Documentation','Did the supplier deliver the software releases, upgrades, patches, and supporting documentation in a timely and proactive manner?','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(67,5,'Order Accuracy and Timeliness','Were hardware orders delivered on-time and accurately?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(68,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(69,6,'Ease of negotiations','Did the supplier collaboratively approach during negotiations?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(70,6,'Account Management','Did the supplier account team establish a productive and healthy working business relationship?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(71,6,'Identification of Saving Opportunities','Did the supplier add value by proactively identifying savings opportunities?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(72,6,'Ease of Reporting','Did the reports provided by the supplier contain clear, concise, and actionable information?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(73,6,'Understanding of MedImmunes Business','Degree to which supplier understands and can accurately communicate the nature of our business and industry','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(74,6,'Continuous Improvement','Did the supplier proactively follow up on action items, including those from business review meetings?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(75,6,'Order Modifications','Was the supplier able to accommodate hardware order changes without significant delays or price impact?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(76,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(77,7,'Initial Cost Saving Rate','What percentage of savings did the supplier provide over the last 12 months?','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(78,7,'Value Added Services','Was the supplier willing to provide extra features/services at no additional charge?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(79,7,'Continual Cost Improvement Rate','What percentage of total savings were achieved for the last 12 months relative to the contract value?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(80,7,'Invoice Accuracy','Did the supplier provide accurate and error-free invoices?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(81,7,'Invoice Timeliness','Did the supplier provide invoices in a timely manner?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(82,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(83,8,'Business Continuity and Disaster Recovery','Were the supplier\'s documentation and testing of disaster recovery plans proactively communicated to MedImmune?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(84,8,'Adherence to Workplace Policies (only if we have resources on site)','Did the supplier’s resources comply with MedImmune’s Code of Conduct policy? ','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(85,8,'Corporate Information Security and Privacy Standards (Resources)','Did the supplier\'s resources comply with the corporate information security and privacy standards?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(86,8,'Corporate Information Security and Privacy Standards (Supplier Personnel)','Did the supplier personnel comply with the corporate information security and privacy standards?','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(87,9,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(88,9,'Financial ','Supplier is financially stable (move to HA)','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(89,9,'Reputational','Degree to which supplier is involved in fraud allegations/litigation or pending actions against them (move to HA)\n','2015-02-11 00:15:50','2015-02-11 00:15:50',NULL),(90,9,'Business Continuity and Disaster Recovery','Degree to which supplier\'s documentation and testing of disaster recovery plans are proactively communicated to MedImmune','2015-02-11 00:15:50','2015-02-11 00:15:50',NULL),(91,1,'Application Defects','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-02-11 00:26:07','2015-02-11 00:26:07',56),(92,1,'testing1','testing description 1','2015-02-11 00:26:08','2015-02-11 00:26:08',1),(93,1,'testing1','testing description 1','2015-02-11 00:26:08','2015-02-11 00:26:08',1),(94,1,'testing1','testing description 1','2015-02-11 00:26:08','2015-02-11 00:26:08',1),(95,1,'testing1','testing description 1','2015-02-11 00:26:08','2015-02-11 00:26:08',1),(96,1,'testing1','testing description 1','2015-02-11 00:26:08','2015-02-11 00:26:08',1),(97,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-11 00:26:08','2015-02-11 00:26:08',62),(98,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-11 00:26:08','2015-02-11 00:26:08',62),(99,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-11 00:26:08','2015-02-11 00:26:08',62),(100,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-11 00:26:08','2015-02-11 00:26:08',62),(101,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-11 00:26:08','2015-02-11 00:26:08',62),(102,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-11 00:26:08','2015-02-11 00:26:08',62),(103,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:08','2015-02-11 00:26:08',68),(104,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:09','2015-02-11 00:26:09',68),(105,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:09','2015-02-11 00:26:09',68),(106,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:09','2015-02-11 00:26:09',68),(107,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:09','2015-02-11 00:26:09',68),(108,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:09','2015-02-11 00:26:09',68),(109,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:09','2015-02-11 00:26:09',68),(110,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-11 00:26:09','2015-02-11 00:26:09',68),(111,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-11 00:26:09','2015-02-11 00:26:09',76),(112,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-11 00:26:09','2015-02-11 00:26:09',76),(113,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-11 00:26:09','2015-02-11 00:26:09',76),(114,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-11 00:26:09','2015-02-11 00:26:09',76),(115,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-11 00:26:09','2015-02-11 00:26:09',76),(116,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-11 00:26:09','2015-02-11 00:26:09',76),(117,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-11 00:26:09','2015-02-11 00:26:09',82),(118,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-11 00:26:09','2015-02-11 00:26:09',82),(119,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-11 00:26:10','2015-02-11 00:26:10',82),(120,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-11 00:26:10','2015-02-11 00:26:10',82),(121,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-11 00:26:10','2015-02-11 00:26:10',82),(122,9,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-02-11 00:26:10','2015-02-11 00:26:10',87),(123,9,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-02-11 00:26:10','2015-02-11 00:26:10',87),(124,9,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-02-11 00:26:10','2015-02-11 00:26:10',87),(125,4,'How was overall performance','ideniteified as a bug','2015-02-11 00:26:10','2015-02-11 00:26:10',37),(126,1,'Application Defects','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-02-24 00:22:34','2015-02-24 00:22:34',56),(127,1,'testing1','testing description 1','2015-02-24 00:22:35','2015-02-24 00:22:35',1),(128,1,'testing1','testing description 1','2015-02-24 00:22:35','2015-02-24 00:22:35',1),(129,1,'testing1','testing description 1','2015-02-24 00:22:35','2015-02-24 00:22:35',1),(130,1,'testing1','testing description 1','2015-02-24 00:22:35','2015-02-24 00:22:35',1),(131,1,'testing1','testing description 1','2015-02-24 00:22:35','2015-02-24 00:22:35',1),(132,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-24 00:22:36','2015-02-24 00:22:36',62),(133,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-24 00:22:36','2015-02-24 00:22:36',62),(134,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-24 00:22:36','2015-02-24 00:22:36',62),(135,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-24 00:22:36','2015-02-24 00:22:36',62),(136,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-24 00:22:36','2015-02-24 00:22:36',62),(137,5,'Mean Time to Respond','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-02-24 00:22:36','2015-02-24 00:22:36',62),(138,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:36','2015-02-24 00:22:36',68),(139,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:37','2015-02-24 00:22:37',68),(140,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:37','2015-02-24 00:22:37',68),(141,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:37','2015-02-24 00:22:37',68),(142,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:37','2015-02-24 00:22:37',68),(143,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:37','2015-02-24 00:22:37',68),(144,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:37','2015-02-24 00:22:37',68),(145,6,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?','2015-02-24 00:22:37','2015-02-24 00:22:37',68),(146,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-24 00:22:38','2015-02-24 00:22:38',76),(147,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-24 00:22:38','2015-02-24 00:22:38',76),(148,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-24 00:22:38','2015-02-24 00:22:38',76),(149,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-24 00:22:38','2015-02-24 00:22:38',76),(150,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-24 00:22:38','2015-02-24 00:22:38',76),(151,7,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?','2015-02-24 00:22:38','2015-02-24 00:22:38',76),(152,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-24 00:22:39','2015-02-24 00:22:39',82),(153,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-24 00:22:39','2015-02-24 00:22:39',82),(154,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-24 00:22:39','2015-02-24 00:22:39',82),(155,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-24 00:22:39','2015-02-24 00:22:39',82),(156,8,'Contract Terms and Conditions','Did the supplier comply with contract terms and conditions?','2015-02-24 00:22:39','2015-02-24 00:22:39',82),(157,9,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-02-24 00:22:39','2015-02-24 00:22:39',87),(158,9,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-02-24 00:22:39','2015-02-24 00:22:39',87),(159,9,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-02-24 00:22:40','2015-02-24 00:22:40',87),(160,4,'How was overall performance','ideniteified as a bug','2015-02-24 00:22:40','2015-02-24 00:22:40',37),(161,1,'testing1','testing description 1','2015-02-24 22:22:47','2015-02-24 22:22:47',1),(162,1,'testing1','testing description 1','2015-02-24 22:22:47','2015-02-24 22:22:47',1),(163,1,'testing1','testing description 1','2015-02-24 22:22:48','2015-02-24 22:22:48',1),(164,1,'testing1','testing description 1','2015-02-24 22:22:48','2015-02-24 22:22:48',1),(165,1,'testing1','testing description 1','2015-02-24 22:22:48','2015-02-24 22:22:48',1),(166,1,'testing1','testing description 1','2015-02-24 22:22:48','2015-02-24 22:22:48',1),(167,1,'testing1','testing description 1','2015-02-24 22:31:15','2015-02-24 22:31:15',1),(168,1,'testing1','testing description 1','2015-02-24 22:31:15','2015-02-24 22:31:15',1),(169,1,'testing1','testing description 1','2015-02-24 22:31:15','2015-02-24 22:31:15',1),(170,1,'testing1','testing description 1','2015-02-24 22:31:15','2015-02-24 22:31:15',1),(171,1,'testing1','testing description 1','2015-02-24 22:31:16','2015-02-24 22:31:16',1),(172,1,'testing1','testing description 1','2015-02-24 22:31:16','2015-02-24 22:31:16',1),(173,1,'testing1','testing description 1','2015-02-24 22:31:42','2015-02-24 22:31:42',1),(174,1,'testing1','testing description 1','2015-02-24 22:31:42','2015-02-24 22:31:42',1),(175,1,'testing1','testing description 1','2015-02-24 22:31:42','2015-02-24 22:31:42',1),(176,1,'testing1','testing description 1','2015-02-24 22:31:43','2015-02-24 22:31:43',1),(177,1,'testing1','testing description 1','2015-02-24 22:31:43','2015-02-24 22:31:43',1),(178,1,'testing1','testing description 1','2015-02-24 22:31:43','2015-02-24 22:31:43',1),(179,1,'testing1','testing description 1','2015-02-24 22:46:44','2015-02-24 22:46:44',1),(180,1,'testing1','testing description 1','2015-02-24 22:46:45','2015-02-24 22:46:45',1),(181,1,'testing1','testing description 1','2015-02-24 22:46:45','2015-02-24 22:46:45',1),(182,1,'testing1','testing description 1','2015-02-24 22:46:45','2015-02-24 22:46:45',1),(183,1,'testing1','testing description 1','2015-02-24 22:46:45','2015-02-24 22:46:45',1),(184,1,'testing1','testing description 1','2015-02-24 22:46:45','2015-02-24 22:46:45',1),(185,1,'testing1','testing description 1','2015-02-24 22:47:18','2015-02-24 22:47:18',1),(186,1,'testing1','testing description 1','2015-02-24 22:47:18','2015-02-24 22:47:18',1),(187,1,'testing1','testing description 1','2015-02-24 22:47:18','2015-02-24 22:47:18',1),(188,1,'testing1','testing description 1','2015-02-24 22:47:19','2015-02-24 22:47:19',1),(189,1,'testing1','testing description 1','2015-02-24 22:47:19','2015-02-24 22:47:19',1),(190,1,'testing1','testing description 1','2015-02-24 22:47:19','2015-02-24 22:47:19',1),(191,1,'testing1','testing description 1','2015-02-24 23:04:52','2015-02-24 23:04:52',1),(192,1,'testing1','testing description 1','2015-02-24 23:04:52','2015-02-24 23:04:52',1),(193,1,'testing1','testing description 1','2015-02-24 23:04:52','2015-02-24 23:04:52',1),(194,1,'testing1','testing description 1','2015-02-24 23:04:53','2015-02-24 23:04:53',1),(195,1,'testing1','testing description 1','2015-02-24 23:04:53','2015-02-24 23:04:53',1),(196,1,'testing1','testing description 1','2015-02-24 23:04:53','2015-02-24 23:04:53',1),(197,1,'testing1','testing description 1','2015-02-24 23:05:26','2015-02-24 23:05:26',1),(198,1,'testing1','testing description 1','2015-02-24 23:05:26','2015-02-24 23:05:26',1),(199,1,'testing1','testing description 1','2015-02-24 23:05:26','2015-02-24 23:05:26',1),(200,1,'testing1','testing description 1','2015-02-24 23:05:27','2015-02-24 23:05:27',1),(201,1,'testing1','testing description 1','2015-02-24 23:05:27','2015-02-24 23:05:27',1),(202,1,'testing1','testing description 1','2015-02-24 23:05:27','2015-02-24 23:05:27',1),(203,1,'testing1','testing description 1','2015-02-24 23:06:10','2015-02-24 23:06:10',1),(204,1,'testing1','testing description 1','2015-02-24 23:06:10','2015-02-24 23:06:10',1),(205,1,'testing1','testing description 1','2015-02-24 23:06:11','2015-02-24 23:06:11',1),(206,1,'testing1','testing description 1','2015-02-24 23:06:11','2015-02-24 23:06:11',1),(207,1,'testing1','testing description 1','2015-02-24 23:06:11','2015-02-24 23:06:11',1),(208,1,'testing1','testing description 1','2015-02-24 23:06:11','2015-02-24 23:06:11',1),(209,1,'testing1','testing description 1','2015-02-24 23:08:34','2015-02-24 23:08:34',1),(210,1,'testing1','testing description 1','2015-02-24 23:08:34','2015-02-24 23:08:34',1),(211,1,'testing1','testing description 1','2015-02-24 23:08:34','2015-02-24 23:08:34',1),(212,1,'testing1','testing description 1','2015-02-24 23:08:34','2015-02-24 23:08:34',1),(213,1,'testing1','testing description 1','2015-02-24 23:08:34','2015-02-24 23:08:34',1),(214,1,'testing1','testing description 1','2015-02-24 23:08:34','2015-02-24 23:08:34',1),(215,2,'cs001','customer service is important','2015-02-24 23:08:34','2015-02-24 23:08:34',7),(216,1,'Application Defects','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-02-24 23:24:05','2015-02-24 23:24:05',56),(217,1,'Software Functionality','Did the supplier\'s software perform to the specifications/expectations?','2015-02-24 23:24:05','2015-02-24 23:24:05',57),(218,1,'Application Defects','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-02-24 23:24:27','2015-02-24 23:24:27',56),(219,1,'Software Functionality','Did the supplier\'s software perform to the specifications/expectations?','2015-02-24 23:24:27','2015-02-24 23:24:27',57),(220,1,'Application Defects','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-02-24 23:31:31','2015-02-24 23:31:31',56),(221,1,'Software Functionality','Did the supplier\'s software perform to the specifications/expectations?','2015-02-24 23:31:32','2015-02-24 23:31:32',57),(222,1,'testing1','testing description 1','2015-02-24 23:31:43','2015-02-24 23:31:43',1),(223,1,'testing1','testing description 1','2015-02-24 23:31:44','2015-02-24 23:31:44',1),(224,1,'testing1','testing description 1','2015-02-24 23:31:44','2015-02-24 23:31:44',1),(225,1,'testing1','testing description 1','2015-02-24 23:31:44','2015-02-24 23:31:44',1),(226,1,'testing1','testing description 1','2015-02-24 23:31:44','2015-02-24 23:31:44',1),(227,1,'testing1','testing description 1','2015-02-24 23:31:44','2015-02-24 23:31:44',1),(228,2,'cs001','customer service is important','2015-02-24 23:31:45','2015-02-24 23:31:45',7),(229,1,'Application Defects','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-02-25 00:24:51','2015-02-25 00:24:51',56),(230,1,'Software Functionality','Did the supplier\'s software perform to the specifications/expectations?','2015-02-25 00:24:52','2015-02-25 00:24:52',57),(231,1,'testing1','testing description 1','2015-02-25 00:31:09','2015-02-25 00:31:09',1),(232,1,'testing1','testing description 1','2015-02-25 00:31:09','2015-02-25 00:31:09',1),(233,1,'testing1','testing description 1','2015-02-28 03:23:56','2015-02-28 03:23:56',1),(234,1,'testing1','testing description 1','2015-02-28 03:23:56','2015-02-28 03:23:56',1),(235,1,'testing1','testing description 1','2015-02-28 03:23:57','2015-02-28 03:23:57',1),(236,1,'testing1','testing description 1','2015-02-28 03:23:57','2015-02-28 03:23:57',1),(237,1,'testing1','testing description 1','2015-02-28 03:23:57','2015-02-28 03:23:57',1),(238,1,'testing1','testing description 1','2015-02-28 03:23:58','2015-02-28 03:23:58',1),(239,2,'cs001','customer service is important','2015-02-28 03:23:58','2015-02-28 03:23:58',7),(240,1,'testing3','testing description 3','2015-03-18 22:49:50','2015-03-18 22:49:50',3),(241,1,'testing1','testing description 1','2015-03-18 22:49:50','2015-03-18 22:49:50',1),(242,1,'testing3','testing description 3','2015-03-18 22:50:49','2015-03-18 22:50:49',3),(243,1,'testing1','testing description 1','2015-03-18 22:50:50','2015-03-18 22:50:50',1),(244,1,'testing3','testing description 3','2015-03-27 03:23:07','2015-03-27 03:23:07',3),(245,1,'testing1','testing description 1','2015-03-27 03:23:07','2015-03-27 03:23:07',1);
/*!40000 ALTER TABLE `kpis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES (1,'Quality','2015-02-03 20:51:32','2015-02-03 20:51:32',NULL),(2,'Customer Support','2015-02-03 20:51:33','2015-02-03 20:51:33',NULL),(3,'Delivery ad Support','2015-02-04 01:09:20','2015-02-04 01:09:20',20),(4,'Performance','2015-02-05 02:18:15','2015-02-05 02:18:15',20),(5,'Delivery & Support','2015-02-11 00:15:47','2015-02-11 00:15:47',NULL),(6,'Relationship Management','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(7,'Cost/Value','2015-02-11 00:15:48','2015-02-11 00:15:48',NULL),(8,'Compliance','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL),(9,'Risk','2015-02-11 00:15:49','2015-02-11 00:15:49',NULL);
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_id` int(11) DEFAULT NULL,
  `kpi_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rt_supplier` tinyint(1) DEFAULT NULL,
  `rt_business_unit` tinyint(1) DEFAULT NULL,
  `rt_strategic_sourcing` tinyint(1) DEFAULT NULL,
  `rt_supplier_diversity` tinyint(1) DEFAULT NULL,
  `rt_governance` tinyint(1) DEFAULT NULL,
  `srm` tinyint(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `opt1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `average` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,1,'2015-02-03 20:51:33','2015-03-18 22:03:21',1,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(2,1,1,'2015-02-03 20:51:33','2015-02-04 22:29:15',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(3,1,1,'2015-02-03 20:51:33','2015-02-04 22:29:15',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(4,1,1,'2015-02-03 20:51:33','2015-02-04 22:29:15',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(5,1,1,'2015-02-03 20:51:33','2015-02-04 22:29:15',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(6,1,1,'2015-02-03 20:51:33','2015-02-04 22:29:15',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(7,2,7,'2015-02-03 20:51:33','2015-03-18 22:03:27',1,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(8,1,8,'2015-02-03 20:54:00','2015-02-03 20:54:00',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(9,1,9,'2015-02-03 20:54:00','2015-02-03 20:54:00',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(10,1,10,'2015-02-03 20:54:00','2015-02-03 20:54:00',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(11,1,11,'2015-02-03 20:54:00','2015-02-03 20:54:00',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(12,1,12,'2015-02-03 20:54:00','2015-02-03 20:54:00',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(13,1,13,'2015-02-03 20:54:00','2015-02-03 20:54:00',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(14,2,14,'2015-02-03 20:54:00','2015-02-03 20:54:00',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(15,1,15,'2015-02-04 00:05:39','2015-02-04 00:05:39',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(16,1,16,'2015-02-04 00:05:39','2015-02-04 00:05:39',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(17,1,17,'2015-02-04 00:05:39','2015-02-04 00:05:39',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(18,1,18,'2015-02-04 00:05:39','2015-02-04 00:05:39',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(19,1,19,'2015-02-04 00:05:39','2015-02-04 00:05:39',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(20,1,20,'2015-02-04 00:05:39','2015-02-04 00:05:39',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(21,2,21,'2015-02-04 00:05:39','2015-02-04 00:05:39',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(22,1,23,'2015-02-04 04:19:32','2015-02-04 04:19:32',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(23,1,24,'2015-02-04 04:19:32','2015-02-04 04:19:32',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(24,1,25,'2015-02-04 04:19:32','2015-02-04 04:19:32',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(25,1,26,'2015-02-04 04:19:32','2015-02-04 04:19:32',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(26,1,27,'2015-02-04 04:19:32','2015-02-04 04:19:32',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(27,1,28,'2015-02-04 04:19:32','2015-02-04 04:19:32',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(28,2,29,'2015-02-04 04:19:32','2015-02-04 04:19:32',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(29,1,30,'2015-02-04 04:20:33','2015-02-04 04:20:33',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(30,1,31,'2015-02-04 04:20:33','2015-02-04 04:20:33',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(31,1,32,'2015-02-04 04:20:33','2015-02-04 04:20:33',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(32,1,33,'2015-02-04 04:20:33','2015-02-04 04:20:33',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(33,1,34,'2015-02-04 04:20:33','2015-02-04 04:20:33',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(34,1,35,'2015-02-04 04:20:33','2015-02-04 04:20:33',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(35,2,36,'2015-02-04 04:20:33','2015-02-04 04:20:33',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(36,2,7,'2015-02-11 00:15:50','2015-02-25 00:24:37',1,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(37,1,1,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(38,1,1,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(39,1,1,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(40,1,1,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(41,1,1,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(42,5,62,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(43,5,62,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(44,5,62,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(45,5,62,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(46,5,62,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(47,5,62,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(48,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(49,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(50,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(51,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'None','One','Two to three','Four to five','More than five','','',NULL),(52,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(53,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(54,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(55,6,68,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(56,7,76,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(57,7,76,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'0.0','0.15','0.25','0.35','0.5','','',NULL),(58,7,76,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(59,7,76,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'0.01','0.02','0.03','0.04','0.05','','',NULL),(60,7,76,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(61,7,76,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(62,8,82,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(63,8,82,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(64,8,82,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'a','__','Complies with expectations','__','Exceeds expectations','','',NULL),(65,8,82,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(66,8,82,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(67,9,87,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,NULL,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(68,9,87,'2015-02-11 00:15:50','2015-02-11 00:24:18',0,0,0,0,0,0,NULL,'High risk','__','Medium risk','__','Low risk','','',NULL),(69,9,87,'2015-02-11 00:15:50','2015-02-11 00:24:18',1,0,0,0,0,0,NULL,'Medium to high risk','__','Low risk','__','Low risk; Industry leader in proactively managing Reputational Risk','','',NULL),(70,4,37,'2015-02-11 00:15:50','2015-02-25 00:24:37',0,0,0,0,0,0,NULL,'Medium to high risk','__','Low risk','__','Low risk; Industry leader in proactively managing Reputational Risk','','',NULL),(71,1,91,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,1,1,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(72,1,92,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(73,1,93,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(74,1,94,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(75,1,95,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(76,1,96,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(77,5,97,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(78,5,98,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(79,5,99,'2015-02-11 00:26:10','2015-02-11 00:26:10',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(80,5,100,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(81,5,101,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(82,5,102,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(83,6,103,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(84,6,104,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(85,6,105,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(86,6,106,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'None','One','Two to three','Four to five','More than five','','',NULL),(87,6,107,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(88,6,108,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(89,6,109,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(90,6,110,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(91,7,111,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(92,7,112,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'0.0','0.15','0.25','0.35','0.5','','',NULL),(93,7,113,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(94,7,114,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'0.01','0.02','0.03','0.04','0.05','','',NULL),(95,7,115,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(96,7,116,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(97,8,117,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(98,8,118,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(99,8,119,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'a','__','Complies with expectations','__','Exceeds expectations','','',NULL),(100,8,120,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(101,8,121,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(102,9,122,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,NULL,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(103,9,123,'2015-02-11 00:26:11','2015-02-11 00:26:11',0,0,0,0,0,0,NULL,'High risk','__','Medium risk','__','Low risk','','',NULL),(104,9,124,'2015-02-11 00:26:11','2015-02-11 00:26:11',1,0,0,0,0,0,NULL,'Medium to high risk','__','Low risk','__','Low risk; Industry leader in proactively managing Reputational Risk','','',NULL),(105,4,125,'2015-02-11 00:26:11','2015-02-11 00:26:11',NULL,NULL,NULL,NULL,0,NULL,NULL,'Medium to high risk','__','Low risk','__','Low risk; Industry leader in proactively managing Reputational Risk','','',NULL),(106,1,126,'2015-02-24 00:22:35','2015-02-24 00:22:35',1,1,1,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(107,1,127,'2015-02-24 00:22:35','2015-02-24 00:22:35',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(108,1,128,'2015-02-24 00:22:35','2015-02-24 00:22:35',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(109,1,129,'2015-02-24 00:22:35','2015-02-24 00:22:35',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(110,1,130,'2015-02-24 00:22:35','2015-02-24 00:22:35',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(111,1,131,'2015-02-24 00:22:35','2015-02-24 00:22:35',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(112,5,132,'2015-02-24 00:22:36','2015-02-24 00:22:36',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(113,5,133,'2015-02-24 00:22:36','2015-02-24 00:22:36',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(114,5,134,'2015-02-24 00:22:36','2015-02-24 00:22:36',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(115,5,135,'2015-02-24 00:22:36','2015-02-24 00:22:36',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(116,5,136,'2015-02-24 00:22:36','2015-02-24 00:22:36',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(117,5,137,'2015-02-24 00:22:36','2015-02-24 00:22:36',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(118,6,138,'2015-02-24 00:22:37','2015-02-24 00:22:37',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(119,6,139,'2015-02-24 00:22:37','2015-02-24 00:22:37',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(120,6,140,'2015-02-24 00:22:37','2015-02-24 00:22:37',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(121,6,141,'2015-02-24 00:22:37','2015-02-24 00:22:37',1,0,0,0,0,0,0,'None','One','Two to three','Four to five','More than five','','',NULL),(122,6,142,'2015-02-24 00:22:37','2015-02-24 00:22:37',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(123,6,143,'2015-02-24 00:22:37','2015-02-24 00:22:37',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(124,6,144,'2015-02-24 00:22:37','2015-02-24 00:22:37',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(125,6,145,'2015-02-24 00:22:37','2015-02-24 00:22:37',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(126,7,146,'2015-02-24 00:22:38','2015-02-24 00:22:38',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(127,7,147,'2015-02-24 00:22:38','2015-02-24 00:22:38',0,0,0,0,0,0,0,'0.0','0.15','0.25','0.35','0.5','','',NULL),(128,7,148,'2015-02-24 00:22:38','2015-02-24 00:22:38',0,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(129,7,149,'2015-02-24 00:22:38','2015-02-24 00:22:38',0,0,0,0,0,0,0,'0.01','0.02','0.03','0.04','0.05','','',NULL),(130,7,150,'2015-02-24 00:22:38','2015-02-24 00:22:38',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(131,7,151,'2015-02-24 00:22:38','2015-02-24 00:22:38',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(132,8,152,'2015-02-24 00:22:39','2015-02-24 00:22:39',1,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(133,8,153,'2015-02-24 00:22:39','2015-02-24 00:22:39',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(134,8,154,'2015-02-24 00:22:39','2015-02-24 00:22:39',0,0,0,0,0,0,0,'a','__','Complies with expectations','__','Exceeds expectations','','',NULL),(135,8,155,'2015-02-24 00:22:39','2015-02-24 00:22:39',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(136,8,156,'2015-02-24 00:22:39','2015-02-24 00:22:39',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(137,9,157,'2015-02-24 00:22:39','2015-02-24 00:22:39',0,0,0,0,0,0,NULL,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(138,9,158,'2015-02-24 00:22:39','2015-02-24 00:22:39',0,0,0,0,0,0,NULL,'High risk','__','Medium risk','__','Low risk','','',NULL),(139,9,159,'2015-02-24 00:22:40','2015-02-24 00:22:40',1,0,0,0,0,0,NULL,'Medium to high risk','__','Low risk','__','Low risk; Industry leader in proactively managing Reputational Risk','','',NULL),(140,4,160,'2015-02-24 00:22:40','2015-02-24 00:22:40',NULL,NULL,NULL,NULL,0,NULL,NULL,'Medium to high risk','__','Low risk','__','Low risk; Industry leader in proactively managing Reputational Risk','','',NULL),(141,1,161,'2015-02-24 22:22:47','2015-02-24 22:22:47',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(142,1,162,'2015-02-24 22:22:47','2015-02-24 22:22:47',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(143,1,163,'2015-02-24 22:22:48','2015-02-24 22:22:48',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(144,1,164,'2015-02-24 22:22:48','2015-02-24 22:22:48',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(145,1,165,'2015-02-24 22:22:48','2015-02-24 22:22:48',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(146,1,166,'2015-02-24 22:22:48','2015-02-24 22:22:48',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(147,1,167,'2015-02-24 22:31:15','2015-02-24 22:31:15',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(148,1,168,'2015-02-24 22:31:15','2015-02-24 22:31:15',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(149,1,169,'2015-02-24 22:31:15','2015-02-24 22:31:15',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(150,1,170,'2015-02-24 22:31:16','2015-02-24 22:31:16',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(151,1,171,'2015-02-24 22:31:16','2015-02-24 22:31:16',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(152,1,172,'2015-02-24 22:31:16','2015-02-24 22:31:16',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(153,1,173,'2015-02-24 22:31:42','2015-02-24 22:31:42',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(154,1,174,'2015-02-24 22:31:42','2015-02-24 22:31:42',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(155,1,175,'2015-02-24 22:31:42','2015-02-24 22:31:42',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(156,1,176,'2015-02-24 22:31:43','2015-02-24 22:31:43',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(157,1,177,'2015-02-24 22:31:43','2015-02-24 22:31:43',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(158,1,178,'2015-02-24 22:31:43','2015-02-24 22:31:43',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(159,1,179,'2015-02-24 22:46:45','2015-02-24 22:46:45',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(160,1,180,'2015-02-24 22:46:45','2015-02-24 22:46:45',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(161,1,181,'2015-02-24 22:46:45','2015-02-24 22:46:45',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(162,1,182,'2015-02-24 22:46:45','2015-02-24 22:46:45',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(163,1,183,'2015-02-24 22:46:45','2015-02-24 22:46:45',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(164,1,184,'2015-02-24 22:46:45','2015-02-24 22:46:45',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(165,1,185,'2015-02-24 22:47:18','2015-02-24 22:47:18',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(166,1,186,'2015-02-24 22:47:18','2015-02-24 22:47:18',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(167,1,187,'2015-02-24 22:47:19','2015-02-24 22:47:19',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(168,1,188,'2015-02-24 22:47:19','2015-02-24 22:47:19',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(169,1,189,'2015-02-24 22:47:19','2015-02-24 22:47:19',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(170,1,190,'2015-02-24 22:47:19','2015-02-24 22:47:19',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(171,1,191,'2015-02-24 23:04:52','2015-02-24 23:04:52',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(172,1,192,'2015-02-24 23:04:52','2015-02-24 23:04:52',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(173,1,193,'2015-02-24 23:04:52','2015-02-24 23:04:52',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(174,1,194,'2015-02-24 23:04:53','2015-02-24 23:04:53',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(175,1,195,'2015-02-24 23:04:53','2015-02-24 23:04:53',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(176,1,196,'2015-02-24 23:04:53','2015-02-24 23:04:53',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(177,1,197,'2015-02-24 23:05:26','2015-02-24 23:05:26',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(178,1,198,'2015-02-24 23:05:26','2015-02-24 23:05:26',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(179,1,199,'2015-02-24 23:05:26','2015-02-24 23:05:26',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(180,1,200,'2015-02-24 23:05:27','2015-02-24 23:05:27',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(181,1,201,'2015-02-24 23:05:27','2015-02-24 23:05:27',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(182,1,202,'2015-02-24 23:05:27','2015-02-24 23:05:27',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(183,1,203,'2015-02-24 23:06:10','2015-02-24 23:06:10',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(184,1,204,'2015-02-24 23:06:11','2015-02-24 23:06:11',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(185,1,205,'2015-02-24 23:06:11','2015-02-24 23:06:11',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(186,1,206,'2015-02-24 23:06:11','2015-02-24 23:06:11',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(187,1,207,'2015-02-24 23:06:11','2015-02-24 23:06:11',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(188,1,208,'2015-02-24 23:06:11','2015-02-24 23:06:11',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(189,1,209,'2015-02-24 23:08:34','2015-02-24 23:08:34',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(190,1,210,'2015-02-24 23:08:34','2015-02-24 23:08:34',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(191,1,211,'2015-02-24 23:08:34','2015-02-24 23:08:34',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(192,1,212,'2015-02-24 23:08:34','2015-02-24 23:08:34',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(193,1,213,'2015-02-24 23:08:34','2015-02-24 23:08:34',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(194,1,214,'2015-02-24 23:08:34','2015-02-24 23:08:34',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(195,2,215,'2015-02-24 23:08:34','2015-02-24 23:08:34',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(196,1,1,'2015-02-24 23:23:10','2015-02-25 00:26:54',1,0,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(197,1,1,'2015-02-24 23:23:10','2015-02-25 00:26:54',1,1,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(198,1,216,'2015-02-24 23:24:05','2015-02-24 23:24:05',1,0,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(199,1,217,'2015-02-24 23:24:05','2015-02-24 23:24:05',1,1,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(200,1,218,'2015-02-24 23:24:27','2015-02-24 23:24:27',1,0,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(201,1,219,'2015-02-24 23:24:27','2015-02-24 23:24:27',1,1,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(202,1,220,'2015-02-24 23:31:32','2015-02-24 23:31:32',1,0,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(203,1,221,'2015-02-24 23:31:32','2015-02-24 23:31:32',1,1,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(204,1,222,'2015-02-24 23:31:44','2015-02-24 23:31:44',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(205,1,223,'2015-02-24 23:31:44','2015-02-24 23:31:44',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(206,1,224,'2015-02-24 23:31:44','2015-02-24 23:31:44',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(207,1,225,'2015-02-24 23:31:44','2015-02-24 23:31:44',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(208,1,226,'2015-02-24 23:31:44','2015-02-24 23:31:44',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(209,1,227,'2015-02-24 23:31:44','2015-02-24 23:31:44',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(210,2,228,'2015-02-24 23:31:45','2015-02-24 23:31:45',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(211,1,229,'2015-02-25 00:24:51','2015-02-25 00:24:51',1,0,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(212,1,230,'2015-02-25 00:24:52','2015-02-25 00:24:52',1,1,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(213,1,1,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(214,1,1,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(215,1,1,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(216,1,1,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(217,5,62,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(218,5,62,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(219,5,62,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(220,5,62,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(221,5,62,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(222,6,68,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(223,6,68,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(224,6,68,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'None','One','Two to three','Four to five','More than five','','',NULL),(225,6,68,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(226,6,68,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(227,6,68,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(228,6,68,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(229,7,76,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'0.0','0.15','0.25','0.35','0.5','','',NULL),(230,7,76,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'Never','Sometimes','Usually','Almost Always','Every time','','',NULL),(231,7,76,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'0.01','0.02','0.03','0.04','0.05','','',NULL),(232,7,76,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(233,7,76,'2015-02-25 00:25:21','2015-02-25 00:26:54',1,0,0,0,0,0,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(234,8,82,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(235,8,82,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'a','__','Complies with expectations','__','Exceeds expectations','','',NULL),(236,8,82,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(237,8,82,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,0,'Does not comply with expectations','__','Complies with expectations','__','Exceeds expectations','','',NULL),(238,9,87,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,NULL,'High risk','__','Medium risk','__','Low risk','','',NULL),(239,9,87,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,NULL,'Medium to high risk','__','Low risk','__','Low risk; Industry leader in proactively managing Reputational Risk','','',NULL),(240,9,87,'2015-02-25 00:25:21','2015-02-25 00:26:54',0,0,0,0,0,0,NULL,'Does not meet expectations','__','Meets expectations','__','Exceeds expectations','','',NULL),(241,1,231,'2015-02-25 00:31:09','2015-03-16 20:09:57',1,0,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',2),(242,1,232,'2015-02-25 00:31:09','2015-03-16 20:09:57',1,1,0,0,0,0,NULL,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',5),(243,1,233,'2015-02-28 03:23:56','2015-02-28 03:23:56',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(244,1,234,'2015-02-28 03:23:56','2015-02-28 03:23:56',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(245,1,235,'2015-02-28 03:23:57','2015-02-28 03:23:57',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(246,1,236,'2015-02-28 03:23:57','2015-02-28 03:23:57',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(247,1,237,'2015-02-28 03:23:57','2015-02-28 03:23:57',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(248,1,238,'2015-02-28 03:23:58','2015-02-28 03:23:58',0,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(249,2,239,'2015-02-28 03:23:58','2015-02-28 03:23:58',1,0,0,0,0,0,0,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(250,1,2,'2015-03-18 22:03:21','2015-03-18 22:03:22',1,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(251,1,3,'2015-03-18 22:03:22','2015-03-18 22:03:23',1,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(252,1,4,'2015-03-18 22:03:23','2015-03-18 22:03:24',1,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(253,1,5,'2015-03-18 22:03:24','2015-03-18 22:03:25',1,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(254,1,6,'2015-03-18 22:03:25','2015-03-18 22:03:26',0,1,1,1,1,1,0,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innovator',NULL),(255,1,3,'2015-03-18 22:31:31','2015-03-18 22:31:31',1,1,0,0,0,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(256,1,1,'2015-03-18 22:31:31','2015-03-18 22:31:31',1,1,1,1,1,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(257,1,240,'2015-03-18 22:49:50','2015-03-18 22:49:50',1,1,0,0,0,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(258,1,241,'2015-03-18 22:49:50','2015-03-18 22:49:50',1,1,1,1,1,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',NULL),(259,1,242,'2015-03-18 22:50:50','2015-03-29 04:16:41',1,1,0,0,0,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',1),(260,1,243,'2015-03-18 22:50:50','2015-03-29 04:16:41',1,1,1,1,1,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',6),(261,1,244,'2015-03-27 03:23:07','2015-03-27 03:37:19',1,1,0,0,0,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',2),(262,1,245,'2015-03-27 03:23:07','2015-03-27 03:37:20',1,1,1,1,1,0,2,'Way below expectations','Far below expectations','Below expectations','Meets expectations','Exceeds expectations','Far exceeds expectations','Way above expectations',0);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `answer_option` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (1,8,1,1,'testing','2015-02-03 21:15:23','2015-02-03 21:15:23'),(2,9,1,2,'testing','2015-02-03 21:15:23','2015-02-03 21:15:23'),(3,10,1,4,'','2015-02-03 21:15:23','2015-02-03 21:15:23'),(4,11,1,4,'','2015-02-03 21:15:23','2015-02-03 21:15:23'),(5,12,1,4,'','2015-02-03 21:15:23','2015-02-03 21:15:23'),(6,14,1,4,'','2015-02-03 21:15:23','2015-02-03 21:15:23'),(7,22,3,1,'testing again','2015-02-04 04:25:11','2015-02-04 04:25:11'),(8,23,3,3,'','2015-02-04 04:25:11','2015-02-04 04:25:11'),(9,24,3,3,'','2015-02-04 04:25:11','2015-02-04 04:25:11'),(10,25,3,0,'','2015-02-04 04:25:11','2015-02-04 04:25:11'),(11,26,3,0,'','2015-02-04 04:25:11','2015-02-04 04:25:11'),(12,28,3,2,'testing again','2015-02-04 04:25:11','2015-02-04 04:25:11'),(13,153,5,1,'','2015-02-24 22:45:13','2015-02-24 22:45:13'),(14,154,5,2,'','2015-02-24 22:45:13','2015-02-24 22:45:13'),(15,155,5,2,'','2015-02-24 22:45:13','2015-02-24 22:45:13'),(16,156,5,2,'','2015-02-24 22:45:13','2015-02-24 22:45:13'),(17,157,5,2,'','2015-02-24 22:45:13','2015-02-24 22:45:13'),(20,200,6,1,'HEy','2015-02-24 23:29:05','2015-02-24 23:29:05'),(21,201,6,1,'YEh','2015-02-24 23:29:05','2015-02-24 23:29:05'),(22,241,7,1,'','2015-02-25 00:34:45','2015-02-25 00:37:16'),(23,242,7,7,'Great','2015-02-25 00:34:45','2015-02-25 00:37:16'),(24,241,8,3,'','2015-03-16 19:59:20','2015-03-16 19:59:20'),(25,242,8,4,'','2015-03-16 19:59:20','2015-03-16 19:59:20'),(26,259,9,1,'testing','2015-03-18 22:51:36','2015-03-18 23:07:59'),(27,260,9,6,'','2015-03-18 22:51:36','2015-03-18 23:07:59'),(28,261,10,2,'testing again and again is a lot of fun','2015-03-27 03:23:31','2015-03-27 03:24:15'),(29,262,10,0,'','2015-03-27 03:23:31','2015-03-27 03:23:31');
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_types`
--

DROP TABLE IF EXISTS `reviewer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_types`
--

LOCK TABLES `reviewer_types` WRITE;
/*!40000 ALTER TABLE `reviewer_types` DISABLE KEYS */;
INSERT INTO `reviewer_types` VALUES (1,'Supplier','2015-02-03 18:47:16','2015-02-03 18:47:16'),(2,'Business Unit','2015-02-03 18:47:16','2015-02-03 18:47:16'),(3,'Strategic Sourcing','2015-02-03 18:47:16','2015-02-03 18:47:16'),(4,'Supplier Diversity','2015-02-03 18:47:17','2015-02-03 18:47:17'),(5,'Governance','2015-02-03 18:47:17','2015-02-03 18:47:17'),(6,'SRM','2015-02-03 18:47:17','2015-02-03 18:47:17');
/*!40000 ALTER TABLE `reviewer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers`
--

DROP TABLE IF EXISTS `reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `survey_sent` tinyint(1) DEFAULT NULL,
  `reviewer_type_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_complete` tinyint(1) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `division` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers`
--

LOCK TABLES `reviewers` WRITE;
/*!40000 ALTER TABLE `reviewers` DISABLE KEYS */;
INSERT INTO `reviewers` VALUES (1,'sher','khan','sameerrsi@gmail.com','2015-02-03 20:56:50','2015-02-03 21:15:24',NULL,1,'6BCA2989C7',0,NULL,NULL,NULL,NULL,NULL),(2,'so','swati','soswati@gmail.com','2015-02-04 04:02:15','2015-02-04 04:02:15',NULL,1,'31A3C8B9EE',NULL,NULL,NULL,NULL,NULL,NULL),(3,'some','one','soswati@gmail.com','2015-02-04 04:21:46','2015-02-04 04:25:11',NULL,1,'06C79CC926',0,NULL,NULL,NULL,NULL,NULL),(4,'champ','man','sash_us2000@yahoo.com','2015-02-04 04:33:18','2015-02-04 04:36:40',NULL,1,'945FC6751D',0,NULL,NULL,NULL,NULL,NULL),(5,'marshall','Schulte','marshall.schulte@resourcestack.com','2015-02-24 22:31:42','2015-02-24 22:46:04',NULL,1,'7D4D13BD36',0,NULL,NULL,NULL,NULL,NULL),(6,'Marshall','Schulte','marshall.schulte@resourcestack.com','2015-02-24 23:24:26','2015-02-26 01:12:27',NULL,1,'9FCBA64FD9',0,NULL,NULL,NULL,NULL,NULL),(7,'greg','favitta','gfavitta@gmail.com','2015-02-25 00:31:09','2015-02-25 00:37:17',NULL,1,'2E035BD6F0',1,NULL,NULL,NULL,NULL,NULL),(8,'sameer','sharma','sameer.sharma@resourcstack.com','2015-02-25 00:31:09','2015-03-16 20:04:37',NULL,1,'9302B888BF',NULL,NULL,NULL,NULL,NULL,NULL),(9,'testing','tester','testing@tester.com','2015-03-18 22:50:49','2015-03-20 21:45:37',NULL,1,'3A54798571',0,'rrr','rrrr','rrr','','rrr'),(10,'testing','again','testing.again@testers.com','2015-03-27 03:21:10','2015-03-27 03:24:15',NULL,1,'0DEF7B59F5',1,'eee','eee','eere','rrr','ttt');
/*!40000 ALTER TABLE `reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','2015-02-03 18:47:15','2015-02-03 18:47:15'),(2,'Campaign Manager','2015-02-03 18:47:15','2015-02-03 18:47:15'),(3,'Specialist','2015-02-03 18:47:15','2015-02-03 18:47:15');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141217205847'),('20141217210832'),('20141218133404'),('20141218133427'),('20141218133608'),('20141218134521'),('20141218135103'),('20141218135132'),('20141218221745'),('20141218230928'),('20141218231127'),('20141219212931'),('20141219212957'),('20141219221812'),('20141219221818'),('20141222151409'),('20141222154325'),('20141222212209'),('20141223031759'),('20141223032104'),('20141223032240'),('20141223163545'),('20141223165252'),('20141223180559'),('20141223181152'),('20141223181607'),('20141223182737'),('20141223200039'),('20141224172037'),('20141229145204'),('20141229145219'),('20141229145328'),('20141229161223'),('20150107071725'),('20150107183430'),('20150107183546'),('20150107183632'),('20150107183702'),('20150107183740'),('20150107183808'),('20150107184304'),('20150107185319'),('20150108175937'),('20150108180033'),('20150108190410'),('20150113014120'),('20150113023019'),('20150113071543'),('20150113071854'),('20150113223424'),('20150114123245'),('20150115200933'),('20150115212410'),('20150115220733'),('20150116193446'),('20150116194519'),('20150118075322'),('20150120161254'),('20150122200538'),('20150202183345'),('20150202211109'),('20150211221328'),('20150219211636'),('20150227170322'),('20150227203000'),('20150303171504'),('20150303202523'),('20150318180924'),('20150318212808'),('20150323155419'),('20150324162714'),('20150326210054'),('20150327190524');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_answers`
--

DROP TABLE IF EXISTS `survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attempt_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_answers`
--

LOCK TABLES `survey_answers` WRITE;
/*!40000 ALTER TABLE `survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_attempts`
--

DROP TABLE IF EXISTS `survey_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) DEFAULT NULL,
  `participant_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `winner` tinyint(1) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_attempts`
--

LOCK TABLES `survey_attempts` WRITE;
/*!40000 ALTER TABLE `survey_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_options`
--

DROP TABLE IF EXISTS `survey_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_options`
--

LOCK TABLES `survey_options` WRITE;
/*!40000 ALTER TABLE `survey_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_surveys`
--

DROP TABLE IF EXISTS `survey_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `attempts_number` int(11) DEFAULT '0',
  `finished` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_surveys`
--

LOCK TABLES `survey_surveys` WRITE;
/*!40000 ALTER TABLE `survey_surveys` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invites`
--

DROP TABLE IF EXISTS `user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invited` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
INSERT INTO `user_invites` VALUES (1,'pranab','khanal','pranab.khanal@resourcestack.com',NULL,'2015-02-03 18:57:21','2015-02-03 18:57:21',2,2),(2,'marsall','schulte','marshall.schulte@resourcestack.com',NULL,'2015-02-03 18:58:43','2015-02-03 18:58:43',3,2),(3,'sabka','dost','sash_us2000@yahoo.com',NULL,'2015-02-03 20:54:30','2015-02-03 20:54:30',2,3),(4,'Sameer','Sharma','sameerrsi@gmail.com',NULL,'2015-02-04 00:02:44','2015-02-04 00:02:44',4,2),(5,'Greg','Favitta','greg.favitta@edcconsulting.com',NULL,'2015-02-04 00:06:34','2015-02-04 00:06:34',4,3),(6,'Tyler','Aarons','tyleraarons@gmail.com',NULL,'2015-02-04 01:03:51','2015-02-04 01:03:51',4,3),(7,'doug','Loss','dougloss@hotdog.com',NULL,'2015-02-04 02:58:15','2015-02-04 02:58:15',11,2),(8,'swati','sharma','swati@resourcestack.com',NULL,'2015-02-04 04:16:24','2015-02-04 04:16:24',12,2),(9,'Greg','Favitta','greg@1.com',NULL,'2015-02-04 23:54:19','2015-02-04 23:54:19',13,2),(10,'testing','monday','sharma127@avaya.com',NULL,'2015-02-23 22:41:58','2015-02-23 22:41:58',21,2),(11,'testing','specialist1','testing@specialist2.com',NULL,'2015-02-23 23:03:26','2015-02-23 23:03:26',4,3);
/*!40000 ALTER TABLE `user_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1,'2015-02-03 18:56:11','2015-02-03 18:56:11'),(2,2,2,'2015-02-03 18:57:26','2015-02-03 18:57:26'),(3,3,2,'2015-02-03 18:58:46','2015-02-03 18:58:46'),(4,4,3,'2015-02-03 20:54:34','2015-02-03 20:54:34'),(5,5,1,'2015-02-03 23:57:28','2015-02-03 23:57:28'),(6,6,1,'2015-02-03 23:58:34','2015-02-03 23:58:34'),(7,7,2,'2015-02-04 00:02:48','2015-02-04 00:02:48'),(8,8,3,'2015-02-04 00:06:36','2015-02-04 00:06:36'),(9,9,3,'2015-02-04 01:03:55','2015-02-04 01:03:55'),(10,NULL,2,'2015-02-04 02:55:48','2015-02-04 02:55:48'),(11,NULL,2,'2015-02-04 02:55:53','2015-02-04 02:55:53'),(12,NULL,2,'2015-02-04 02:56:22','2015-02-04 02:56:22'),(13,NULL,2,'2015-02-04 02:56:30','2015-02-04 02:56:30'),(14,NULL,2,'2015-02-04 02:57:40','2015-02-04 02:57:40'),(15,NULL,2,'2015-02-04 02:57:45','2015-02-04 02:57:45'),(16,10,2,'2015-02-04 02:58:19','2015-02-04 02:58:19'),(17,11,2,'2015-02-04 04:16:27','2015-02-04 04:16:27'),(18,12,2,'2015-02-04 23:54:23','2015-02-04 23:54:23'),(19,13,2,'2015-02-23 22:41:59','2015-02-23 22:41:59'),(20,14,3,'2015-02-23 23:03:28','2015-02-23 23:03:28');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `invitation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invitation_created_at` datetime DEFAULT NULL,
  `invitation_sent_at` datetime DEFAULT NULL,
  `invitation_accepted_at` datetime DEFAULT NULL,
  `invitation_limit` int(11) DEFAULT NULL,
  `invited_by_id` int(11) DEFAULT NULL,
  `invited_by_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `senior_specialist` tinyint(1) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_invitation_token` (`invitation_token`),
  KEY `index_users_on_invited_by_id` (`invited_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sameer.sharma@resourcestack.com','$2a$10$IQxUoWzoco7S.G1dKt5n8.Q2XoKf51hLD1gSQmXvES080lLhGTMbW',NULL,NULL,NULL,35,'2015-05-18 04:35:56','2015-05-14 22:09:38','205.160.171.251','205.160.171.251','2015-02-03 18:56:11','2015-05-18 04:35:56','sameer','sharma',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(2,'pranab.khanal@resourcestack.com','$2a$10$ZISaJ4YuSKvFlpfbAVnQGO/48xHELkAeUIJIBAhenF1fqPCcm0QK2',NULL,NULL,NULL,9,'2015-02-05 02:45:57','2015-02-04 04:03:10','108.18.123.92','192.168.1.1','2015-02-03 18:57:22','2015-02-05 02:45:57','pranab','khanal',NULL,NULL,'2015-02-03 18:57:22','2015-02-03 18:57:22','2015-02-03 20:50:24',NULL,NULL,NULL,2,NULL,NULL),(3,'marshall.schulte@resourcestack.com','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-02-03 18:58:43','2015-02-03 18:58:46','marsall','schulte',NULL,'04bb58dc63cea313e86a21b4482fd579c4297b964e8c9c2c894b94d2bed214fb','2015-02-03 18:58:43','2015-02-03 18:58:43',NULL,NULL,NULL,NULL,3,NULL,NULL),(4,'sash_us2000@yahoo.com','$2a$10$g7k3zR4EGrRtwhefkecYIe4Qt91moXH6I9dPsuGcHvyPer8nrsye.',NULL,NULL,NULL,17,'2015-03-16 20:31:58','2015-02-11 17:01:39','205.160.171.251','70.183.1.102','2015-02-03 20:54:31','2015-03-16 20:31:58','sabka','dost',NULL,NULL,'2015-02-03 20:54:31','2015-02-03 20:54:31','2015-02-03 20:56:11',NULL,NULL,NULL,2,0,NULL),(5,'tyleramclellan@gmail.com','$2a$10$Enp5jp1/bIECRiML9h0iS.B9tVLcu0uneOz4WOah7eckf4EoNnulC',NULL,NULL,NULL,8,'2015-03-08 21:17:05','2015-02-05 02:23:20','173.73.119.11','108.18.123.92','2015-02-03 23:57:28','2015-03-08 21:17:05','tyler','Mclellan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(6,'gfavitta@gmail.com','$2a$10$XO/niTUTgFZ5A4Du5FFAu.Nd.X3R3.My3qYoZPy7ci1cHu7KdH/p2',NULL,NULL,NULL,9,'2015-02-26 02:34:47','2015-02-23 18:28:18','108.18.123.92','68.106.146.142','2015-02-03 23:58:34','2015-02-26 02:34:47','Greg','Favitta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(7,'sameerrsi@gmail.com','$2a$10$b9QWuVG82SnAkclqo6peL.dZxEsMjBfRL7gY8XNvyCtG9tfCltQsW',NULL,NULL,NULL,74,'2015-05-29 13:41:30','2015-05-27 19:25:27','205.160.171.251','70.183.1.73','2015-02-04 00:02:45','2015-05-29 13:41:30','Sameer','Sharma',NULL,NULL,'2015-02-04 00:02:45','2015-02-04 00:02:45','2015-02-04 00:03:27',NULL,NULL,NULL,4,NULL,NULL),(8,'greg.favitta@edcconsulting.com','$2a$10$8H9HNxh3XPf7n.ZZ5hqNJ.94blHMFkI0ChvNYxQeW571HsJak4a9G',NULL,NULL,NULL,6,'2015-03-08 21:15:27','2015-02-06 22:16:52','173.73.119.11','70.183.1.102','2015-02-04 00:06:34','2015-03-30 23:55:32','Greg','Favitta',NULL,NULL,'2015-02-04 00:06:34','2015-02-04 00:06:34','2015-02-04 01:20:34',NULL,NULL,NULL,4,0,NULL),(9,'tyleraarons@gmail.com','$2a$10$CNhMhYrnG8lVIN3MY9D.3udoGNbTELxuaLm6yM0yrk4eTAeM6Lrr.',NULL,NULL,NULL,4,'2015-03-08 21:16:22','2015-02-28 03:22:37','173.73.119.11','192.168.1.1','2015-02-04 01:03:52','2015-03-08 21:16:22','Tyler','Aarons',NULL,NULL,'2015-02-04 01:03:52','2015-02-04 01:03:52','2015-02-05 01:32:32',NULL,NULL,NULL,4,1,NULL),(10,'dougloss@hotdog.com','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-02-04 02:58:16','2015-02-04 02:58:18','doug','Loss',NULL,'ca8d5f38e19d2dfc635ff8e10e1063f1f6121312a5a7cf6d5bd8e61233f97630','2015-02-04 02:58:16','2015-02-04 02:58:16',NULL,NULL,NULL,NULL,11,NULL,NULL),(11,'swati@resourcestack.com','$2a$10$P1nC8W9cAe8EWG2WHzZBQeqeGhc486X5lf4gBJTgN1OGuM/hL79fa',NULL,NULL,NULL,3,'2015-02-05 00:55:58','2015-02-04 22:33:12','192.168.1.1','205.160.171.251','2015-02-04 04:16:25','2015-02-05 00:55:58','swati','sharma',NULL,NULL,'2015-02-04 04:16:25','2015-02-04 04:16:25','2015-02-04 04:18:55',NULL,NULL,NULL,12,NULL,NULL),(12,'greg@1.com','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-02-04 23:54:20','2015-02-04 23:54:23','Greg','Favitta',NULL,'c2cd4197c070eef5b2109abc51c6180268c2f1ef029a9973f433a0bf6457ac69','2015-02-04 23:54:20','2015-02-04 23:54:20',NULL,NULL,NULL,NULL,13,NULL,NULL),(13,'sharma127@avaya.com','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2015-02-23 22:41:59','2015-02-23 22:41:59','testing','monday',NULL,'332156df76db1e4aa23619f0a12e1bb6406f2bdaf5ce4e5aca6b2dc6e42f55ba','2015-02-23 22:41:59','2015-02-23 22:41:59',NULL,NULL,NULL,NULL,21,NULL,NULL),(14,'testing@specialist2.com','$2a$10$AONIiP.OVrGXZA051yMNlui3k3fBnpVwPVn9/M5qHnU732G2a.0E2',NULL,NULL,NULL,26,'2015-04-27 21:30:19','2015-03-30 22:10:59','205.160.171.251','70.183.1.73','2015-02-23 23:03:27','2015-04-27 21:30:19','Cedric','Frog',NULL,NULL,'2015-02-23 23:03:27','2015-02-23 23:03:27','2015-02-23 23:09:13',NULL,NULL,NULL,4,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_campaigns_joins`
--

DROP TABLE IF EXISTS `users_campaigns_joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_campaigns_joins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_campaigns_joins`
--

LOCK TABLES `users_campaigns_joins` WRITE;
/*!40000 ALTER TABLE `users_campaigns_joins` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_campaigns_joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vassociations`
--

DROP TABLE IF EXISTS `vassociations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vassociations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `vtype_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vassociations_on_vendor_id` (`vendor_id`),
  KEY `index_vassociations_on_vtype_id` (`vtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vassociations`
--

LOCK TABLES `vassociations` WRITE;
/*!40000 ALTER TABLE `vassociations` DISABLE KEYS */;
INSERT INTO `vassociations` VALUES (1,1,1,'2015-02-03 20:53:03','2015-02-03 20:53:03'),(4,2,2,'2015-02-04 19:51:08','2015-02-04 19:51:08'),(5,2,3,'2015-02-04 22:26:36','2015-02-04 22:26:36'),(6,3,2,'2015-02-04 22:31:04','2015-02-04 22:31:04'),(7,4,5,'2015-02-23 19:57:34','2015-02-23 19:57:34'),(8,4,6,'2015-02-23 19:57:34','2015-02-23 19:57:34'),(9,4,7,'2015-02-23 19:57:34','2015-02-23 19:57:34'),(10,5,8,'2015-02-23 19:57:35','2015-02-23 19:57:35'),(11,5,9,'2015-02-23 19:57:35','2015-02-23 19:57:35'),(12,5,10,'2015-02-23 19:57:35','2015-02-23 19:57:35'),(13,6,5,'2015-02-23 22:40:03','2015-02-23 22:40:03'),(14,6,6,'2015-02-23 22:40:03','2015-02-23 22:40:03'),(15,6,7,'2015-02-23 22:40:03','2015-02-23 22:40:03'),(16,7,8,'2015-02-23 22:40:03','2015-02-23 22:40:03'),(17,7,9,'2015-02-23 22:40:03','2015-02-23 22:40:03'),(18,7,10,'2015-02-23 22:40:03','2015-02-23 22:40:03'),(19,8,1,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(20,8,2,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(21,8,3,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(22,8,5,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(23,8,6,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(24,8,7,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(25,8,8,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(26,8,9,'2015-02-23 22:55:36','2015-02-23 22:55:36'),(27,9,1,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(28,9,2,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(29,9,3,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(30,9,5,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(31,9,6,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(32,9,7,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(33,9,8,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(34,9,9,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(35,9,10,'2015-02-23 22:56:26','2015-02-23 22:56:26'),(36,10,1,'2015-02-24 00:08:16','2015-02-24 00:08:16'),(37,10,2,'2015-02-24 00:08:16','2015-02-24 00:08:16'),(38,10,3,'2015-02-24 00:08:16','2015-02-24 00:08:16'),(39,10,4,'2015-02-24 00:08:16','2015-02-24 00:08:16'),(40,10,5,'2015-02-24 00:08:16','2015-02-24 00:08:16'),(41,10,10,'2015-02-24 00:08:16','2015-02-24 00:08:16'),(42,11,4,'2015-02-25 00:00:27','2015-02-25 00:00:27'),(43,12,2,'2015-03-18 22:47:32','2015-03-18 22:47:32'),(44,12,4,'2015-03-18 22:47:32','2015-03-18 22:47:32'),(45,12,7,'2015-03-18 22:47:32','2015-03-18 22:47:32');
/*!40000 ALTER TABLE `vassociations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cw` int(11) DEFAULT NULL,
  `poc_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poc_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revenue` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL,
  `exec` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'vendor1','vendor way','chicago',NULL,100,'2015-02-03 20:53:03','2015-02-04 22:26:29',NULL,NULL,NULL,'','',NULL,NULL,NULL),(2,'Vamanos Pest','1111 Crystal Way','Albequerque, NM',NULL,100,'2015-02-04 19:51:08','2015-02-04 22:26:21',NULL,NULL,NULL,'','',NULL,NULL,NULL),(3,'vendor020415','100 Which Way','Reston',NULL,NULL,'2015-02-04 22:31:04','2015-02-23 22:59:54',20170,'VA',NULL,'','',NULL,NULL,NULL),(4,'Darkness Inc.','888 Tomorodo Way','Virginia Beach',NULL,800,'2015-02-23 19:57:34','2015-02-23 19:57:34',23464,'Virginia',20,'David Gormp','4444444.0',9000000,NULL,NULL),(5,'Ballerco','678 Yolo Ave.','Sterling',NULL,90,'2015-02-23 19:57:35','2015-02-23 19:57:35',88888,'Virginia',50,'Fera Holp','5555555.0',700000,NULL,NULL),(6,'Sameer 1','888 Tomorodo Way','Virginia Beach',NULL,800,'2015-02-23 22:40:03','2015-02-23 22:40:03',23464,'Virginia',20,'David Gormp','4444444.0',9000000,NULL,NULL),(7,'Sameer 2','678 Yolo Ave.','Sterling',NULL,90,'2015-02-23 22:40:03','2015-02-23 22:40:03',88888,'Virginia',50,'Fera Holp','5555555.0',700000,NULL,NULL),(8,'testing02232015','111 Some St. ','Herndon ',NULL,10,'2015-02-23 22:55:36','2015-02-23 22:55:36',20170,'VA',NULL,NULL,NULL,111,NULL,NULL),(9,'testing022320152','111 some st','restong',NULL,NULL,'2015-02-23 22:56:26','2015-02-23 22:56:26',NULL,'va',NULL,NULL,NULL,NULL,NULL,NULL),(10,'testing vendor with correct functionality','100 st. ','herndon',NULL,100,'2015-02-24 00:08:16','2015-02-24 00:08:16',20170,'va',NULL,NULL,NULL,1000,NULL,NULL),(11,'Blue Cheese Vendor','','',NULL,NULL,'2015-02-25 00:00:27','2015-02-25 00:00:27',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),(12,'testing555','henrdon','herndon',NULL,NULL,'2015-03-18 22:47:32','2015-03-18 22:47:32',20170,'va',NULL,NULL,NULL,NULL,NULL,NULL),(13,'testing 03202015','','',NULL,NULL,'2015-03-20 21:44:57','2015-03-20 21:44:57',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),(14,'testedRSI03262015','111 Main St. ','Herndon',NULL,1111,'2015-03-27 03:18:51','2015-03-27 03:18:51',20170,'VA',11,NULL,NULL,19191,NULL,NULL);
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vtypes`
--

DROP TABLE IF EXISTS `vtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vtypes`
--

LOCK TABLES `vtypes` WRITE;
/*!40000 ALTER TABLE `vtypes` DISABLE KEYS */;
INSERT INTO `vtypes` VALUES (1,'Banking','2015-02-03 18:47:16','2015-02-03 18:47:16'),(2,'Financial','2015-02-03 18:47:16','2015-02-03 18:47:16'),(3,'Web Development','2015-02-03 18:47:16','2015-02-03 18:47:16'),(4,'Aeronautical','2015-02-03 18:47:16','2015-02-03 18:47:16'),(5,'smuggling','2015-02-23 19:01:34','2015-02-23 19:01:34'),(6,'knife-making','2015-02-23 19:01:35','2015-02-23 19:01:35'),(7,'yurt-mastery','2015-02-23 19:01:35','2015-02-23 19:01:35'),(8,'basketball','2015-02-23 19:57:34','2015-02-23 19:57:34'),(9,'wine coolers','2015-02-23 19:57:34','2015-02-23 19:57:34'),(10,'surrealism','2015-02-23 19:57:34','2015-02-23 19:57:34');
/*!40000 ALTER TABLE `vtypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-04 22:35:12
