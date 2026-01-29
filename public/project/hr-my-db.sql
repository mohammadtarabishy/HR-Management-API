CREATE DATABASE  IF NOT EXISTS `hrmanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hrmanagement`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hrmanagement
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('hrsystem_cache_a75f3f172bfb296f2e10cbfc6dfc1883','i:1;',1769647636),('hrsystem_cache_a75f3f172bfb296f2e10cbfc6dfc1883:timer','i:1769647636;',1769647636),('hrsystem_cache_e45444ecc678a271a6330f468a373360','i:2;',1769647013),('hrsystem_cache_e45444ecc678a271a6330f468a373360:timer','i:1769647013;',1769647013),('hrsystem_cache_f1f70ec40aaa556905d4a030501c0ba4','i:3;',1769647936),('hrsystem_cache_f1f70ec40aaa556905d4a030501c0ba4:timer','i:1769647936;',1769647936);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_logs`
--

DROP TABLE IF EXISTS `employee_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_data` json DEFAULT NULL,
  `new_data` json DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_logs_employee_id_foreign` (`employee_id`),
  KEY `employee_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `employee_logs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_logs`
--

LOCK TABLES `employee_logs` WRITE;
/*!40000 ALTER TABLE `employee_logs` DISABLE KEYS */;
INSERT INTO `employee_logs` VALUES (1,1,'created','[]','{\"id\": 1, \"name\": \"Mohammad\", \"email\": \"mohammad@test.com\", \"salary\": 5000, \"created_at\": \"2026-01-29T00:38:47.000000Z\", \"updated_at\": \"2026-01-29T00:38:47.000000Z\", \"position_id\": \"1\"}',1,'2026-01-29 08:38:47','2026-01-29 08:38:47'),(2,2,'created','[]','{\"id\": 2, \"name\": \"Mohammad 2\", \"email\": \"mohammad2@test.com\", \"salary\": 5000, \"created_at\": \"2026-01-29T00:39:18.000000Z\", \"manager_id\": 1, \"updated_at\": \"2026-01-29T00:39:18.000000Z\", \"position_id\": \"1\"}',1,'2026-01-29 08:39:18','2026-01-29 08:39:18'),(3,3,'created','[]','{\"id\": 3, \"name\": \"Mohammad 3\", \"email\": \"mohammad3@test.com\", \"salary\": 5000, \"created_at\": \"2026-01-29T00:39:27.000000Z\", \"manager_id\": 2, \"updated_at\": \"2026-01-29T00:39:27.000000Z\", \"position_id\": \"1\"}',1,'2026-01-29 08:39:27','2026-01-29 08:39:27'),(4,4,'created','[]','{\"id\": 4, \"name\": \"Mohammad 4\", \"email\": \"mohammad4@test.com\", \"salary\": 5000, \"created_at\": \"2026-01-29T00:39:38.000000Z\", \"manager_id\": 3, \"updated_at\": \"2026-01-29T00:39:38.000000Z\", \"position_id\": \"4\"}',1,'2026-01-29 08:39:38','2026-01-29 08:39:38'),(5,1,'updated','{\"id\": 1, \"name\": \"Mohammad\", \"email\": \"mohammad@test.com\", \"salary\": \"5000.00\", \"created_at\": \"2026-01-29T00:38:47.000000Z\", \"manager_id\": null, \"updated_at\": \"2026-01-29T00:38:47.000000Z\", \"position_id\": 1, \"last_salary_change_at\": null}','{\"id\": 1, \"name\": \"Mohammad\", \"email\": \"mohammad@test.com\", \"salary\": 2444, \"created_at\": \"2026-01-29T00:38:47.000000Z\", \"manager_id\": null, \"updated_at\": \"2026-01-29T00:44:41.000000Z\", \"position_id\": 1, \"last_salary_change_at\": \"2026-01-29T00:44:41.116996Z\"}',1,'2026-01-29 08:44:41','2026-01-29 08:44:41'),(6,1,'updated','{\"id\": 1, \"name\": \"Mohammad\", \"email\": \"mohammad@test.com\", \"salary\": \"2444.00\", \"manager\": null, \"created_at\": \"2026-01-29T00:38:47.000000Z\", \"manager_id\": null, \"updated_at\": \"2026-01-29T00:44:41.000000Z\", \"position_id\": 1, \"last_salary_change_at\": \"2026-01-29 00:44:41\"}','{\"id\": 1, \"name\": \"Mohammad Khair\", \"email\": \"mohammad2@wwqwq.com\", \"salary\": 2000, \"manager\": null, \"created_at\": \"2026-01-29T00:38:47.000000Z\", \"manager_id\": null, \"updated_at\": \"2026-01-29T00:51:38.000000Z\", \"position_id\": 1, \"last_salary_change_at\": \"2026-01-29T00:51:38.284578Z\"}',1,'2026-01-29 08:51:38','2026-01-29 08:51:38');
/*!40000 ALTER TABLE `employee_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `last_salary_change_at` timestamp NULL DEFAULT NULL,
  `position_id` bigint unsigned NOT NULL,
  `manager_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_position_id_foreign` (`position_id`),
  KEY `employees_manager_id_foreign` (`manager_id`),
  KEY `employees_salary_index` (`salary`),
  FULLTEXT KEY `employees_name_fulltext` (`name`),
  CONSTRAINT `employees_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Mohammad Khair','mohammad2@wwqwq.com',2000.00,'2026-01-29 08:51:38',1,NULL,'2026-01-29 08:38:47','2026-01-29 08:51:38'),(2,'Mohammad 2','mohammad2@test.com',5000.00,NULL,1,1,'2026-01-29 08:39:18','2026-01-29 08:39:18'),(3,'Mohammad 3','mohammad3@test.com',5000.00,NULL,1,2,'2026-01-29 08:39:27','2026-01-29 08:39:27'),(4,'Mohammad 4','mohammad4@test.com',5000.00,NULL,4,3,'2026-01-29 08:39:38','2026-01-29 08:39:38'),(5,'Employee KMZx6t','3DdfZ4nx@example.com',4606.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(6,'Employee nRqIoF','B7XNYxlp@example.com',4255.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(7,'Employee RbeNyp','ffCblIz8@example.com',4638.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(8,'Employee bculxQ','GKej6pAE@example.com',2072.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(9,'Employee 0xQgjE','2jbnlbqr@example.com',830.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(10,'Employee N22PPK','28g7oCLq@example.com',2393.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(11,'Employee nlkbNW','sbmt5TIg@example.com',1264.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(12,'Employee YGatFO','NreC9CVe@example.com',4801.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(13,'Employee eYFfFg','XJZLTSpq@example.com',3242.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(14,'Employee LUW11c','BZh89WzZ@example.com',4901.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(15,'Employee CROXn4','C6xObwpJ@example.com',2729.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(16,'Employee FQQ5pr','k6KaEboc@example.com',1102.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(17,'Employee VQZ9T8','k8ZDTwHl@example.com',2881.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(18,'Employee z88a2v','YGmdD1Ei@example.com',586.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(19,'Employee Em3geh','Fazpl4Rd@example.com',2045.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(20,'Employee trXgra','1VoL0wEC@example.com',3102.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(21,'Employee vf88CH','M04cfKwC@example.com',1458.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(22,'Employee I1PHu0','BdDIJ0lN@example.com',790.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(23,'Employee JkFFs7','UJvt4YwK@example.com',1699.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(24,'Employee JRnYRV','s6ZSW1pM@example.com',1567.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(25,'Employee DVJYZX','OXUIxVOx@example.com',1941.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(26,'Employee I79q6q','KZ2KscXi@example.com',1505.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(27,'Employee cZFrNX','KdIozKig@example.com',1097.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(28,'Employee Q9Ruqt','CYQxfOHt@example.com',1272.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(29,'Employee XMhx5C','7RwF19xO@example.com',523.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(30,'Employee zyRMeR','0NlOxg54@example.com',4754.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(31,'Employee cu79QV','E2OejHTQ@example.com',4820.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(32,'Employee HktXPu','XR1aCKiT@example.com',4181.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(33,'Employee onBRVp','dSNyZ1qs@example.com',768.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(34,'Employee v7NmBf','6BOVhAfD@example.com',4839.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(35,'Employee NE2tkp','rcsPvDW3@example.com',4413.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(36,'Employee OPWdXk','kLXIoecn@example.com',2533.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(37,'Employee LRvW8E','uiiFxRH1@example.com',1393.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(38,'Employee fYN9xF','uyXqRbSr@example.com',4170.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(39,'Employee 6Msudl','qwzKuER7@example.com',3831.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(40,'Employee yL98r9','Qpuzla70@example.com',3922.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(41,'Employee Thtsnh','8zeoRNrt@example.com',3386.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(42,'Employee 0jOzOx','9k4lANbe@example.com',627.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(43,'Employee DlqpNa','SiRVFeo3@example.com',1076.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(44,'Employee MKoSe5','R8b4IwDl@example.com',4341.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(45,'Employee tdGpHO','vtycPmF9@example.com',1682.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(46,'Employee YN5x9Z','h5R0eXqr@example.com',1166.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(47,'Employee nI7Fd6','KnZjJ6l5@example.com',3111.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(48,'Employee GyYKk9','5j4AIDX7@example.com',2149.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(49,'Employee sQi0Gv','eGzBNB39@example.com',1976.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(50,'Employee YLbWFG','ND4IkIYh@example.com',3382.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(51,'Employee crDtDF','oYrMOzB7@example.com',746.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(52,'Employee gj6ZP5','EGsw5m0X@example.com',4918.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(53,'Employee 6ZCWlf','9olZ7EHV@example.com',1267.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(54,'Employee ibsOeV','FqiLQz0q@example.com',1495.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(55,'Employee nYGwzg','4i3MJ9NA@example.com',3946.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(56,'Employee Kiegej','LKYqGgLY@example.com',2555.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(57,'Employee PG47RM','ZryXh4oY@example.com',2521.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(58,'Employee 3q9ihK','PtVu54YP@example.com',1391.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(59,'Employee P3B1VD','DRdTqusV@example.com',4225.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(60,'Employee 9XPXBa','YwgZtTo2@example.com',2012.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(61,'Employee Bpq6hj','ffd0qgpY@example.com',4833.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(62,'Employee rBjTVP','Js6PSirt@example.com',2313.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(63,'Employee IsymuI','SCUnO7f9@example.com',4238.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(64,'Employee 9t71kL','TrvwAv8q@example.com',2585.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(65,'Employee nWC1Dr','9XtPv9ei@example.com',2935.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(66,'Employee gK2vxh','NS0byDzO@example.com',3724.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(67,'Employee DiEBvo','j5iRKiNd@example.com',3137.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(68,'Employee 7CHVQm','oOG3ylQE@example.com',898.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(69,'Employee K5TTzd','9JsgxSMm@example.com',1834.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(70,'Employee mzAnCd','dfXsdJbp@example.com',3252.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(71,'Employee XRW1dY','xaPeHyUW@example.com',2042.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(72,'Employee 2QTaI1','0eSoeFXx@example.com',2549.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(73,'Employee HPshoq','T0MEOINc@example.com',4070.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(74,'Employee QsoyXD','d1ERMI3c@example.com',711.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(75,'Employee FDlDEZ','zIVvkdfr@example.com',3170.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(76,'Employee NsBcW7','gIcgLPpr@example.com',4413.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(77,'Employee lcQlCp','nvNkfXld@example.com',1475.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(78,'Employee BIAUPq','BXfbT3sd@example.com',2436.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(79,'Employee AWn1hr','AJylL5Y6@example.com',4966.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(80,'Employee 7OL6Se','IDObCZaR@example.com',1056.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(81,'Employee I6h10B','JOQUjLPB@example.com',1246.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(82,'Employee vHvOdx','LRuhPVSm@example.com',4064.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(83,'Employee sxwCZC','vyZW4l9s@example.com',672.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(84,'Employee Twiv4B','D6tTg0Fx@example.com',3083.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(85,'Employee u4Wajt','xhx3V17x@example.com',1032.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(86,'Employee aTKqbm','VKpvluqg@example.com',1697.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(87,'Employee WgdBe0','WS89wzWu@example.com',2213.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(88,'Employee PzH7QB','f3EWiqnk@example.com',4238.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(89,'Employee bKqBEr','hRJD1fdP@example.com',1707.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(90,'Employee ePg2e7','ykeLXpbj@example.com',3662.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(91,'Employee evfrSK','NHumPbj1@example.com',3747.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(92,'Employee TYVCPq','PpEkfPDP@example.com',735.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(93,'Employee rP26pG','WTPPvjZW@example.com',4805.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(94,'Employee QoydFA','E7a19hCi@example.com',2843.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(95,'Employee tI9wql','oznYuMre@example.com',4370.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(96,'Employee H8BwUo','WCQOOEG2@example.com',3626.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(97,'Employee BPuMNR','mWppCWHP@example.com',1814.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(98,'Employee ZQn4Vd','QUz1FAdD@example.com',3442.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(99,'Employee kDL607','m2A32wTw@example.com',1334.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(100,'Employee Nf74j0','NOgYTNuY@example.com',3135.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(101,'Employee rI3onY','sgHILb1U@example.com',2164.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(102,'Employee Gdy7Nu','M0tX4iu6@example.com',4908.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(103,'Employee J0KUYj','nN3C7CFz@example.com',1593.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(104,'Employee aYXfkx','vb8EVC2e@example.com',2674.00,NULL,1,1,'2026-01-29 08:52:52','2026-01-29 08:52:52'),(105,'Employee CIUela','XLzYCcK1@example.com',1951.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(106,'Employee IVN7X4','eCtoThQZ@example.com',2222.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(107,'Employee 0xEBQK','EtvXIkKC@example.com',2843.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(108,'Employee TUDQa1','4MydfZHV@example.com',2742.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(109,'Employee MActXk','0s9TBg48@example.com',750.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(110,'Employee oOaLW3','bSOVw54p@example.com',1281.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(111,'Employee yv3KQW','qq4wnw7l@example.com',4049.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(112,'Employee pLe8Vj','rWCnxA9n@example.com',550.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(113,'Employee PmZUUV','hWPU5Kic@example.com',3907.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(114,'Employee KPDCdS','DNCvioyV@example.com',3703.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(115,'Employee bOU3IY','FSrv1FuG@example.com',2131.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(116,'Employee PKYwcy','Kshi4FWE@example.com',2374.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(117,'Employee mwAc6z','V8yfNueT@example.com',1063.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(118,'Employee vER4Hh','NFJWfbTR@example.com',2286.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(119,'Employee 9OlIIG','RPpYO1zr@example.com',1872.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(120,'Employee nQYmjJ','LoU3iLjN@example.com',3563.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(121,'Employee POwBAh','eb7NGqMl@example.com',1211.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(122,'Employee kX1WSy','BbqwGc6G@example.com',1197.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(123,'Employee giGOYn','gsiNGezF@example.com',780.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(124,'Employee 7jIJJq','YmpgjPtK@example.com',1749.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(125,'Employee d0m7Nu','t8KU9IeA@example.com',4183.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(126,'Employee dIo9f3','ZWQU1bs7@example.com',3227.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(127,'Employee YK06DW','WWi6QSyI@example.com',3778.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(128,'Employee Pj8TjV','RAZUjoli@example.com',4848.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(129,'Employee KYrTUs','WiUsrDvp@example.com',3537.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(130,'Employee HKjmry','4Mirox4o@example.com',2925.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(131,'Employee naNYHC','l5F9sUf0@example.com',4390.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(132,'Employee 71KoCa','WOq800Uz@example.com',4127.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(133,'Employee 8MZ7kh','kyfKdCfr@example.com',2055.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(134,'Employee 0VohfB','YHbOz82q@example.com',4072.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(135,'Employee lNbevP','bfpwXHpR@example.com',4298.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(136,'Employee HNMkOJ','0hf1neTY@example.com',1542.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(137,'Employee egK1Ek','Tgev1wrI@example.com',3743.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(138,'Employee B10d1a','h6css8UL@example.com',4108.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(139,'Employee Ha5AKI','qyuI79y8@example.com',3357.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(140,'Employee P1Kb0M','X9pLTOV1@example.com',3257.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(141,'Employee 2Sfe10','wX4cqX2R@example.com',2140.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(142,'Employee Muugjw','aifDDuDi@example.com',712.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(143,'Employee bf6ElM','at44nhRH@example.com',2764.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(144,'Employee 3Liity','q70GjYZA@example.com',3382.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(145,'Employee 5nWDmQ','T7mJlJP9@example.com',3701.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(146,'Employee QT2c38','cvmsOwJu@example.com',4421.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(147,'Employee JuvIqN','7CphyjGP@example.com',3447.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(148,'Employee OAaPzT','ErQxGUAP@example.com',4023.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(149,'Employee HS36c6','t0PoVDUj@example.com',662.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(150,'Employee HIYJ4K','0ik38Iez@example.com',4810.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(151,'Employee nBAztb','BYuxRRmd@example.com',1036.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(152,'Employee yjvMhb','0kl7oP3D@example.com',4794.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(153,'Employee URMXkJ','QMWR0dzJ@example.com',2373.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(154,'Employee EbEq2o','Vofxbbsq@example.com',1621.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(155,'Employee 8ypDaf','e8r0kQzm@example.com',1372.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(156,'Employee RYz4M5','BdVgRaY8@example.com',2547.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(157,'Employee RdgGwj','6gHZhd8N@example.com',1646.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(158,'Employee hkFv1e','PId6K9OQ@example.com',2965.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(159,'Employee TAfRzS','Jm5FJI1Y@example.com',2555.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(160,'Employee 3u59Oh','r27nBKkr@example.com',2333.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(161,'Employee exhYyT','3kJ4KhY4@example.com',1968.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(162,'Employee CYnNox','7FqBMtgF@example.com',3764.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(163,'Employee Al6Xz8','R4lVgHOJ@example.com',2152.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(164,'Employee b6O8zs','lNXPH4P5@example.com',3976.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(165,'Employee sVx0sc','fvVxPLCT@example.com',887.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(166,'Employee 9WhMom','eM4MqqXF@example.com',577.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(167,'Employee EDfhA4','VcmI6MBl@example.com',3360.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(168,'Employee FXT0Rh','sboJGqJ7@example.com',2746.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(169,'Employee 1JMiM5','5PNl8d9y@example.com',1436.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(170,'Employee QVatVu','o7mZpRiv@example.com',4262.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(171,'Employee 9zpaSV','xnkYdZrE@example.com',4911.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(172,'Employee WuSZwp','yq1Q9uq7@example.com',1342.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(173,'Employee CCx8Kw','VVKMaJrV@example.com',4910.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(174,'Employee 7XLJfL','JkyPhyUf@example.com',892.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(175,'Employee gro3x0','KNjhsRPx@example.com',4730.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(176,'Employee eulix3','SXYIkNXH@example.com',2687.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(177,'Employee K4HwjN','qTTT4LPW@example.com',1871.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(178,'Employee x2Y4rJ','XPB94mfc@example.com',3495.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(179,'Employee 11UPwV','12BVihpE@example.com',3803.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(180,'Employee SL9Gbm','BAJ0WyUl@example.com',3863.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(181,'Employee MtrBL9','1px2tpQZ@example.com',3803.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(182,'Employee TZdA51','3T4ERpEz@example.com',4949.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(183,'Employee 78188n','1yWpOanN@example.com',509.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(184,'Employee eMKpoy','dfcX7gij@example.com',1209.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(185,'Employee Fy2XlM','TPdKB3JH@example.com',3723.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(186,'Employee xxAY3e','tllcb45V@example.com',4116.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(187,'Employee mwOYJD','BOsdjoTg@example.com',3189.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(188,'Employee t5DBJC','QflHXlnZ@example.com',558.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(189,'Employee WJdAmC','gpTBpbnf@example.com',3763.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(190,'Employee X6RYJ8','IFGq2duT@example.com',3240.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(191,'Employee c7XKHf','Iuk17HMj@example.com',1992.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(192,'Employee frt3Cl','RwbmpwmZ@example.com',1760.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(193,'Employee FlkVka','EzsAdovf@example.com',2304.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(194,'Employee JRJH1z','Xb0hRXH5@example.com',3267.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(195,'Employee xz9w9K','v3jlUQO8@example.com',2514.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(196,'Employee NrKNlB','gG6VFNfn@example.com',4296.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(197,'Employee loqsgL','jZgYnnIb@example.com',3796.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(198,'Employee UdOpCb','rel1Nqf0@example.com',3442.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(199,'Employee 6AJwK1','iArTu9pB@example.com',2108.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(200,'Employee QNxUzb','jlG63pdw@example.com',1424.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(201,'Employee kqm0nX','bs6VjkoH@example.com',2575.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(202,'Employee FKuJF5','MsXgTGhg@example.com',702.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(203,'Employee Ync2yx','DocPGwOR@example.com',4032.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(204,'Employee gDGzWT','P05Ke1BT@example.com',1028.00,NULL,1,1,'2026-01-29 08:52:55','2026-01-29 08:52:55'),(205,'Employee sbjIvN','B2ekwxon@example.com',4596.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(206,'Employee BfS8zM','BN63gkVh@example.com',3971.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(207,'Employee eotFfi','yqOrfngI@example.com',2626.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(208,'Employee R5yTti','bdDxxu4e@example.com',3501.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(209,'Employee qaAJcO','u9RfStsK@example.com',2484.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(210,'Employee fyDCSS','woHSm6ZG@example.com',2680.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(211,'Employee dhwSPW','BN9krcXd@example.com',3668.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(212,'Employee AOz2Wy','Nfhm7YlG@example.com',500.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(213,'Employee TduSQr','xXH3VoZC@example.com',1172.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(214,'Employee wtdCfI','NNJ81jE0@example.com',4909.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(215,'Employee JRFLM4','TwA76qSz@example.com',4175.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(216,'Employee tl15YX','QUd5T7az@example.com',1560.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(217,'Employee 5tGBgj','eOFX5ALQ@example.com',1262.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(218,'Employee sH8Yhi','1avc8oV3@example.com',3738.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(219,'Employee PcSQk1','cVzCGjNt@example.com',4141.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(220,'Employee 46v81g','lFfy0hBl@example.com',3392.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(221,'Employee lXEy6e','ErjA4rU0@example.com',758.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(222,'Employee 0XRs7E','n4o2cFU2@example.com',1686.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(223,'Employee 2PVgfr','mRsg60HF@example.com',4411.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(224,'Employee pKMreg','NQVzQwOM@example.com',3810.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(225,'Employee XJ3The','KQ0XT4ks@example.com',2443.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(226,'Employee h3nP6z','u9t4EOl4@example.com',2321.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(227,'Employee dcn2u2','4p8gbtSN@example.com',1227.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(228,'Employee T4Baxo','UhXP6jEP@example.com',1927.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(229,'Employee 1BAVP6','evGZHEUW@example.com',2031.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(230,'Employee WzvRa9','1X2lPJAU@example.com',3848.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(231,'Employee mI5pRg','SSgeq79V@example.com',4580.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(232,'Employee StS70O','EqJKtvFb@example.com',4732.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(233,'Employee XQLoBK','bZ3X0Utk@example.com',3482.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(234,'Employee x2WdqY','yUobjbCX@example.com',4581.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(235,'Employee LNrw2a','BYX1PNrm@example.com',985.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(236,'Employee jUrYSJ','SkeMbzLs@example.com',3966.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(237,'Employee noS7qa','xeU6Ge5i@example.com',3944.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(238,'Employee TFw0oX','O9cFoO7o@example.com',2357.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(239,'Employee ZBzrfe','Z60QQ7bT@example.com',3906.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(240,'Employee ddm15B','0AFpTLuI@example.com',1982.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(241,'Employee SC68J4','Gam3pjIC@example.com',842.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(242,'Employee T6DPEq','jwFIzBFN@example.com',1006.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(243,'Employee mSUJ8b','09XHAam5@example.com',551.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(244,'Employee 2gJ6cy','NaUwE9LD@example.com',2452.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(245,'Employee CQEJjp','3lZFnt6V@example.com',1038.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(246,'Employee s0v3VT','b2Td3Pih@example.com',3619.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(247,'Employee mtdCJJ','UiELfs4a@example.com',1399.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(248,'Employee 3lj6KS','TMmU3399@example.com',3146.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(249,'Employee 77E4X9','dP1yqLP7@example.com',1047.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(250,'Employee l225gv','iX0JRtcM@example.com',1988.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(251,'Employee MP6JtL','DooZGdDA@example.com',592.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(252,'Employee tdYO4c','vULI7283@example.com',4045.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(253,'Employee 7yVhVF','lAxu1Uhs@example.com',1194.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(254,'Employee ipxalr','Hgz1txy5@example.com',1485.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(255,'Employee hCQUuF','GZbJvbsB@example.com',4538.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(256,'Employee zX54au','XlllimVS@example.com',2421.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(257,'Employee xfqZyy','IhYiBQ3m@example.com',4960.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(258,'Employee YIj4c0','7bc5U7kk@example.com',3930.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(259,'Employee IKSoKb','algLmGXt@example.com',2694.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(260,'Employee gOVT4y','99UYv8vG@example.com',1940.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(261,'Employee TOIIwp','rMpVRBLW@example.com',2834.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(262,'Employee BUCbpF','tI0XntwC@example.com',3743.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(263,'Employee Bxw37x','r8i1KTSU@example.com',4115.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(264,'Employee nggqUx','0GdoxnEM@example.com',3009.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(265,'Employee bkR5Xp','hVQpF4yy@example.com',4775.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(266,'Employee zanlm0','Q8iexffv@example.com',1782.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(267,'Employee 4HzZY3','rYKXegoo@example.com',2546.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(268,'Employee yRHckA','UOCLui8u@example.com',3976.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(269,'Employee pFughs','Ou5R7kei@example.com',2616.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(270,'Employee efDKt0','JzwDNz7u@example.com',1370.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(271,'Employee Ol7qeU','nBZjuh4z@example.com',3142.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(272,'Employee RVVK77','lNM4DbIg@example.com',2264.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(273,'Employee EG0DDR','VkEwKgJc@example.com',3525.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(274,'Employee wns25K','FGTyOyH0@example.com',4804.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(275,'Employee c99g0R','cLQ2d8ad@example.com',752.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(276,'Employee lKIVoK','H4XVHOiU@example.com',3720.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(277,'Employee DQzvbg','wXFX8AiL@example.com',4206.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(278,'Employee pxf0gI','MhrAdBIP@example.com',4156.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(279,'Employee 8KZxNq','vuug0RpV@example.com',2989.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(280,'Employee HYnwuf','FXhtjx5o@example.com',2136.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(281,'Employee fWG9SU','TTBwJmKe@example.com',4166.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(282,'Employee Un0sM4','xGzv2hPN@example.com',1078.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(283,'Employee AP7tAz','od5FeLO0@example.com',2531.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(284,'Employee 6lFgyB','Gi5ON7Gd@example.com',1606.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(285,'Employee vM87aj','XHxjM52L@example.com',2562.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(286,'Employee KqAMSI','MVQSLqgj@example.com',2754.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(287,'Employee iKiusO','4VL4ZxqQ@example.com',4602.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(288,'Employee 5txf8Y','j3KrSBsf@example.com',1205.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(289,'Employee o4GnFv','rWSsD1mq@example.com',2798.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(290,'Employee 6AiwGc','8MkQuQZu@example.com',1744.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(291,'Employee ukcaK5','jCQAObDH@example.com',4445.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(292,'Employee 1Skc5H','vMck1Vvj@example.com',846.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(293,'Employee uB1fub','GQQdwPX1@example.com',4325.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(294,'Employee RPDnFz','RDG51qco@example.com',1408.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(295,'Employee i5Kezg','3FR7iRch@example.com',4169.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(296,'Employee z9YZbP','zDMJBX46@example.com',2800.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(297,'Employee JB3KiE','RI0si2Aa@example.com',3694.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(298,'Employee dCLC3t','ug6KAjfN@example.com',2707.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(299,'Employee KPCPEl','nJC3kaF6@example.com',3056.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(300,'Employee lO4KNv','3JdRyFNL@example.com',1879.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(301,'Employee DjtOYP','YYvAa0E9@example.com',637.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(302,'Employee RosiVY','U3jGiTpi@example.com',796.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(303,'Employee ZHquON','0svf8U6B@example.com',2483.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(304,'Employee D9NyDs','qXu13GPW@example.com',2008.00,NULL,1,1,'2026-01-29 08:52:56','2026-01-29 08:52:56'),(305,'Employee 8Arl0e','jA754Sij@example.com',4080.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(306,'Employee o7Yh4x','5fpXWDUj@example.com',4396.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(307,'Employee RdmZle','cVPePxcs@example.com',991.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(308,'Employee 2BFugs','llZkdtyi@example.com',3770.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(309,'Employee DthQFd','Sxm0IqII@example.com',2387.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(310,'Employee sA4x7O','FGbUWpay@example.com',3655.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(311,'Employee SNg4Yv','YvHiPKHV@example.com',3002.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(312,'Employee nSTord','YjuFejVY@example.com',1819.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(313,'Employee RscsR6','sO0Kbpf0@example.com',4974.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(314,'Employee WrICff','bkbIOOwH@example.com',3645.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(315,'Employee fPfkzH','hKmErp5P@example.com',537.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(316,'Employee iLf78D','PEfYy8wZ@example.com',3702.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(317,'Employee i3rns0','Den001Cm@example.com',1905.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(318,'Employee 67WxbL','bLdJxksI@example.com',4435.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(319,'Employee QfFyhd','2RMekt93@example.com',3759.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(320,'Employee UABdid','qu0o6dHj@example.com',4606.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(321,'Employee 60PVbs','PMB6lIHn@example.com',788.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(322,'Employee BwFK5O','5EpuACWc@example.com',3952.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(323,'Employee K6qALt','dXId8Ze0@example.com',1659.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(324,'Employee 9lEzUD','3nOHcCnk@example.com',697.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(325,'Employee KLsLnm','m8FlJLdH@example.com',4567.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(326,'Employee EUZI8X','kqpBaO7B@example.com',2444.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(327,'Employee XbPhK5','VZXWDAZP@example.com',2046.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(328,'Employee 8NTGVi','CdBY7EDD@example.com',1767.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(329,'Employee 1UVQm2','DMEpqE6q@example.com',1757.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(330,'Employee JU6OGn','JX4n76hG@example.com',1209.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(331,'Employee g2E2GU','yZ7d1S7q@example.com',4447.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(332,'Employee 0FKozr','2k7yP3re@example.com',1710.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(333,'Employee 3OYccG','FtL2RXqt@example.com',3253.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(334,'Employee QX7lPu','eKCwhxuv@example.com',4960.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(335,'Employee CG2bg8','MqO7R9y4@example.com',3462.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(336,'Employee ntFZTX','K87O4iIw@example.com',3982.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(337,'Employee wKkZZY','EBIQHosz@example.com',4657.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(338,'Employee wPuHe9','rCBvCymi@example.com',3946.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(339,'Employee qpTy6y','zxzvt0Y5@example.com',2317.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(340,'Employee YpXa4O','1OuXtHRn@example.com',4549.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(341,'Employee iccEn0','wwqmpzsq@example.com',1577.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(342,'Employee e02DXF','W3KpoaJP@example.com',2720.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(343,'Employee vkkYCz','oTQ08vop@example.com',1871.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(344,'Employee l3iFNV','bgPOzs1c@example.com',4680.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(345,'Employee Kwy3al','4V8kDsrf@example.com',3292.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(346,'Employee TS3M3M','WqZ7sbxd@example.com',2098.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(347,'Employee KfjZui','5Uakb2Mt@example.com',2294.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(348,'Employee cZp6pm','44v7EZcV@example.com',1542.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(349,'Employee XyUuIy','bw0FJocA@example.com',3265.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(350,'Employee uktzYl','hJpPFr4K@example.com',502.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(351,'Employee qmz4On','6iNM6caY@example.com',2241.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(352,'Employee Z7b29s','wLhMeSfQ@example.com',2051.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(353,'Employee bTTq2D','Eh9s81fU@example.com',3668.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(354,'Employee jLEdWP','S4iYBflX@example.com',3964.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(355,'Employee zNob2f','KJ3eFlSP@example.com',943.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(356,'Employee xyESEi','kBUkcTXs@example.com',3928.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(357,'Employee n9PKrh','Ea8BwNXL@example.com',4605.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(358,'Employee tjT8Kz','IGaOEyzg@example.com',1024.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(359,'Employee ekwR0c','1EkWFDdY@example.com',3548.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(360,'Employee Uufkb5','OLURBcXf@example.com',4293.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(361,'Employee XS5Gul','UECUJb7N@example.com',4784.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(362,'Employee yezozU','5L50GdC5@example.com',3630.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(363,'Employee Q0Kx4b','rvwHmEdb@example.com',1954.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(364,'Employee WzDpjp','ZQMDsf7n@example.com',1811.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(365,'Employee kIXA3v','JB4AmrUa@example.com',2493.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(366,'Employee s9OmIx','gyKsOPSI@example.com',1201.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(367,'Employee PWQ7qA','ouBma9CW@example.com',2560.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(368,'Employee a5jgUt','sOPParml@example.com',1085.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(369,'Employee CSREyc','pFLMJnS1@example.com',2743.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(370,'Employee TTw4dU','HP8VWquV@example.com',2159.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(371,'Employee h0hyhD','LxFVYjYU@example.com',3065.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(372,'Employee 866VLh','JbRY0Cdw@example.com',820.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(373,'Employee xzStLD','BwJxVOjC@example.com',4937.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(374,'Employee T7mmse','7ifw58AB@example.com',3895.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(375,'Employee CVEFvF','N4VrmJAF@example.com',710.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(376,'Employee 9Sbpei','LbvoQpGf@example.com',4370.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(377,'Employee BnfKQa','jSP9RiAK@example.com',4637.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(378,'Employee GIJmdc','EQzeQMhD@example.com',4288.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(379,'Employee ne6KZn','0UUhHmRB@example.com',2749.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(380,'Employee q62oZf','BF0E3DLQ@example.com',4178.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(381,'Employee NjCpQN','j98mFOWp@example.com',4269.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(382,'Employee MQdZtk','7L9g6a3p@example.com',1271.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(383,'Employee 4xOxjJ','6qKMcisU@example.com',4426.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(384,'Employee Te8vVs','SvR7omsk@example.com',3647.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(385,'Employee lIOzrt','h4o5VLyF@example.com',4360.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(386,'Employee djrnSs','vsZsm8HS@example.com',3080.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(387,'Employee SvyfJb','ozbdkFob@example.com',4738.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(388,'Employee wSgEXH','GjHpOIPa@example.com',2452.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(389,'Employee J6OIZs','j0faS2mw@example.com',2280.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(390,'Employee i1UHLc','8BnyRAhn@example.com',4174.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(391,'Employee uy1NWP','BZLJpj5c@example.com',4996.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(392,'Employee zjsFU8','qHHJg3gF@example.com',4964.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(393,'Employee 8el5aJ','v8rrldFh@example.com',723.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(394,'Employee wSDrbd','tefzwncn@example.com',1848.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(395,'Employee LclnpG','1wlo4axG@example.com',2370.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(396,'Employee JyHgb2','qRsQ401y@example.com',4876.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(397,'Employee anknN4','d8cU2Tus@example.com',784.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(398,'Employee ZXCkwL','uK8oW8Vf@example.com',1316.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(399,'Employee 8Umb53','k4etuPMw@example.com',786.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(400,'Employee OQgQpf','cwDs7cJs@example.com',3262.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(401,'Employee aCkaHP','04dcBAqv@example.com',625.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(402,'Employee D8jtuN','E0ooM1c9@example.com',1000.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(403,'Employee y0MWDm','XiAVUX9f@example.com',4725.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04'),(404,'Employee 9iM1uT','ZPTP331j@example.com',3800.00,NULL,1,1,'2026-01-29 08:53:04','2026-01-29 08:53:04');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"uuid\":\"c93c7980-2479-4a3b-86db-acdb76c7f12f\",\"displayName\":\"App\\\\Listeners\\\\BroadcastSalaryChange\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":22:{s:5:\\\"class\\\";s:35:\\\"App\\\\Listeners\\\\BroadcastSalaryChange\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:32:\\\"App\\\\Events\\\\EmployeeSalaryChanged\\\":3:{s:8:\\\"employee\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Employee\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:9:\\\"oldSalary\\\";d:5000;s:9:\\\"newSalary\\\";d:2444;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769647481,\"delay\":null}',0,NULL,1769647481,1769647481),(2,'default','{\"uuid\":\"6aaf6259-43c2-4e62-b88c-55707aab7abb\",\"displayName\":\"App\\\\Listeners\\\\SendSalaryChangeEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":22:{s:5:\\\"class\\\";s:35:\\\"App\\\\Listeners\\\\SendSalaryChangeEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:32:\\\"App\\\\Events\\\\EmployeeSalaryChanged\\\":3:{s:8:\\\"employee\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Employee\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:9:\\\"oldSalary\\\";d:5000;s:9:\\\"newSalary\\\";d:2444;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769647481,\"delay\":null}',0,NULL,1769647481,1769647481),(3,'default','{\"uuid\":\"790fd40c-3e03-4ec9-9d5b-801d1cc41546\",\"displayName\":\"App\\\\Listeners\\\\BroadcastSalaryChange\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":22:{s:5:\\\"class\\\";s:35:\\\"App\\\\Listeners\\\\BroadcastSalaryChange\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:32:\\\"App\\\\Events\\\\EmployeeSalaryChanged\\\":3:{s:8:\\\"employee\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Employee\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:7:\\\"manager\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:9:\\\"oldSalary\\\";d:2444;s:9:\\\"newSalary\\\";d:2000;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769647898,\"delay\":null}',0,NULL,1769647898,1769647898),(4,'default','{\"uuid\":\"c1b573b6-b44c-4c25-be47-4756b7d83bfe\",\"displayName\":\"App\\\\Listeners\\\\SendSalaryChangeEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":22:{s:5:\\\"class\\\";s:35:\\\"App\\\\Listeners\\\\SendSalaryChangeEmail\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:32:\\\"App\\\\Events\\\\EmployeeSalaryChanged\\\":3:{s:8:\\\"employee\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Employee\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:7:\\\"manager\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:9:\\\"oldSalary\\\";d:2444;s:9:\\\"newSalary\\\";d:2000;}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769647898,\"delay\":null}',0,NULL,1769647898,1769647898);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_01_27_170656_create_personal_access_tokens_table',1),(5,'2026_01_27_233523_create_positions_table',1),(6,'2026_01_27_233541_create_employees_table',1),(7,'2026_01_28_164709_create_employee_logs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','5afc48b115e5339edcce336065c4ab3e9ee8c6ea150f071ccd1bb015b2ee4950','[\"*\"]',NULL,NULL,'2026-01-29 08:35:54','2026-01-29 08:35:54'),(2,'App\\Models\\User',1,'auth_token','e22550388b13244dcf8e781350248a1a08b45576127015dd4b3e1ef58ab921ce','[\"*\"]','2026-01-29 08:51:38',NULL,'2026-01-29 08:36:19','2026-01-29 08:51:38');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `positions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'HR','2026-01-29 08:37:08','2026-01-29 08:37:08'),(2,'Software Engineer','2026-01-29 08:37:29','2026-01-29 08:37:29'),(3,'Team Lead','2026-01-29 08:37:42','2026-01-29 08:37:42'),(4,'Backend Developer','2026-01-29 08:37:54','2026-01-29 08:37:54');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mohammad Tarabishy','admin@test.com',NULL,'$2y$12$u4U9CZ/jI2KhNvEyGea3QuqP2RaKKysh8uFGMe1eDWJYYutuDA3GK',NULL,'2026-01-29 08:35:54','2026-01-29 08:35:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-28 16:53:21
