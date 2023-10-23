-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: hidden_gems
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `Amenity`
--

CREATE SCHEMA IF NOT EXISTS hidden_gems;

USE hidden_gems;

DROP TABLE IF EXISTS `Amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Amenity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_type_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `accessible` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT (now()),
  `updated_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `amenity_type_id` (`amenity_type_id`),
  KEY `location_id` (`location_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `amenity_ibfk_1` FOREIGN KEY (`amenity_type_id`) REFERENCES `AmenityType` (`id`),
  CONSTRAINT `amenity_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `Location` (`id`),
  CONSTRAINT `amenity_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amenity`
--

LOCK TABLES `Amenity` WRITE;
/*!40000 ALTER TABLE `Amenity` DISABLE KEYS */;
INSERT INTO `Amenity` VALUES (1,1,2,1,NULL,'Tall Fountain',1,'2023-10-04 02:51:34','2023-10-04 02:51:34'),(2,2,2,1,NULL,'Bottle Fill Station',1,'2023-10-04 02:51:34','2023-10-04 02:51:34'),(3,3,2,1,NULL,'Woman\'s Restroom',1,'2023-10-04 02:51:34','2023-10-04 02:51:34'),(4,3,2,1,NULL,'Men\'s Restroom',1,'2023-10-04 02:51:34','2023-10-04 02:51:34'),(5,1,2,1,NULL,'Short Fountain',1,'2023-10-04 02:51:34','2023-10-04 02:51:34'),(6,1,9,1,NULL,'Short Fountain',1,'2023-10-04 02:53:47','2023-10-04 02:53:47'),(7,2,9,1,NULL,'Woman\'s Restroom',1,'2023-10-04 02:53:47','2023-10-04 02:53:47'),(8,1,8,1,NULL,'Bottle Fill Station',1,'2023-10-04 02:53:47','2023-10-04 02:53:47'),(9,3,10,1,NULL,'Men\'s Restroom',1,'2023-10-04 02:53:47','2023-10-04 02:53:47'),(10,3,11,1,NULL,'Tall Fountain',1,'2023-10-04 02:53:47','2023-10-04 02:53:47');
/*!40000 ALTER TABLE `Amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AmenityAttributeRecord`
--

DROP TABLE IF EXISTS `AmenityAttributeRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AmenityAttributeRecord` (
  `amenity_attribute_id` int DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `amenity_attribute_id` (`amenity_attribute_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `amenityattributerecord_ibfk_1` FOREIGN KEY (`amenity_attribute_id`) REFERENCES `AmenityTypeAttribute` (`id`),
  CONSTRAINT `amenityattributerecord_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `Review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AmenityAttributeRecord`
--

LOCK TABLES `AmenityAttributeRecord` WRITE;
/*!40000 ALTER TABLE `AmenityAttributeRecord` DISABLE KEYS */;
INSERT INTO `AmenityAttributeRecord` VALUES (5,10,'0'),(4,10,'2'),(8,10,'1'),(5,9,'0'),(4,9,'2'),(8,9,'1'),(5,3,'0'),(4,3,'3'),(8,3,'2'),(5,4,'1'),(4,4,'2'),(8,4,'2'),(3,10,'F'),(3,9,'M'),(3,3,'F'),(3,4,'M');
/*!40000 ALTER TABLE `AmenityAttributeRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AmenityType`
--

DROP TABLE IF EXISTS `AmenityType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AmenityType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_amenity_type_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AmenityType`
--

LOCK TABLES `AmenityType` WRITE;
/*!40000 ALTER TABLE `AmenityType` DISABLE KEYS */;
INSERT INTO `AmenityType` VALUES (1,NULL,'Water Fountain','water','Water Fountain'),(2,1,'Bottle Fill Station','bottle','Bottle'),(3,NULL,'Restroom','bathroom','Restroom'),(4,NULL,'Fire Pit','fire','Fire Pit'),(5,9,'Mural','art','Mural'),(6,NULL,'Picnic Table','table','Picnic'),(7,NULL,'Little Free Library','Little Free Library','Little Free Library'),(8,1,'Doggy Fountain','Doggy Fountain','Doggy Fountain'),(9,NULL,'Art','Art','Art'),(10,9,'Graffiti','spraycan','spraycan'),(11,9,'Statue','statue','Statue');
/*!40000 ALTER TABLE `AmenityType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AmenityTypeAttribute`
--

DROP TABLE IF EXISTS `AmenityTypeAttribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AmenityTypeAttribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_type_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `type` enum('rating','text','number','boolean') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `amenity_type_id` (`amenity_type_id`),
  CONSTRAINT `amenitytypeattribute_ibfk_1` FOREIGN KEY (`amenity_type_id`) REFERENCES `AmenityType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AmenityTypeAttribute`
--

LOCK TABLES `AmenityTypeAttribute` WRITE;
/*!40000 ALTER TABLE `AmenityTypeAttribute` DISABLE KEYS */;
INSERT INTO `AmenityTypeAttribute` VALUES (1,2,'Water Bottle Clearance (m)','bottle','number'),(2,1,'Fountain Height (m)','water','number'),(3,3,'Allowed Gender','person','text'),(4,3,'Number Of Stalls','icon','number'),(5,3,'Number Of Urinals','icon','number'),(6,3,'Has Handicapped Stall(s)','icon','boolean'),(7,6,'Seating (number of people)','chair','number'),(8,3,'Number Of Sinks','sink','number'),(9,3,'Baby Changing Table','baby','boolean'),(10,3,'Paper Towels Available','paper','boolean'),(11,3,'Hand Blower Available','wind','boolean');
/*!40000 ALTER TABLE `AmenityTypeAttribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AmenityTypeMetric`
--

DROP TABLE IF EXISTS `AmenityTypeMetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AmenityTypeMetric` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_type_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `type` enum('rating','text','number') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `amenity_type_id` (`amenity_type_id`),
  CONSTRAINT `amenitytypemetric_ibfk_1` FOREIGN KEY (`amenity_type_id`) REFERENCES `AmenityType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AmenityTypeMetric`
--

LOCK TABLES `AmenityTypeMetric` WRITE;
/*!40000 ALTER TABLE `AmenityTypeMetric` DISABLE KEYS */;
INSERT INTO `AmenityTypeMetric` VALUES (1,1,'Water Flow Rate','water','rating'),(2,1,'Water Quality','water','rating'),(3,3,'Toilet Paper Quality','tp','rating'),(4,3,'Toilet Flushing Power ','toilet','rating'),(5,4,'Wood near by','tree','rating'),(6,9,'Vibe','Vibe','rating'),(7,7,'Book Selection','books','rating'),(8,3,'Privacy','Privacy','rating'),(9,9,'Quality','icon','rating'),(10,6,'Cleanliness','icon','rating');
/*!40000 ALTER TABLE `AmenityTypeMetric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `parent_location_id` int DEFAULT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT '',
  `created_at` timestamp NULL DEFAULT (now()),
  `updated_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,1,NULL,37.33521652348346,-121.8810553444476,'San José State University','1 Washington Sq, San Jose, CA 95192','Founded in 1857, this university with an urban 154-acre campus is known for business & engineering.','2023-10-03 03:13:25','2023-10-03 03:13:25'),(2,1,1,37.333297310334686,-121.88271141014917,'Science Building',NULL,'','2023-10-04 02:30:48','2023-10-04 02:30:48'),(3,1,1,37.33694715721928,-121.88126281325853,'Engineering Building',NULL,'','2023-10-04 02:41:53','2023-10-04 02:41:53'),(4,1,1,37.33625084490056,-121.8813807619816,'Entrance Bathroom',NULL,'','2023-10-04 02:41:53','2023-10-04 02:41:53'),(5,1,7,37.33664940829045,-121.87990935120611,'Student Union Store Bathroom',NULL,'','2023-10-04 02:41:53','2023-10-04 02:41:53'),(6,1,7,37.336443093387956,-121.88031332570759,'Student Union Corner Bathroom',NULL,'','2023-10-04 02:41:53','2023-10-04 02:41:53'),(7,1,1,37.336626010297245,-121.88026718486601,'Student Union',NULL,'','2023-10-04 02:42:32','2023-10-04 02:42:32'),(8,1,1,37.33365647515337,-121.88187389812272,'MacQuarrie Hall',NULL,'','2023-10-04 02:43:28','2023-10-04 02:43:28'),(9,1,8,37.33348451797188,-121.88187837260075,'Ground Floor Fountain',NULL,'','2023-10-04 02:44:32','2023-10-04 02:44:32'),(10,1,8,37.3336083296317,-121.88183065393333,'Second Floor Women\'s Bathroom',NULL,'','2023-10-04 02:45:41','2023-10-04 02:45:41'),(11,1,8,37.33355859228604,-121.88193621279927,'Second Floor Women\'s Bathroom',NULL,'','2023-10-04 02:46:54','2023-10-04 02:46:54');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amenity_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT (now()),
  `updated_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `amenity_id` (`amenity_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`amenity_id`) REFERENCES `Amenity` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (1,1,3,NULL,'Review #1',0,'2023-10-04 02:57:34','2023-10-04 02:57:34'),(2,2,4,NULL,'Review #2',0,'2023-10-04 02:57:34','2023-10-04 02:57:34'),(3,3,5,NULL,'Review #3',0,'2023-10-04 02:57:34','2023-10-04 02:57:34'),(4,4,6,NULL,'Review #4',0,'2023-10-04 02:57:34','2023-10-04 02:57:34'),(5,5,7,NULL,'Review #5',0,'2023-10-04 02:57:34','2023-10-04 02:57:34'),(6,6,8,NULL,'Review #6',0,'2023-10-04 02:57:34','2023-10-04 02:57:34'),(7,7,9,NULL,'Review #7',0,'2023-10-04 02:57:35','2023-10-04 02:57:35'),(8,8,10,NULL,'Review #8',0,'2023-10-04 02:57:35','2023-10-04 02:57:35'),(9,9,11,NULL,'Review #9',0,'2023-10-04 02:57:35','2023-10-04 02:57:35'),(10,10,12,NULL,'Review #10',0,'2023-10-04 02:57:35','2023-10-04 02:57:35');
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewImage`
--

DROP TABLE IF EXISTS `ReviewImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewImage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int DEFAULT NULL,
  `description` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `reviewimage_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `Review` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewImage`
--

LOCK TABLES `ReviewImage` WRITE;
/*!40000 ALTER TABLE `ReviewImage` DISABLE KEYS */;
INSERT INTO `ReviewImage` VALUES (1,1,'','https://images.unsplash.com/photo-1683009427051-00a2fe827a2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80','2023-10-04 03:06:03'),(2,2,'','https://plus.unsplash.com/premium_photo-1695930295426-3cb6c23ec25d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3176&q=80','2023-10-04 03:06:03'),(3,3,'','https://images.unsplash.com/photo-1695808403966-ac780a4c2901?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2000&q=80','2023-10-04 03:06:03'),(4,4,'','https://images.unsplash.com/photo-1682687220945-922198770e60?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80','2023-10-04 03:06:03'),(5,5,'','https://images.unsplash.com/photo-1696177785428-b8c79ff04d75?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3174&q=80','2023-10-04 03:06:03'),(6,6,'','https://plus.unsplash.com/premium_photo-1696273225510-5ff59f0e5695?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3271&q=80','2023-10-04 03:06:03'),(7,7,'','https://images.unsplash.com/photo-1696263077754-055b110c5820?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3174&q=80','2023-10-04 03:06:03'),(8,8,'','https://images.unsplash.com/photo-1696257203570-59ddacde1952?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2668&q=80','2023-10-04 03:06:03'),(9,9,'','https://images.unsplash.com/photo-1696260425424-cd3a251e138b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3250&q=80','2023-10-04 03:06:03'),(10,10,'','https://images.unsplash.com/photo-1695960825939-8c67c73d7b46?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3174&q=80','2023-10-04 03:06:03');
/*!40000 ALTER TABLE `ReviewImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewMetricRecord`
--

DROP TABLE IF EXISTS `ReviewMetricRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewMetricRecord` (
  `amenity_metric_id` int NOT NULL,
  `review_id` int NOT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`amenity_metric_id`,`review_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `reviewmetricrecord_ibfk_1` FOREIGN KEY (`amenity_metric_id`) REFERENCES `AmenityTypeMetric` (`id`),
  CONSTRAINT `reviewmetricrecord_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `Review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewMetricRecord`
--

LOCK TABLES `ReviewMetricRecord` WRITE;
/*!40000 ALTER TABLE `ReviewMetricRecord` DISABLE KEYS */;
INSERT INTO `ReviewMetricRecord` VALUES (1,1,3),(1,2,5),(1,5,4),(1,6,3),(1,8,5),(1,10,5),(2,1,3),(2,2,3),(2,5,2),(2,6,3),(2,8,3),(2,10,1);
/*!40000 ALTER TABLE `ReviewMetricRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewVote`
--

DROP TABLE IF EXISTS `ReviewVote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewVote` (
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`review_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviewvote_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `Review` (`id`),
  CONSTRAINT `reviewvote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewVote`
--

LOCK TABLES `ReviewVote` WRITE;
/*!40000 ALTER TABLE `ReviewVote` DISABLE KEYS */;
INSERT INTO `ReviewVote` VALUES (1,3,1),(2,4,1),(3,5,1),(4,6,1),(5,7,-1),(6,8,-1),(7,9,1),(8,10,-1),(9,11,-1),(10,12,1);
/*!40000 ALTER TABLE `ReviewVote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Revision`
--

DROP TABLE IF EXISTS `Revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Revision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `reverted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `revision_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revision`
--

LOCK TABLES `Revision` WRITE;
/*!40000 ALTER TABLE `Revision` DISABLE KEYS */;
INSERT INTO `Revision` VALUES (1,3,0,'2023-10-04 03:08:49'),(2,4,0,'2023-10-04 03:08:49'),(3,5,0,'2023-10-04 03:08:49'),(4,6,0,'2023-10-04 03:08:49'),(5,7,0,'2023-10-04 03:08:49'),(6,8,0,'2023-10-04 03:08:49'),(7,9,0,'2023-10-04 03:08:49'),(8,10,0,'2023-10-04 03:08:49'),(9,11,0,'2023-10-04 03:08:49'),(10,12,0,'2023-10-04 03:08:49');
/*!40000 ALTER TABLE `Revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RevisionEdit`
--

DROP TABLE IF EXISTS `RevisionEdit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RevisionEdit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `revision_id` int DEFAULT NULL,
  `table` varchar(255) NOT NULL,
  `primary_key` varchar(255) NOT NULL,
  `column` varchar(255) NOT NULL,
  `previous_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `revision_id` (`revision_id`),
  CONSTRAINT `revisionedit_ibfk_1` FOREIGN KEY (`revision_id`) REFERENCES `Revision` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RevisionEdit`
--

LOCK TABLES `RevisionEdit` WRITE;
/*!40000 ALTER TABLE `RevisionEdit` DISABLE KEYS */;
INSERT INTO `RevisionEdit` VALUES (1,1,'Amenity','1','name','Fountain #1','Tall Fountain'),(2,2,'Amenity','2','name','Bottle Fill Station #1','Bottle Fill Station'),(3,3,'Amenity','3','name','Restroom #1','Woman\'s Restroom'),(4,4,'Amenity','4','name','Restroom #2','Men\'s Restroom'),(5,5,'Amenity','5','name','Fountain #2','Short Fountain'),(6,6,'Amenity','6','name','Fountain #1','Short Fountain'),(7,9,'Amenity','9','name','Restroom #1','Woman\'s Restroom'),(8,7,'Amenity','7','name','Bottle Fill Station #1','Bottle Fill Station'),(9,10,'Amenity','10','name','Restroom #2','Men\'s Restroom'),(10,8,'Amenity','8','name','Fountain #2','Tall Fountain');
/*!40000 ALTER TABLE `RevisionEdit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RevisionVote`
--

DROP TABLE IF EXISTS `RevisionVote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RevisionVote` (
  `revision_id` int NOT NULL,
  `user_id` int NOT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`revision_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `revisionvote_ibfk_1` FOREIGN KEY (`revision_id`) REFERENCES `Revision` (`id`),
  CONSTRAINT `revisionvote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RevisionVote`
--

LOCK TABLES `RevisionVote` WRITE;
/*!40000 ALTER TABLE `RevisionVote` DISABLE KEYS */;
INSERT INTO `RevisionVote` VALUES (1,3,1),(2,4,1),(3,5,1),(4,6,1),(5,7,1),(6,8,1),(7,9,-1),(8,10,-1),(9,11,-1),(10,12,-1);
/*!40000 ALTER TABLE `RevisionVote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `normalized_email` varchar(255) NOT NULL,
  `administrator` tinyint(1) DEFAULT '0',
  `moderator` tinyint(1) DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Admin','admin@testing.com','admin@testing.com',1,1,'notanadmin123','2023-10-03 02:33:00'),(2,'Moderator','moderator@testing.com','moderator@testing.com',0,1,'themoderator321','2023-10-03 02:33:00'),(3,'AdventureExplorer','adventure@example.com','adventure@example.com',0,0,'explorer123','2023-10-03 02:33:00'),(4,'MovieBuff','moviebuff@yahoo.com','moviebuff@yahoo.com',0,0,'cinemalover','2023-10-03 02:33:00'),(5,'GamerPro','gamerpro@example.com','gamerpro@example.com',0,0,'gamer1234','2023-10-03 02:33:00'),(6,'FoodieQueen','foodiequeen@gmail.com','foodiequeen@gmail.com',0,0,'deliciousfood','2023-10-03 02:33:00'),(7,'ArtisticSoul','artistic@example.com','artistic@example.com',0,0,'creativityrocks','2023-10-03 02:33:00'),(8,'FitnessFreak','fitnessfreak@yahoo.com','fitnessfreak@yahoo.com',0,0,'workout123','2023-10-03 02:33:00'),(9,'Bookworm','bookworm@example.com','bookworm@example.com',0,0,'readingislife','2023-10-03 02:33:00'),(10,'MusicLover','musiclover@gmail.com','musiclover@gmail.com',0,0,'musicbeats','2023-10-03 02:33:00'),(11,'MysterySeeker','mysteryseeker@example.com','mysteryseeker@example.com',0,0,'password123','2023-10-03 02:33:00'),(12,'TechGeek','techgeek@gmail.com','techgeek@gmail.com',0,0,'securepassword','2023-10-03 02:33:00');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-03 20:34:56
