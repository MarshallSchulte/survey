-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: panception_development
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `complexity_weight` int(11) DEFAULT NULL,
  `performance_review_number` int(11) DEFAULT NULL,
  `executive_sponsor` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `specialist_id` int(11) DEFAULT NULL,
  `survey_sent` tinyint(1) DEFAULT NULL,
  `template` tinyint(1) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_campaigns_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,1,'template_01172015','Draft',NULL,NULL,NULL,'2015-01-18 02:43:35','2015-01-18 02:43:35',NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,1,NULL),(2,1,'Fannie_oracle_011915','Draft',NULL,NULL,NULL,'2015-01-18 02:46:13','2015-01-18 02:46:13',NULL,NULL,NULL,NULL,NULL,1,2,3,0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_questions`
--

LOCK TABLES `campaigns_questions` WRITE;
/*!40000 ALTER TABLE `campaigns_questions` DISABLE KEYS */;
INSERT INTO `campaigns_questions` VALUES (1,1,1,'2015-01-18 02:43:35','2015-01-18 02:43:35'),(2,1,2,'2015-01-18 02:43:35','2015-01-18 02:43:35'),(3,1,3,'2015-01-18 02:43:35','2015-01-18 02:43:35'),(4,1,4,'2015-01-18 02:43:35','2015-01-18 02:43:35'),(5,1,5,'2015-01-18 02:43:35','2015-01-18 02:43:35'),(6,1,6,'2015-01-18 02:43:35','2015-01-18 02:43:35'),(7,2,7,'2015-01-18 02:46:13','2015-01-18 02:46:13'),(8,2,8,'2015-01-18 02:46:13','2015-01-18 02:46:13'),(9,2,9,'2015-01-18 02:46:13','2015-01-18 02:46:13'),(10,2,10,'2015-01-18 02:46:13','2015-01-18 02:46:13'),(11,2,11,'2015-01-18 02:46:13','2015-01-18 02:46:13'),(12,2,12,'2015-01-18 02:46:13','2015-01-18 02:46:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_reviewers`
--

LOCK TABLES `campaigns_reviewers` WRITE;
/*!40000 ALTER TABLE `campaigns_reviewers` DISABLE KEYS */;
INSERT INTO `campaigns_reviewers` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cassociations`
--

LOCK TABLES `cassociations` WRITE;
/*!40000 ALTER TABLE `cassociations` DISABLE KEYS */;
INSERT INTO `cassociations` VALUES (2,2,'2015-01-17 22:21:56','2015-01-17 22:21:56');
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
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctypes`
--

LOCK TABLES `ctypes` WRITE;
/*!40000 ALTER TABLE `ctypes` DISABLE KEYS */;
INSERT INTO `ctypes` VALUES (1,'Banking','2015-01-17 22:18:27','2015-01-17 22:18:27'),(2,'Financial','2015-01-17 22:18:27','2015-01-17 22:18:27'),(3,'Web Development','2015-01-17 22:18:27','2015-01-17 22:18:27'),(4,'Aeronautical','2015-01-17 22:18:27','2015-01-17 22:18:27');
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
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `poc_first_name` varchar(255) DEFAULT NULL,
  `poc_last_name` varchar(255) DEFAULT NULL,
  `poc_email` varchar(255) DEFAULT NULL,
  `poc_phone` varchar(255) DEFAULT NULL,
  `ctype` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Panception',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2015-01-17 22:18:26','2015-01-17 22:18:26',NULL),(2,'Fannie Mae','100 Herndon Parkway','Herndon','VA','First','Name','first.last@testingemail.com','7031002000',NULL,10000,'2015-01-17 22:21:56','2015-01-17 22:21:56',20170);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
  `kpi` varchar(255) DEFAULT NULL,
  `kpi_measurement` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `original_kpi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpis`
--

LOCK TABLES `kpis` WRITE;
/*!40000 ALTER TABLE `kpis` DISABLE KEYS */;
INSERT INTO `kpis` VALUES (1,2,'Application Defects ','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-01-18 02:08:24','2015-01-18 02:08:24',NULL),(2,2,'Software Functionality','Did the supplier\'s software perform to the specifications/expectations?','2015-01-18 02:09:16','2015-01-18 02:09:16',NULL),(3,2,'Quality Assurance','Did the supplier define, communicate and deliver a robust software quality assurance process?','2015-01-18 02:10:45','2015-01-18 02:10:45',NULL),(4,2,'Technical Expertise','Did the supplier display leading-edge technical expertise and a robust understanding of their solution offerings?','2015-01-18 02:11:33','2015-01-18 02:11:33',NULL),(5,2,'Quality of Product','Did the quality of product meet requirements?','2015-01-18 02:12:38','2015-01-18 02:12:38',NULL),(6,2,'Warranty / Defects','Did the supplier effectively respond to and resolve warranty/defect claims?','2015-01-18 02:13:38','2015-01-18 02:13:38',NULL),(7,1,'Mean Time to Respond ','Was the timeliness of the supplier\'s responses to issues and concerns with software, including trouble tickets reasonable?','2015-01-18 02:14:22','2015-01-18 02:14:22',NULL),(8,1,'Mean Time to Resolve','Was the timeliness of the supplier\'s resolution of issues, concerns or trouble tickets reasonable?','2015-01-18 02:15:05','2015-01-18 02:15:05',NULL),(9,1,'Joint Problem Resolution','Was the supplier willing and able to collaborate with other suppliers to solve problems?','2015-01-18 02:15:56','2015-01-18 02:15:56',NULL),(10,1,'Strategic Planning ','How proactive is the supplier with strategy planning and product roadmaps linked to your future goals and initiatives?','2015-01-18 02:16:46','2015-01-18 02:16:46',NULL),(11,1,'Technical Communication & Documentation','Did the supplier deliver the software releases, upgrades, patches, and supporting documentation in a timely and proactive manner?\r\n','2015-01-18 02:17:50','2015-01-18 02:17:50',NULL),(12,1,'Order Accuracy and Timelines','Were hardware orders delivered on-time and accurately?\r\n','2015-01-18 02:18:33','2015-01-18 02:18:33',NULL),(13,3,'Flexibility','Was the supplier able to adapt to changes in requirements seamlessly without significant delays?\r\n','2015-01-18 02:19:21','2015-01-18 02:19:21',NULL),(14,3,'Ease of Negotiations ','Did the supplier collaboratively approach during negotiations?\r\n','2015-01-18 02:19:59','2015-01-18 02:19:59',NULL),(15,3,'Account Management','Did the supplier account team establish a productive and healthy working business relationship?\r\n','2015-01-18 02:20:43','2015-01-18 02:20:43',NULL),(16,3,'Identification of Savings Opportunities ','Did the supplier add value by proactively identifying savings opportunities?\r\n','2015-01-18 02:21:44','2015-01-18 02:21:44',NULL),(17,3,'Ease of Reporting','Did the reports provided by the supplier contain clear, concise, and actionable information?\r\n','2015-01-18 02:22:27','2015-01-18 02:22:27',NULL),(18,3,'Understanding of MedImmune\'s Business','Degree to which supplier understands and can accurately communicate the nature of our business and industry\r\n','2015-01-18 02:23:10','2015-01-18 02:23:10',NULL),(19,3,'Continuous Improvement','Did the supplier proactively follow up on action items, including those from business review meetings?\r\n','2015-01-18 02:24:07','2015-01-18 02:24:07',NULL),(20,3,'Order Modifications','Was the supplier able to accommodate hardware order changes without significant delays or price impact?','2015-01-18 02:24:54','2015-01-18 02:24:54',NULL),(21,4,'Price Competitiveness','Were the supplier\'s prices competitive with others\' in the market?\r\n','2015-01-18 02:25:31','2015-01-18 02:25:31',NULL),(22,4,'Initial Cost Savings Rate','What percentage of savings did the supplier provide over the last 12 months?','2015-01-18 02:26:42','2015-01-18 02:26:42',NULL),(23,4,'Value Add Services','Was the supplier willing to provide extra features/services at no additional charge?\r\n','2015-01-18 02:27:30','2015-01-18 02:27:30',NULL),(24,4,'Continual Cost Improvement Rate','What percentage of total savings were achieved for the last 12 months relative to the contract value?\r\n','2015-01-18 02:28:07','2015-01-18 02:28:07',NULL),(25,4,'Invoice Accuracy ','Did the supplier provide accurate and error-free invoices?\r\n','2015-01-18 02:28:39','2015-01-18 02:28:39',NULL),(26,4,'Invoice Timeliness ','Did the supplier provide invoices in a timely manner?\r\n','2015-01-18 02:29:10','2015-01-18 02:29:10',NULL),(27,5,'Contract Terms and Conditions ','Did the supplier comply with contract terms and conditions?\r\n','2015-01-18 02:29:54','2015-01-18 02:29:54',NULL),(28,5,'Business Continuity and Disaster Recovery','Were the supplier\'s documentation and testing of disaster recovery plans proactively communicated to MedImmune?\r\n','2015-01-18 02:30:28','2015-01-18 02:30:28',NULL),(29,5,'Adherence to Workplace Policies (only if we have resources on site)','Did the supplier’s resources comply with MedImmune’s Code of Conduct policy? \r\n','2015-01-18 02:31:05','2015-01-18 02:31:05',NULL),(30,5,'Corporate Information Security and Privacy Standards (Resources)','Did the supplier\'s resources comply with the corporate information security and privacy standards?\r\n','2015-01-18 02:31:56','2015-01-18 02:31:56',NULL),(31,5,'Corporate Information Security and Privacy Standards (Supplier Personnel)','Did the supplier personnel comply with the corporate information security and privacy standards?\r\n','2015-01-18 02:32:44','2015-01-18 02:32:44',NULL),(32,6,'Corporate Information Security and Privacy Standards ','Degree to which supplier complies with MedImmune information security and privacy requirements, including confidentiality (move to HA)','2015-01-18 02:33:31','2015-01-18 02:33:31',NULL),(33,6,'Financial','Supplier is financially stable (move to HA)','2015-01-18 02:34:13','2015-01-18 02:34:13',NULL),(34,2,'Application Defects ','Were supplier\'s products and/or services reasonably free from incidents/defects/bugs?','2015-01-18 02:46:13','2015-01-18 02:46:13',1),(35,2,'Software Functionality','Did the supplier\'s software perform to the specifications/expectations?','2015-01-18 02:46:13','2015-01-18 02:46:13',2),(36,2,'Quality Assurance','Did the supplier define, communicate and deliver a robust software quality assurance process?','2015-01-18 02:46:13','2015-01-18 02:46:13',3),(37,2,'Technical Expertise','Did the supplier display leading-edge technical expertise and a robust understanding of their solution offerings?','2015-01-18 02:46:13','2015-01-18 02:46:13',4),(38,2,'Quality of Product','Did the quality of product meet requirements?','2015-01-18 02:46:13','2015-01-18 02:46:13',5),(39,2,'Warranty / Defects','Did the supplier effectively respond to and resolve warranty/defect claims?','2015-01-18 02:46:13','2015-01-18 02:46:13',6);
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
  `metric_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES (1,'Delivery and Support','2015-01-17 23:02:44','2015-01-18 02:02:32',33),(2,'Quality','2015-01-17 23:04:00','2015-01-17 23:04:00',20),(3,'Relationship Management','2015-01-17 23:04:22','2015-01-18 02:03:34',25),(4,'Cost/Value','2015-01-18 02:04:46','2015-01-18 02:04:46',25),(5,'Compliance','2015-01-18 02:05:32','2015-01-18 02:05:32',0),(6,'Risk','2015-01-18 02:06:32','2015-01-18 02:06:32',0);
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
  `opt1` varchar(255) DEFAULT NULL,
  `opt2` varchar(255) DEFAULT NULL,
  `opt3` varchar(255) DEFAULT NULL,
  `opt4` varchar(255) DEFAULT NULL,
  `opt5` varchar(255) DEFAULT NULL,
  `opt6` varchar(255) DEFAULT NULL,
  `opt7` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,2,1,'2015-01-18 02:43:35','2015-01-18 02:43:35',1,1,1,1,1,1,20,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innivator'),(2,2,2,'2015-01-18 02:43:35','2015-01-18 02:43:35',1,1,1,1,1,1,10,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innivator'),(3,2,3,'2015-01-18 02:43:35','2015-01-18 02:43:35',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,4,'2015-01-18 02:43:35','2015-01-18 02:43:35',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,5,'2015-01-18 02:43:35','2015-01-18 02:43:35',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,6,'2015-01-18 02:43:35','2015-01-18 02:43:35',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,34,'2015-01-18 02:46:13','2015-01-18 02:46:13',1,1,1,1,1,1,20,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innivator'),(8,2,35,'2015-01-18 02:46:13','2015-01-18 02:46:13',1,1,1,1,1,1,10,'Failing','Attention Required','Lagging','Moderate','Excelling','Leader','Innivator'),(9,2,36,'2015-01-18 02:46:13','2015-01-18 02:46:13',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,2,37,'2015-01-18 02:46:13','2015-01-18 02:46:13',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,2,38,'2015-01-18 02:46:13','2015-01-18 02:46:13',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,2,39,'2015-01-18 02:46:13','2015-01-18 02:46:13',1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
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
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_types`
--

LOCK TABLES `reviewer_types` WRITE;
/*!40000 ALTER TABLE `reviewer_types` DISABLE KEYS */;
INSERT INTO `reviewer_types` VALUES (1,'Supplier','2015-01-17 22:18:27','2015-01-17 22:18:27'),(2,'Business Unit','2015-01-17 22:18:27','2015-01-17 22:18:27'),(3,'Strategic Sourcing','2015-01-17 22:18:27','2015-01-17 22:18:27'),(4,'Supplier Diversity','2015-01-17 22:18:27','2015-01-17 22:18:27'),(5,'Governance','2015-01-17 22:18:27','2015-01-17 22:18:27'),(6,'SRM','2015-01-17 22:18:27','2015-01-17 22:18:27');
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
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `survey_sent` tinyint(1) DEFAULT NULL,
  `reviewer_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers`
--

LOCK TABLES `reviewers` WRITE;
/*!40000 ALTER TABLE `reviewers` DISABLE KEYS */;
INSERT INTO `reviewers` VALUES (1,'first01','last01','ssharma@worldgatellc.com','2015-01-18 04:03:45','2015-01-18 04:38:27',NULL,1),(2,'first02','last02','test@testreviewer.com','2015-01-18 04:03:45','2015-01-18 04:38:27',NULL,1),(3,'first03','last03','first03@last03.com','2015-01-18 04:38:27','2015-01-18 04:38:27',NULL,1),(4,'first04','last04','first04.last04@testreviewer.com','2015-01-18 04:39:39','2015-01-18 04:39:39',NULL,2);
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
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','2015-01-17 22:18:26','2015-01-17 22:18:26'),(2,'Campaign Manager','2015-01-17 22:18:26','2015-01-17 22:18:26'),(3,'Specialist','2015-01-17 22:18:26','2015-01-17 22:18:26');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141217205847'),('20141217210832'),('20141218133404'),('20141218133427'),('20141218133608'),('20141218134521'),('20141218135103'),('20141218135132'),('20141218221745'),('20141218230928'),('20141218231127'),('20141219212931'),('20141219212957'),('20141219221812'),('20141219221818'),('20141222151409'),('20141222154325'),('20141222212209'),('20141223031759'),('20141223032104'),('20141223032240'),('20141223163545'),('20141223165252'),('20141223180559'),('20141223181152'),('20141223181607'),('20141223182737'),('20141223200039'),('20141224172037'),('20141229145204'),('20141229145219'),('20141229145328'),('20141229161223'),('20150107071725'),('20150107183430'),('20150107183546'),('20150107183632'),('20150107183702'),('20150107183740'),('20150107183808'),('20150107184304'),('20150107185319'),('20150108175937'),('20150108180033'),('20150108190410'),('20150113014120'),('20150113023019'),('20150113071543'),('20150113071854'),('20150113223424'),('20150114123245'),('20150115200933'),('20150115212410'),('20150115220733'),('20150116193446'),('20150116194519');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `participant_type` varchar(255) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `winner` tinyint(1) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `text` varchar(255) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `text` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `attempts_number` int(11) DEFAULT '0',
  `finished` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `first` varchar(255) DEFAULT NULL,
  `last` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `invited` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
INSERT INTO `user_invites` VALUES (1,'Swati','Sharma','swati@resourcestack.com',NULL,'2015-01-17 22:21:56','2015-01-17 22:21:56',2,2),(2,'sam','shar','sash_us2000@yahoo.com',NULL,'2015-01-17 22:46:52','2015-01-17 22:46:52',2,3),(3,'someone','else','sameerrsi@gmail.com',NULL,'2015-01-17 22:46:52','2015-01-17 22:46:52',2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1,'2015-01-17 22:20:08','2015-01-17 22:20:08'),(2,2,2,'2015-01-17 22:22:03','2015-01-17 22:22:03'),(3,NULL,NULL,'2015-01-17 22:46:52','2015-01-17 22:46:52'),(4,3,3,'2015-01-17 22:46:55','2015-01-17 22:46:55'),(5,4,3,'2015-01-17 22:46:57','2015-01-17 22:46:57');
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
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `invitation_token` varchar(255) DEFAULT NULL,
  `invitation_created_at` datetime DEFAULT NULL,
  `invitation_sent_at` datetime DEFAULT NULL,
  `invitation_accepted_at` datetime DEFAULT NULL,
  `invitation_limit` int(11) DEFAULT NULL,
  `invited_by_id` int(11) DEFAULT NULL,
  `invited_by_type` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `senior_specialist` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_invitation_token` (`invitation_token`),
  KEY `index_users_on_invited_by_id` (`invited_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sameer.sharma@resourcestack.com','$2a$10$DPPknB88669sH318XL3lkuy8it3n3JvaESamee3gbhgqBIhD22Ke2',NULL,NULL,NULL,2,'2015-01-17 22:56:04','2015-01-17 22:20:08','192.168.56.1','192.168.56.1','2015-01-17 22:20:07','2015-01-17 22:56:04','Sameer','Sharma',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'swati@resourcestack.com','$2a$10$M7wsk1ANRxBfrfwQWXYKpebyKIuBX3RUuo4DpmTCGqz7SC0YiCLLO',NULL,NULL,NULL,3,'2015-01-18 04:30:23','2015-01-18 02:45:11','192.168.56.1','192.168.56.1','2015-01-17 22:21:56','2015-01-18 04:30:23','Swati','Sharma',NULL,NULL,'2015-01-17 22:21:56','2015-01-17 22:21:56','2015-01-17 22:25:19',NULL,NULL,NULL,2,NULL),(3,'sash_us2000@yahoo.com','$2a$10$./raA8Fyt9tKfrQ4clFLd.GZVbLaJzHbI44MU4TbKd75QdwW65euS',NULL,NULL,NULL,3,'2015-01-18 04:37:43','2015-01-18 02:48:10','192.168.56.1','192.168.56.1','2015-01-17 22:46:52','2015-01-18 04:37:43','sam','shar',NULL,NULL,'2015-01-17 22:46:52','2015-01-17 22:46:52','2015-01-17 22:55:38',NULL,NULL,NULL,2,NULL),(4,'sameerrsi@gmail.com','$2a$10$T07nlnH8n0ERxOGwU3XjH.ft6ZfcXMsNbbWI0o018k0bUgHlDTuUe',NULL,NULL,NULL,2,'2015-01-18 02:47:19','2015-01-17 22:54:20','192.168.56.1','192.168.56.1','2015-01-17 22:46:55','2015-01-18 02:47:19','someone','else',NULL,NULL,'2015-01-17 22:46:55','2015-01-17 22:46:55','2015-01-17 22:54:20',NULL,NULL,NULL,2,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vassociations`
--

LOCK TABLES `vassociations` WRITE;
/*!40000 ALTER TABLE `vassociations` DISABLE KEYS */;
INSERT INTO `vassociations` VALUES (1,1,2,'2015-01-17 22:26:24','2015-01-17 22:26:24'),(2,1,3,'2015-01-17 22:26:24','2015-01-17 22:26:24'),(3,2,2,'2015-01-18 02:35:21','2015-01-18 02:35:21'),(4,2,3,'2015-01-18 02:35:21','2015-01-18 02:35:21'),(5,2,4,'2015-01-18 02:35:21','2015-01-18 02:35:21'),(6,3,3,'2015-01-18 02:35:49','2015-01-18 02:35:49');
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
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `vtype` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `cw` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Oracle Professional Services','100 Sunset Hills dr','Reston',NULL,10000,'2015-01-17 22:26:24','2015-01-17 22:26:24',20190,'VA',NULL),(2,'IBM Professional Services','100 Main St. ','New York',NULL,10000,'2015-01-18 02:35:21','2015-01-18 02:35:21',2334,'NY',NULL),(3,'Resource Stack Inc.','626 Grant St. #D','Herndon',NULL,8,'2015-01-18 02:35:49','2015-01-18 02:35:49',20170,'Virginia',NULL);
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
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vtypes`
--

LOCK TABLES `vtypes` WRITE;
/*!40000 ALTER TABLE `vtypes` DISABLE KEYS */;
INSERT INTO `vtypes` VALUES (1,'Banking','2015-01-17 22:18:27','2015-01-17 22:18:27'),(2,'Financial','2015-01-17 22:18:27','2015-01-17 22:18:27'),(3,'Web Development','2015-01-17 22:18:27','2015-01-17 22:18:27'),(4,'Aeronautical','2015-01-17 22:18:27','2015-01-17 22:18:27');
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

-- Dump completed on 2015-01-18 20:15:15
