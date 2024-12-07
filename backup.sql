-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: pickmeup-do-user-15742309-0.f.db.ondigitalocean.com    Database: pickmeup
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_logs` (
  `log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `delivery_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ride_id` bigint unsigned NOT NULL,
  `delivery_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `delivery_ride_id_foreign` (`ride_id`),
  CONSTRAINT `delivery_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride_histories` (`ride_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,2,'Padala','Kuhaa lang kay ratunil ang pakage naa balay pag ayo lang','2024-11-18 08:38:38','2024-11-18 08:38:38'),(2,9,'Padala','Palit bugas','2024-11-18 10:43:31','2024-11-18 10:43:31'),(3,18,'Padala','Padala','2024-11-19 04:08:44','2024-11-19 04:08:44'),(4,30,'Padala','Palit coke 1 gallon','2024-11-19 19:43:22','2024-11-19 19:43:22'),(5,32,'Padala','Palit kape','2024-11-19 21:51:06','2024-11-19 21:51:06'),(6,40,'Pasugo','Padala ko cabinet','2024-11-20 05:22:03','2024-11-20 05:22:03'),(7,41,'Padala','Kuhaa sa','2024-11-20 05:26:04','2024-11-20 05:26:04'),(8,46,'Padala','I need you purchase Ryzen 7 5890x and deliver it carefully to my house.','2024-11-20 08:25:37','2024-11-20 08:25:37'),(9,59,'Padala','Gege','2024-11-20 16:23:21','2024-11-20 16:23:21'),(10,72,'Pasugo','Please ko ayaw pas2 kay glass ang dala','2024-11-20 23:29:06','2024-11-20 23:29:06'),(11,77,'Padala','Palit bugas','2024-11-21 06:59:20','2024-11-21 06:59:20'),(12,79,'Padala','Parcel','2024-11-21 07:03:38','2024-11-21 07:03:38'),(13,81,'Padala','Gege','2024-11-21 07:09:10','2024-11-21 07:09:10'),(14,84,'Padala','Gege','2024-11-21 07:33:38','2024-11-21 07:33:38'),(15,115,'Pasugo','Fragile','2024-11-23 01:34:33','2024-11-23 01:34:33'),(16,118,'Padala','Please buy pizza','2024-11-23 01:54:21','2024-11-23 01:54:21');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `feedback_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender` bigint unsigned NOT NULL,
  `recipient` bigint unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `rating` int NOT NULL,
  `ride_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedbacks_ride_id_foreign` (`ride_id`),
  KEY `feedbacks_sender_foreign` (`sender`),
  KEY `feedbacks_recipient_foreign` (`recipient`),
  CONSTRAINT `feedbacks_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `users` (`user_id`),
  CONSTRAINT `feedbacks_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride_histories` (`ride_id`),
  CONSTRAINT `feedbacks_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,4,12,'Fast',5,15,'2024-11-19 00:06:08','2024-11-19 00:06:08'),(2,12,4,'slow',2,19,'2024-11-19 08:20:18','2024-11-19 08:20:18'),(3,7,19,'Lingas',1,28,'2024-11-19 18:11:40','2024-11-19 18:11:40'),(4,19,7,'',5,28,'2024-11-19 19:20:33','2024-11-19 19:20:33'),(5,12,4,'Ok',5,33,'2024-11-20 01:05:46','2024-11-20 01:05:46'),(6,19,4,'',5,35,'2024-11-20 04:24:30','2024-11-20 04:24:30'),(7,12,4,'poasoaspodjas',1,37,'2024-11-20 04:46:18','2024-11-20 04:46:18'),(8,12,4,'',1,39,'2024-11-20 05:24:26','2024-11-20 05:24:26'),(9,12,7,'Hooos',4,41,'2024-11-20 05:29:10','2024-11-20 05:29:10'),(10,19,4,'',4,36,'2024-11-20 08:22:13','2024-11-20 08:22:13'),(11,12,3,'',1,48,'2024-11-20 09:00:24','2024-11-20 09:00:24'),(12,3,12,'Sample',4,52,'2024-11-20 14:27:41','2024-11-20 14:27:41'),(13,12,3,'Sample finish custpmer',3,52,'2024-11-20 14:29:20','2024-11-20 14:29:20'),(14,3,12,'Behave',4,55,'2024-11-20 14:37:10','2024-11-20 14:37:10'),(15,12,3,'Chada',4,55,'2024-11-20 14:38:10','2024-11-20 14:38:10'),(16,12,3,'',4,56,'2024-11-20 15:43:01','2024-11-20 15:43:01'),(17,12,4,'Weh?',5,57,'2024-11-20 15:47:00','2024-11-20 15:47:00'),(18,4,12,'Hilason',4,58,'2024-11-20 16:19:19','2024-11-20 16:19:19'),(19,12,4,'Kulang sukli',4,58,'2024-11-20 16:20:58','2024-11-20 16:20:58'),(20,4,12,'AnTagal',4,59,'2024-11-20 16:31:56','2024-11-20 16:31:56'),(21,12,4,'Sge nlng',4,59,'2024-11-20 16:35:04','2024-11-20 16:35:04'),(22,4,12,'Gege',3,65,'2024-11-20 17:34:54','2024-11-20 17:34:54'),(23,12,4,'Kusoga',3,65,'2024-11-20 17:35:36','2024-11-20 17:35:36'),(24,12,7,'Waybuot rider',1,66,'2024-11-20 23:25:36','2024-11-20 23:25:36'),(25,7,3,'',1,47,'2024-11-20 23:28:25','2024-11-20 23:28:25'),(26,12,7,'',4,72,'2024-11-20 23:33:30','2024-11-20 23:33:30'),(27,12,7,'Goods',4,80,'2024-11-21 07:08:48','2024-11-21 07:08:48'),(28,8,3,'',5,82,'2024-11-21 07:27:44','2024-11-21 07:27:44'),(29,12,3,'Wow',2,84,'2024-11-21 07:40:44','2024-11-21 07:40:44'),(30,8,7,'',3,102,'2024-11-21 08:40:58','2024-11-21 08:40:58'),(31,7,3,'',2,106,'2024-11-21 09:06:19','2024-11-21 09:06:19'),(32,25,21,'',5,108,'2024-11-22 03:24:02','2024-11-22 03:24:02'),(33,18,7,'',4,114,'2024-11-23 01:33:37','2024-11-23 01:33:37'),(34,12,7,'Good',5,115,'2024-11-23 01:36:49','2024-11-23 01:36:49'),(35,12,7,'Superb',5,116,'2024-11-23 01:40:09','2024-11-23 01:40:09'),(36,12,18,'Homot helmet',5,117,'2024-11-23 01:53:23','2024-11-23 01:53:23'),(37,12,18,'Gahi na rider',5,118,'2024-11-23 01:55:33','2024-11-23 01:55:33'),(38,12,18,'',5,119,'2024-11-24 06:26:48','2024-11-24 06:26:48');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'0001_01_01_000002_create_jobs_table',1),(3,'2024_06_04_073728_create_roles_table',1),(4,'2024_06_04_073739_create_users_table',1),(5,'2024_06_04_130911_create_personal_access_tokens_table',1),(6,'2024_06_04_153451_create_sessions_table',1),(7,'2024_07_19_081190_create_riders_table',1),(8,'2024_07_19_081192_create_payments_table',1),(9,'2024_07_19_081200_create_requirements_table',1),(10,'2024_07_19_081279_create_requirements_photos_table',1),(11,'2024_07_19_081300_create_ride_histories_table',1),(12,'2024_07_19_081310_create_delivery_table',1),(13,'2024_07_19_081350_create_pakyaw_table',1),(14,'2024_07_19_081400_create_feedbacks_table',1),(15,'2024_07_19_081500_create_activity_logs_table',1),(16,'2024_09_05_114402_create_ride_applications_table',1),(17,'2024_10_01_061613_create_ride_locations_table',1),(18,'2024_11_18_174846_create_reports_table',2),(20,'2024_11_20_230830_insert_riders_column_in_pakyaw_table',3),(22,'2024_11_21_080319_insert_riders',4),(23,'2024_11_24_171032_add_is_logged_in_to_users_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pakyaw`
--

DROP TABLE IF EXISTS `pakyaw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pakyaw` (
  `pakyaw_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ride_id` bigint unsigned NOT NULL,
  `num_of_riders` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `riders` json DEFAULT NULL,
  `scheduled_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pakyaw_id`),
  KEY `pakyaw_ride_id_foreign` (`ride_id`),
  CONSTRAINT `pakyaw_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride_histories` (`ride_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pakyaw`
--

LOCK TABLES `pakyaw` WRITE;
/*!40000 ALTER TABLE `pakyaw` DISABLE KEYS */;
INSERT INTO `pakyaw` VALUES (1,91,1,'nsjjsjaka',NULL,'2024-11-21 07:49:17','2024-11-21 07:58:26','2024-11-21 07:58:26'),(2,92,1,'bsjsjsjka',NULL,'2024-11-21 08:00:59','2024-11-21 08:01:33','2024-11-21 08:01:33'),(3,93,1,'bsjsjsjka',NULL,'2024-11-21 08:00:59','2024-11-21 08:03:59','2024-11-21 08:03:59'),(4,105,1,'juaton',NULL,'2024-11-21 08:50:34','2024-11-21 08:51:21','2024-11-21 08:51:21'),(5,106,1,'Pagdali','[3]','2024-11-29 08:57:00','2024-11-21 09:02:01','2024-11-21 09:02:54'),(6,107,1,'Back and forth',NULL,'2024-11-21 11:00:13','2024-11-21 11:01:54','2024-11-21 11:01:54'),(7,109,1,'Please ko hatud back and forth',NULL,'2024-11-23 00:00:00','2024-11-23 00:00:39','2024-11-23 00:00:39'),(8,111,1,'Pahatod',NULL,'2024-11-23 00:59:09','2024-11-23 00:59:58','2024-11-23 00:59:58'),(9,113,1,'Pahatod',NULL,'2024-11-23 01:21:19','2024-11-23 01:21:49','2024-11-23 01:21:49'),(10,116,1,'Pahatod','[7]','2024-11-23 01:37:04','2024-11-23 01:37:55','2024-11-23 01:38:27'),(11,119,1,'Back and forth lang ta','[18]','2024-11-23 01:55:38','2024-11-23 01:56:55','2024-11-23 01:58:41');
/*!40000 ALTER TABLE `pakyaw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payment_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `rider_id` bigint unsigned NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_rider_id_foreign` (`rider_id`),
  CONSTRAINT `payments_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `riders` (`rider_id`),
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (4,'App\\Models\\User',14,'Personal Access Token','bc9bf562e348a877a4b8e801ce3c29f377c19c5cf0d87f24a967261401f239dd','[\"*\"]',NULL,NULL,'2024-11-17 07:37:01','2024-11-17 07:37:01'),(5,'App\\Models\\User',3,'Personal Access Token','852cfc6772f3e0a4d46daaccdfc6787e0d695db4ff3bb3093845b0ee1007ef6c','[\"*\"]',NULL,NULL,'2024-11-18 07:56:07','2024-11-18 07:56:07'),(12,'App\\Models\\User',2,'Personal Access Token','97eaadca3db395b16c43d9f69e922a859cbeb2d4cad3176eb2cad458b0dc2a24','[\"*\"]',NULL,NULL,'2024-11-18 08:51:31','2024-11-18 08:51:31'),(13,'App\\Models\\User',4,'Personal Access Token','e9b88f270e0e24299c3212f716dd69dc6bda40e2dceb01862cca846a9c72a2f1','[\"*\"]',NULL,NULL,'2024-11-18 08:54:43','2024-11-18 08:54:43'),(15,'App\\Models\\User',1,'Personal Access Token','906a9564f147685195a5d00f3ec01d0b9017b7ebbdf1d5a9a5506c9216795071','[\"*\"]',NULL,NULL,'2024-11-18 09:03:30','2024-11-18 09:03:30'),(16,'App\\Models\\User',12,'Personal Access Token','803d2f84c56372a2ddb3d3088a5baa3392c3557654b6a98f942542ab5675d94f','[\"*\"]',NULL,NULL,'2024-11-18 09:23:22','2024-11-18 09:23:22'),(17,'App\\Models\\User',18,'Personal Access Token','053405e4120af935de1803532645e593d6817596ca6210a729fa6ec7bf02b3f1','[\"*\"]',NULL,NULL,'2024-11-18 09:24:39','2024-11-18 09:24:39'),(19,'App\\Models\\User',8,'Personal Access Token','198707a9eb2ee84f8fcc65bb72b5075fd44c281d685b2279e9652d89b69676e3','[\"*\"]',NULL,NULL,'2024-11-18 10:45:50','2024-11-18 10:45:50'),(23,'App\\Models\\User',12,'Personal Access Token','9c4877e48e0ee655a5ceb6b0170773a9d29148a311ed88ec39cac9ceacc5f785','[\"*\"]',NULL,NULL,'2024-11-19 00:03:36','2024-11-19 00:03:36'),(25,'App\\Models\\User',12,'Personal Access Token','3071768108f331c7ed8f2e2968022ce54939720aa15160d7d8df0f25bd5a4c2e','[\"*\"]',NULL,NULL,'2024-11-19 03:38:52','2024-11-19 03:38:52'),(26,'App\\Models\\User',18,'Personal Access Token','95163882230e45407addfb832deb43082ed6af64d2733939a636a9bacd2b731a','[\"*\"]',NULL,NULL,'2024-11-19 03:50:06','2024-11-19 03:50:06'),(27,'App\\Models\\User',12,'Personal Access Token','d9f104101a3d6497d75ff2800b868a530c197459711cb75670ac8bf14e8aca73','[\"*\"]',NULL,NULL,'2024-11-19 04:19:32','2024-11-19 04:19:32'),(29,'App\\Models\\User',4,'Personal Access Token','c7a0890e266ee9eef21c426af91124073ab933cc7bd67694efd85287d6077bb5','[\"*\"]',NULL,NULL,'2024-11-19 06:34:38','2024-11-19 06:34:38'),(30,'App\\Models\\User',12,'Personal Access Token','388eb358d00ae4518efbf26dc5e04d8ef921f6e7e5046995edb9f00253b68641','[\"*\"]',NULL,NULL,'2024-11-19 06:40:35','2024-11-19 06:40:35'),(31,'App\\Models\\User',12,'Personal Access Token','48a59c0ae77868598d05c98444756f4bdfe112d1b8eb95721b9b9e2851e2e8bf','[\"*\"]',NULL,NULL,'2024-11-19 06:46:00','2024-11-19 06:46:00'),(33,'App\\Models\\User',12,'Personal Access Token','664ea0faa79249b5377cfd01e5945085cd715ccfb6dfaef214a3624fe702700b','[\"*\"]',NULL,NULL,'2024-11-19 08:19:55','2024-11-19 08:19:55'),(34,'App\\Models\\User',2,'Personal Access Token','2db41718ca65d56197d6a3545e1d815e2a5c812fe416d0837cd156f8917aa417','[\"*\"]',NULL,NULL,'2024-11-19 08:21:02','2024-11-19 08:21:02'),(37,'App\\Models\\User',1,'Personal Access Token','59266b17eeea03f8a292069f9996ab3c0d175deaa1233c5bb10367af365e2308','[\"*\"]',NULL,NULL,'2024-11-19 09:15:00','2024-11-19 09:15:00'),(38,'App\\Models\\User',2,'Personal Access Token','15951f7b964139c8852d581c4f9253e891be5c096f0f1beacfb05c5e85703fd1','[\"*\"]',NULL,NULL,'2024-11-19 10:15:46','2024-11-19 10:15:46'),(39,'App\\Models\\User',2,'Personal Access Token','030d32fb51a4ac1c96525c70b3710da97a726d4a1ae28d7f5764a38dec923725','[\"*\"]',NULL,NULL,'2024-11-19 10:21:00','2024-11-19 10:21:00'),(41,'App\\Models\\User',2,'Personal Access Token','761c0e620ac7520310a0051f237e2f2a6580063522a04461c78d90f1f9f718f9','[\"*\"]',NULL,NULL,'2024-11-19 10:32:43','2024-11-19 10:32:43'),(45,'App\\Models\\User',19,'Personal Access Token','855d78e4e3ad5cb0983181b437da9ac0171ce7c52fb0cfb0b24efd468fc06f87','[\"*\"]',NULL,NULL,'2024-11-19 16:13:54','2024-11-19 16:13:54'),(46,'App\\Models\\User',12,'Personal Access Token','f7fbcad37bf4cc2e2879f071f5b9adc1006f0864270f60e3826b978437589da7','[\"*\"]',NULL,NULL,'2024-11-19 16:20:31','2024-11-19 16:20:31'),(49,'App\\Models\\User',4,'Personal Access Token','050e98e093ec923c3c21f84c678213cbaf048c1d00508033f79f639e2176a5cf','[\"*\"]',NULL,NULL,'2024-11-19 22:51:44','2024-11-19 22:51:44'),(50,'App\\Models\\User',12,'Personal Access Token','5ed7a271a18748f0ed9e1d0ee6b37fd1bb6e2c7b6c623dc415d629d6be8d3d25','[\"*\"]',NULL,NULL,'2024-11-19 22:56:27','2024-11-19 22:56:27'),(51,'App\\Models\\User',12,'Personal Access Token','f6925501d392d1a420ff4fd26c07e38b775a6e007aceb54e8c95a9e24ada6874','[\"*\"]',NULL,NULL,'2024-11-20 00:40:21','2024-11-20 00:40:21'),(52,'App\\Models\\User',12,'Personal Access Token','6c94c8bffefff531c925c07185b547a8980a4c8f571db55ac9bf1ec5b5f2dfc7','[\"*\"]',NULL,NULL,'2024-11-20 00:53:01','2024-11-20 00:53:01'),(53,'App\\Models\\User',12,'Personal Access Token','db13a5584986791877e7ca1f1b98d56bc274a281a87652776e7f9537ec7e8b69','[\"*\"]',NULL,NULL,'2024-11-20 01:00:46','2024-11-20 01:00:46'),(54,'App\\Models\\User',18,'Personal Access Token','edc4dae8ded6ad09240dfb87356a4cf239f81f47915d9244ecf507b79226803c','[\"*\"]',NULL,NULL,'2024-11-20 01:40:31','2024-11-20 01:40:31'),(56,'App\\Models\\User',20,'Personal Access Token','78117ee279a13a3bb704a34df381d94191b0880ae493d878e649240090ec7712','[\"*\"]',NULL,NULL,'2024-11-20 03:31:38','2024-11-20 03:31:38'),(57,'App\\Models\\User',20,'Personal Access Token','9d1d9ac1274ec33bacb72aa032354760256a460146b9fdc0a44b41e5b4509638','[\"*\"]',NULL,NULL,'2024-11-20 03:32:24','2024-11-20 03:32:24'),(58,'App\\Models\\User',20,'Personal Access Token','6afc68c7ed06a27de50efdd9d54a38088bf41fbae0a8c347409f28ce5a94f9ee','[\"*\"]',NULL,NULL,'2024-11-20 03:33:09','2024-11-20 03:33:09'),(63,'App\\Models\\User',4,'Personal Access Token','60c6ca1f2532deddc59b083470391ed6a7d8a7e46eeb99bde0b7c7507a14797f','[\"*\"]',NULL,NULL,'2024-11-20 04:47:40','2024-11-20 04:47:40'),(65,'App\\Models\\User',4,'Personal Access Token','61654042392ec892e05446191704778dd845de8860c380410b5560529f67a9d7','[\"*\"]',NULL,NULL,'2024-11-20 05:20:21','2024-11-20 05:20:21'),(66,'App\\Models\\User',12,'Personal Access Token','300d54a25815ec5f50741cb27807d43d063c5b54a560fce7423fcc425475902e','[\"*\"]',NULL,NULL,'2024-11-20 05:23:15','2024-11-20 05:23:15'),(68,'App\\Models\\User',3,'Personal Access Token','2343336c71a7eab9ca88f5407ebaade294b5bdab20059782413429ee37c70fba','[\"*\"]',NULL,NULL,'2024-11-20 06:38:13','2024-11-20 06:38:13'),(77,'App\\Models\\User',3,'Personal Access Token','06e4cd88e0d7255abc643e9c038d0c2c1378de27039a3b6d1fc11ad2ca6acf96','[\"*\"]',NULL,NULL,'2024-11-20 11:59:23','2024-11-20 11:59:23'),(78,'App\\Models\\User',1,'Personal Access Token','9d7795e21616a8e3ccea537606dc0c791769edac1daa66989fa3cddea439e533','[\"*\"]',NULL,NULL,'2024-11-20 12:25:57','2024-11-20 12:25:57'),(79,'App\\Models\\User',1,'Personal Access Token','779904eca8c073f9f76f3b8a90bee703baf19cc57d9cdb1f91c788adf69e4bc1','[\"*\"]',NULL,NULL,'2024-11-20 12:30:22','2024-11-20 12:30:22'),(80,'App\\Models\\User',12,'Personal Access Token','d0589991ee75af3f559780aa9ccc852f15bfef46e2318512b9fd3f524b82f6d5','[\"*\"]',NULL,NULL,'2024-11-20 12:31:29','2024-11-20 12:31:29'),(82,'App\\Models\\User',21,'Personal Access Token','a625e6a909ed0f2298e8d316b428b8211c112f08aa9e157f49b3c9480c7b18e6','[\"*\"]',NULL,NULL,'2024-11-20 12:34:03','2024-11-20 12:34:03'),(83,'App\\Models\\User',3,'Personal Access Token','251ccb86629dfef96faa25f691929972b3ea462adb03ba1d3189f3cd0ebeff99','[\"*\"]',NULL,NULL,'2024-11-20 14:22:53','2024-11-20 14:22:53'),(89,'App\\Models\\User',12,'Personal Access Token','9c6ac5d463203e76612ade401d3dbc2b85adfeca7048ddd031ce174b54c01b93','[\"*\"]',NULL,NULL,'2024-11-20 15:43:18','2024-11-20 15:43:18'),(90,'App\\Models\\User',2,'Personal Access Token','6a5cd0c1f91b59eb7e058199c7676647760edbdbbed91947752beec9d95c0851','[\"*\"]',NULL,NULL,'2024-11-20 15:44:00','2024-11-20 15:44:00'),(94,'App\\Models\\User',4,'Personal Access Token','817d750aa753d846358ee85c46e3b0ba4186cb5a3562be6e361377564dc4050b','[\"*\"]',NULL,NULL,'2024-11-20 15:56:44','2024-11-20 15:56:44'),(108,'App\\Models\\User',12,'Personal Access Token','23fe76d622978797f76cbda993536e5b09026e1b301915b41789cbfc203ca4e8','[\"*\"]',NULL,NULL,'2024-11-20 23:30:34','2024-11-20 23:30:34'),(109,'App\\Models\\User',3,'Personal Access Token','1d160e53c37611b0034f3f5f50580f347d5aee029a5513d3c1a11228adc2b8a6','[\"*\"]',NULL,NULL,'2024-11-20 23:33:51','2024-11-20 23:33:51'),(110,'App\\Models\\User',8,'Personal Access Token','2596c7572f9e969a5fac2e083b7e639593f960dc617a0dd70a0e95e54b4fca8c','[\"*\"]',NULL,NULL,'2024-11-20 23:34:17','2024-11-20 23:34:17'),(112,'App\\Models\\User',4,'Personal Access Token','2d9554bd0f4d75e6bf35d30bf5cc496b89266e52cd6e32158dfe3a7803df1390','[\"*\"]','2024-11-21 01:07:17',NULL,'2024-11-21 01:00:45','2024-11-21 01:07:17'),(118,'App\\Models\\User',8,'Personal Access Token','ec5929e547786064a1780522135ed91d655e576cff4f4c4f346fb4ec1a0f0a3e','[\"*\"]',NULL,NULL,'2024-11-21 07:23:30','2024-11-21 07:23:30'),(119,'App\\Models\\User',12,'Personal Access Token','6fc214bd63c1837a8d06671d2e04ae70fe8eec63f92836b29bdb66e94ce63ebf','[\"*\"]',NULL,NULL,'2024-11-21 07:31:26','2024-11-21 07:31:26'),(121,'App\\Models\\User',2,'Personal Access Token','c77eef6ddd2fb75256106c9c7a4eb7477eb2412c20b6d315d7bc4288ac4c5f88','[\"*\"]',NULL,NULL,'2024-11-21 07:44:50','2024-11-21 07:44:50'),(122,'App\\Models\\User',2,'Personal Access Token','a214c5baa5bacf09bec682282e78d855682dc3ff217b7a7209c1e4dd791e5b2b','[\"*\"]',NULL,NULL,'2024-11-21 07:45:01','2024-11-21 07:45:01'),(133,'App\\Models\\User',7,'Personal Access Token','5065875a17d100e3a8920151f4b4e48819be1d9f72fc03356ee83d8fc806b505','[\"*\"]',NULL,NULL,'2024-11-21 08:15:05','2024-11-21 08:15:05'),(141,'App\\Models\\User',25,'Personal Access Token','b5366e7787c67f3c8e865bf44971e1247f8272885a09896cb999ca5623d895ed','[\"*\"]',NULL,NULL,'2024-11-22 03:16:49','2024-11-22 03:16:49'),(146,'App\\Models\\User',8,'Personal Access Token','a0add67ef6fe48af85595c46f5d5b7048c8f181869768bdf5f259ed7ce956afc','[\"*\"]',NULL,NULL,'2024-11-22 12:57:14','2024-11-22 12:57:14'),(147,'App\\Models\\User',2,'Personal Access Token','c04c5192018603949576d5afbce74371804c83852ade91981da176110a33a69e','[\"*\"]',NULL,NULL,'2024-11-23 00:15:04','2024-11-23 00:15:04'),(148,'App\\Models\\User',1,'Personal Access Token','4bf7cfac36c1e9f1064e33b17c1e8efc42e28f1203a55a8473d88dde764e6bfa','[\"*\"]',NULL,NULL,'2024-11-23 00:16:11','2024-11-23 00:16:11'),(151,'App\\Models\\User',8,'Personal Access Token','cd222908e22570510f3eabb52a1babcde4806f82bfa4ae20510f49fef2921447','[\"*\"]',NULL,NULL,'2024-11-23 01:10:17','2024-11-23 01:10:17'),(154,'App\\Models\\User',18,'Personal Access Token','dafeeb1eff3abb27e8261f475cee9024d7853db5dfea5c32c2ecf49ca1a9d2f4','[\"*\"]',NULL,NULL,'2024-11-23 01:40:45','2024-11-23 01:40:45'),(156,'App\\Models\\User',12,'Personal Access Token','760f6b20acd92122c4f0a243bb453ff769621d4f0d3a886534a2795878baf20a','[\"*\"]',NULL,NULL,'2024-11-23 01:45:09','2024-11-23 01:45:09'),(157,'App\\Models\\User',7,'Personal Access Token','d1aee2a6bd3b81e1deb6516d2bd95c5d58aaa2cf24444aafc40bccb4936971bc','[\"*\"]',NULL,NULL,'2024-11-23 02:11:15','2024-11-23 02:11:15'),(158,'App\\Models\\User',12,'Personal Access Token','a0ea2b8c3c60712a2d2e0da8b6f903bda5903a79756ae62171738e1201323f86','[\"*\"]',NULL,NULL,'2024-11-23 02:17:56','2024-11-23 02:17:56'),(164,'App\\Models\\User',10,'Personal Access Token','91cd5dade72dc6c2d663e03fe1b92ebf569236cd6fb292b3af96c1b678f9c478','[\"*\"]',NULL,NULL,'2024-11-23 09:39:21','2024-11-23 09:39:21'),(166,'App\\Models\\User',29,'Personal Access Token','4f7582e9eb088afc5e5c0051e95377df4c94bb1e90d2837786a19a4cd042253f','[\"*\"]',NULL,NULL,'2024-11-23 10:32:02','2024-11-23 10:32:02'),(167,'App\\Models\\User',1,'Personal Access Token','a103d3ed4e60863bbe9ae9a515d009c3fb47281e0cee68729f96a9bcccb00a40','[\"*\"]',NULL,NULL,'2024-11-23 11:33:02','2024-11-23 11:33:02'),(170,'App\\Models\\User',3,'Personal Access Token','b10d971777005c6e74792a44037c3ad9dc5c9386397fd670bd04553914c74e2c','[\"*\"]',NULL,NULL,'2024-11-24 17:37:47','2024-11-24 17:37:47');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `report_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender` bigint unsigned NOT NULL,
  `recipient` bigint unsigned NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `ride_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `reports_ride_id_foreign` (`ride_id`),
  KEY `reports_sender_foreign` (`sender`),
  KEY `reports_recipient_foreign` (`recipient`),
  CONSTRAINT `reports_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reports_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride_histories` (`ride_id`),
  CONSTRAINT `reports_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,12,4,'Other','Good',15,'2024-11-19 00:06:36','2024-11-19 00:06:36'),(2,19,7,'Reckless driving','Broken Hearted',25,'2024-11-19 18:00:06','2024-11-19 18:00:06'),(3,12,4,'Rider was rude','',58,'2024-11-20 16:16:30','2024-11-20 16:16:30'),(4,12,4,'Overcharging','',59,'2024-11-20 16:33:33','2024-11-20 16:33:33'),(5,12,4,'Other','Samok',65,'2024-11-20 17:34:44','2024-11-20 17:34:44'),(6,12,7,'Reckless driving','',66,'2024-11-20 23:22:53','2024-11-20 23:22:53'),(7,8,7,'Other','Bahog helmet',102,'2024-11-21 08:39:37','2024-11-21 08:39:37');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement_photos`
--

DROP TABLE IF EXISTS `requirement_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirement_photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rider_id` bigint unsigned NOT NULL,
  `requirement_id` bigint unsigned NOT NULL,
  `photo_url` varchar(2083) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requirement_photos_rider_id_foreign` (`rider_id`),
  KEY `requirement_photos_requirement_id_foreign` (`requirement_id`),
  CONSTRAINT `requirement_photos_requirement_id_foreign` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`requirement_id`) ON DELETE CASCADE,
  CONSTRAINT `requirement_photos_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `riders` (`rider_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement_photos`
--

LOCK TABLES `requirement_photos` WRITE;
/*!40000 ALTER TABLE `requirement_photos` DISABLE KEYS */;
INSERT INTO `requirement_photos` VALUES (1,2,1,'https://res.cloudinary.com/dapugww63/image/upload/v1732151229/verification_documents/tuj4smxbeygbsn1qxevs.jpg','2024-11-21 01:02:15','2024-11-21 01:07:10'),(2,2,4,'https://res.cloudinary.com/dapugww63/image/upload/v1732151229/verification_documents/re2ejlcjnq79cohpzglh.jpg','2024-11-21 01:02:15','2024-11-21 01:07:10'),(3,2,8,'https://res.cloudinary.com/dapugww63/image/upload/v1732151229/verification_documents/urjsopuhaefvshn5bhjd.jpg','2024-11-21 01:07:10','2024-11-21 01:07:10'),(4,2,2,'https://res.cloudinary.com/dapugww63/image/upload/v1732151229/verification_documents/gp0kh2pw6ywwwdwgnkvn.jpg','2024-11-21 01:07:10','2024-11-21 01:07:10'),(5,2,7,'https://res.cloudinary.com/dapugww63/image/upload/v1732151229/verification_documents/uwkqywb1ci9r7vsa5atc.jpg','2024-11-21 01:07:10','2024-11-21 01:07:10'),(6,2,9,'https://res.cloudinary.com/dapugww63/image/upload/v1732151234/verification_documents/zmgonf229wl6fxrwpkfy.jpg','2024-11-21 01:07:15','2024-11-21 01:07:15'),(7,2,5,'Dyytut','2024-11-21 01:07:18','2024-11-21 01:07:18'),(8,2,6,'2024-11-21','2024-11-21 01:07:18','2024-11-21 01:07:18'),(9,2,3,'2024-11-21','2024-11-21 01:07:19','2024-11-21 01:07:19'),(10,2,10,'Ryioyrre','2024-11-21 01:07:20','2024-11-21 01:07:20');
/*!40000 ALTER TABLE `requirement_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirements` (
  `requirement_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`requirement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (1,'Motorcycle Picture','Image of the Motorcycle Model','2024-11-16 16:09:53','2024-11-16 16:09:53'),(2,'ORCR','Image of ORCR','2024-11-16 16:09:53','2024-11-16 16:09:53'),(3,'OR Expiration Date','OR Expiration Date','2024-11-16 16:09:53','2024-11-16 16:09:53'),(4,'Drivers License','Image of the Drivers License','2024-11-16 16:09:53','2024-11-16 16:09:53'),(5,'Drivers License Number','Drivers License Number','2024-11-16 16:09:53','2024-11-16 16:09:53'),(6,'License Expiration Date','Drivers License Expiration Date','2024-11-16 16:09:53','2024-11-16 16:09:53'),(7,'TPL Insurance','Image of the TPL Insurance','2024-11-16 16:09:53','2024-11-16 16:09:53'),(8,'Barangay Clearance','Image of the Barangay Clearance','2024-11-16 16:09:53','2024-11-16 16:09:53'),(9,'Police Clearance','Image of the Police Clearance','2024-11-16 16:09:53','2024-11-16 16:09:53'),(10,'Plate Number','Plate Number','2024-11-16 16:09:53','2024-11-16 16:09:53');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_applications`
--

DROP TABLE IF EXISTS `ride_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride_applications` (
  `apply_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ride_id` bigint unsigned NOT NULL,
  `applier` int NOT NULL,
  `date` datetime NOT NULL,
  `apply_to` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `ride_applications_ride_id_foreign` (`ride_id`),
  CONSTRAINT `ride_applications_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride_histories` (`ride_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_applications`
--

LOCK TABLES `ride_applications` WRITE;
/*!40000 ALTER TABLE `ride_applications` DISABLE KEYS */;
INSERT INTO `ride_applications` VALUES (2,4,3,'2024-11-18 08:56:22',4,'Matched','2024-11-18 08:56:22','2024-11-18 08:58:40'),(3,5,15,'2024-11-18 08:59:12',14,'Pending','2024-11-18 08:59:12','2024-11-18 08:59:12'),(4,5,15,'2024-11-18 08:59:29',3,'Declined','2024-11-18 08:59:29','2024-11-19 16:14:53'),(5,5,18,'2024-11-18 09:05:26',15,'Pending','2024-11-18 09:05:26','2024-11-18 09:05:26'),(6,7,18,'2024-11-18 09:28:36',12,'Pending','2024-11-18 09:28:36','2024-11-18 09:28:36'),(7,7,12,'2024-11-18 09:30:01',18,'Declined','2024-11-18 09:30:01','2024-11-18 09:30:07'),(8,7,12,'2024-11-18 09:30:23',18,'Declined','2024-11-18 09:30:23','2024-11-18 14:04:13'),(9,11,12,'2024-11-18 14:10:09',18,'Matched','2024-11-18 14:10:09','2024-11-18 14:10:27'),(10,12,18,'2024-11-18 14:13:18',12,'Pending','2024-11-18 14:13:18','2024-11-18 14:13:18'),(11,12,12,'2024-11-18 14:13:29',18,'Declined','2024-11-18 14:13:29','2024-11-18 14:17:34'),(12,12,12,'2024-11-18 14:13:46',14,'Pending','2024-11-18 14:13:46','2024-11-18 14:13:46'),(13,13,18,'2024-11-18 14:18:31',12,'Pending','2024-11-18 14:18:31','2024-11-18 14:18:31'),(14,13,12,'2024-11-18 14:18:38',18,'Declined','2024-11-18 14:18:38','2024-11-18 14:20:01'),(15,14,12,'2024-11-18 14:20:55',18,'Matched','2024-11-18 14:20:55','2024-11-18 14:21:23'),(58,104,23,'2024-11-21 08:45:19',7,'Declined','2024-11-21 08:45:19','2024-11-21 08:47:59'),(70,125,12,'2024-11-24 10:35:53',4,'Matched','2024-11-24 10:35:53','2024-11-24 10:37:20');
/*!40000 ALTER TABLE `ride_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_histories`
--

DROP TABLE IF EXISTS `ride_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride_histories` (
  `ride_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `rider_id` bigint unsigned DEFAULT NULL,
  `ride_date` datetime NOT NULL,
  `ride_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dropoff_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fare` decimal(8,2) NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calculated_fare` decimal(8,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ride_id`),
  KEY `ride_histories_user_id_foreign` (`user_id`),
  KEY `ride_histories_rider_id_foreign` (`rider_id`),
  CONSTRAINT `ride_histories_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `ride_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_histories`
--

LOCK TABLES `ride_histories` WRITE;
/*!40000 ALTER TABLE `ride_histories` DISABLE KEYS */;
INSERT INTO `ride_histories` VALUES (1,14,NULL,'2024-11-17 07:38:16','Motor Taxi','Opol - Bulua Bus Station Diversion Road, Opol, Northern Mindanao, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',98.60,'7.86',98.60,'Canceled','2024-11-17 07:38:16','2024-11-17 07:38:42'),(2,12,NULL,'2024-11-18 08:38:38','Delivery','Barra, Opol, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',100.40,'8.04',100.40,'Canceled','2024-11-18 08:38:38','2024-11-18 08:50:26'),(3,3,NULL,'2024-11-18 08:50:13','Motor Taxi','Pathway Building 14., Cagayan de Oro, Northern Mindanao, Philippines','null, null, Northern Mindanao, Philippines',107.20,'8.72',107.20,'Canceled','2024-11-18 08:50:13','2024-11-19 08:19:12'),(4,3,4,'2024-11-18 08:55:08','Motor Taxi','Pathway Building 14., Cagayan de Oro, Northern Mindanao, Philippines','null, null, Northern Mindanao, Philippines',107.20,'8.72',107.20,'Completed','2024-11-18 08:55:08','2024-11-18 09:22:46'),(5,15,NULL,'2024-11-18 08:56:26','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'0.00',40.00,'Canceled','2024-11-18 08:56:26','2024-11-18 09:26:50'),(6,12,NULL,'2024-11-18 09:25:45','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Butuan - Cagayan de Oro - Iligan Road, Cagayan de Oro, Northern Mindanao, Philippines',77.20,'5.72',77.20,'Canceled','2024-11-18 09:25:45','2024-11-18 09:26:23'),(7,12,NULL,'2024-11-18 09:27:20','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Claro M. Recto Avenue, Cagayan de Oro, Northern Mindanao, Philippines',56.70,'3.67',56.70,'Canceled','2024-11-18 09:27:20','2024-11-18 10:19:22'),(8,15,NULL,'2024-11-18 09:27:54','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',43.90,'2.39',43.90,'Canceled','2024-11-18 09:27:54','2024-11-19 16:49:47'),(9,12,NULL,'2024-11-18 10:43:31','Delivery','null, Cagayan de Oro, Northern Mindanao, Philippines','Puntod, Cagayan de Oro, Misamis Oriental, Philippines',40.00,'1.95',40.00,'Canceled','2024-11-18 10:43:31','2024-11-18 10:44:48'),(10,8,NULL,'2024-11-18 10:48:19','Motor Taxi','Balulang Barangay Hall, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',102.80,'8.28',102.80,'Canceled','2024-11-18 10:48:19','2024-11-18 10:49:56'),(11,12,18,'2024-11-18 14:09:42','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Gumamela Extension, Cagayan de Oro, Northern Mindanao, Philippines',50.00,'3.00',50.00,'Completed','2024-11-18 14:09:42','2024-11-18 14:11:37'),(12,12,NULL,'2024-11-18 14:12:12','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',51.90,'3.19',51.90,'Canceled','2024-11-18 14:12:12','2024-11-18 14:17:40'),(13,12,NULL,'2024-11-18 14:18:09','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Ipil Street, Cagayan de Oro, Northern Mindanao, Philippines',51.00,'3.10',51.00,'Canceled','2024-11-18 14:18:09','2024-11-18 14:20:02'),(14,12,18,'2024-11-18 14:20:27','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','R.G. Escobido Street, Cagayan de Oro, Northern Mindanao, Philippines',90.30,'7.03',90.30,'Completed','2024-11-18 14:20:27','2024-11-18 15:27:03'),(15,12,4,'2024-11-19 00:04:09','Moto Taxi','Balulang Barangay Hall, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',102.80,'8.28',102.80,'Completed','2024-11-19 00:04:09','2024-11-19 03:39:09'),(16,12,4,'2024-11-19 03:40:02','Moto Taxi','Gusa, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',63.50,'4.35',63.50,'Completed','2024-11-19 03:40:02','2024-11-19 03:49:17'),(17,12,18,'2024-11-19 03:49:40','Moto Taxi','Balulang, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',117.40,'9.74',117.40,'Completed','2024-11-19 03:49:40','2024-11-19 03:59:05'),(18,12,18,'2024-11-19 04:08:43','Delivery','Balulang, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',117.40,'9.74',117.40,'Completed','2024-11-19 04:08:43','2024-11-19 04:18:35'),(19,12,4,'2024-11-19 06:46:48','Moto Taxi','Balulang, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',117.40,'9.74',117.40,'Completed','2024-11-19 06:46:48','2024-11-19 08:21:41'),(20,12,4,'2024-11-19 08:23:55','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Barra, Opol, Misamis Oriental, Philippines',96.40,'7.64',96.40,'Completed','2024-11-19 08:23:55','2024-11-19 08:58:24'),(21,12,NULL,'2024-11-19 09:00:48','Motor Taxi','Seacoast Community Access Road, Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'1.42',40.00,'Canceled','2024-11-19 09:00:48','2024-11-19 09:11:24'),(22,12,NULL,'2024-11-19 10:37:54','Motor Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Claro M. Recto Avenue, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'1.06',40.00,'Canceled','2024-11-19 10:37:54','2024-11-19 10:39:47'),(23,12,NULL,'2024-11-19 15:39:22','Moto Taxi','Barra, Opol, Misamis Oriental, Philippines','Bulua, Cagayan de Oro, Misamis Oriental, Philippines',43.72,'2.31',43.10,'Canceled','2024-11-19 15:39:22','2024-11-19 16:08:53'),(24,12,4,'2024-11-19 16:23:00','Moto Taxi','Balulang Barangay Hall, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',102.80,'8.28',102.80,'Completed','2024-11-19 16:23:00','2024-11-19 16:36:59'),(25,19,7,'2024-11-19 16:24:48','Moto Taxi','Barra, Opol, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',112.48,'8.04',100.40,'Completed','2024-11-19 16:24:48','2024-11-19 18:04:51'),(26,12,4,'2024-11-19 16:38:23','Moto Taxi','MACANHAN CARMEN, Cagayan de Oro, Misamis Oriental, Philippines','Limketkai Drive, Cagayan de Oro, Misamis Oriental, Philippines',62.20,'4.22',62.20,'Completed','2024-11-19 16:38:23','2024-11-19 16:41:34'),(27,12,4,'2024-11-19 16:43:56','Moto Taxi','Macahambus Cave, Cagayan de Oro, Misamis Oriental, Philippines','Capitol University, Corrales Extension, Cagayan de Oro, Misamis Oriental, Philippines',174.00,'15.40',174.00,'Completed','2024-11-19 16:43:56','2024-11-19 16:51:47'),(28,19,7,'2024-11-19 18:07:37','Moto Taxi','Barra, Opol, Misamis Oriental, Philippines','Bulua LTO, LTO, Butuan - Cagayan de Oro - Iligan Road, Cagayan de Oro, Misamis Oriental, Philippines',54.40,'3.20',52.00,'Completed','2024-11-19 18:07:37','2024-11-19 19:21:46'),(29,19,NULL,'2024-11-19 19:29:19','Moto Taxi','Barra, Opol, Misamis Oriental, Philippines','Igpit, Opol, Misamis Oriental, Philippines',68.80,'4.40',64.00,'Canceled','2024-11-19 19:29:19','2024-11-19 19:30:46'),(30,19,NULL,'2024-11-19 19:43:22','Delivery','MARK JUNDY, Misamis Oriental, Philippines','Bulua, Cagayan de Oro, Misamis Oriental, Philippines',40.00,'1.93',40.00,'Canceled','2024-11-19 19:43:22','2024-11-19 20:19:09'),(31,19,NULL,'2024-11-19 21:48:11','Moto Taxi','Barra Macabalan, Cagayan de Oro, Misamis Oriental, Philippines','Bulua, Cagayan de Oro, Misamis Oriental, Philippines',97.36,'6.78',87.80,'Canceled','2024-11-19 21:48:11','2024-11-19 21:49:35'),(32,19,NULL,'2024-11-19 21:51:06','Delivery','Cassiopeia Cafe, Cagayan de Oro, Misamis Oriental, Philippines','Igpit, Opol, Misamis Oriental, Philippines',48.40,'2.70',47.00,'Canceled','2024-11-19 21:51:06','2024-11-19 22:12:32'),(33,12,4,'2024-11-19 22:57:17','Moto Taxi','Balulang Rd, Cagayan de Oro, Northern Mindanao, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',90.00,'7.00',90.00,'Completed','2024-11-19 22:57:17','2024-11-20 01:05:50'),(34,12,NULL,'2024-11-20 01:06:17','Moto Taxi','Balongis, Balulang Road, Cagayan de Oro, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',79.60,'5.30',73.00,'Canceled','2024-11-20 01:06:17','2024-11-20 01:07:43'),(35,19,4,'2024-11-20 04:21:49','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Barra, Opol, Misamis Oriental, Philippines',110.20,'7.85',98.50,'Completed','2024-11-20 04:21:49','2024-11-20 04:24:34'),(36,19,4,'2024-11-20 04:25:38','Moto Taxi','SM CDO Downtown Premier, Claro M. Recto Avenue, Cagayan de Oro, Misamis Oriental, Philippines','Barra, Opol, Misamis Oriental, Philippines',109.60,'7.80',98.00,'Completed','2024-11-20 04:25:38','2024-11-20 08:22:45'),(37,12,4,'2024-11-20 04:40:04','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Barra, Opol, Misamis Oriental, Philippines',110.20,'7.85',98.50,'Completed','2024-11-20 04:40:04','2024-11-20 04:46:24'),(38,12,NULL,'2024-11-20 05:18:49','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Opol Beach, Opol, Philippines',145.60,'10.80',128.00,'Canceled','2024-11-20 05:18:49','2024-11-20 05:24:48'),(39,12,4,'2024-11-20 05:19:20','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Opol Beach, Opol, Philippines',145.60,'10.80',128.00,'Completed','2024-11-20 05:19:20','2024-11-20 05:24:30'),(40,7,NULL,'2024-11-20 05:22:02','Delivery','null, Cagayan de Oro, Northern Mindanao, Philippines','Barra, Opol, Misamis Oriental, Philippines',110.20,'7.85',98.50,'Canceled','2024-11-20 05:22:02','2024-11-20 05:23:09'),(41,12,7,'2024-11-20 05:26:04','Delivery','Balulang, Cagayan de Oro, Misamis Oriental, Philippines','Cogon Public Market, Cagayan de Oro, Misamis Oriental, Philippines',109.72,'7.81',98.10,'Completed','2024-11-20 05:26:04','2024-11-20 05:29:14'),(42,12,NULL,'2024-11-20 05:39:05','Pakyaw','Gusa, Cagayan de Oro, Misamis Oriental, Philippines','Opol Beach, Opol, Philippines',197.44,'15.12',171.20,'Available','2024-11-20 05:39:05','2024-11-20 05:39:05'),(43,12,NULL,'2024-11-20 05:56:39','Pakyaw','Gusa, Cagayan de Oro, Misamis Oriental, Philippines','Opol Beach, Opol, Philippines',197.44,'15.12',171.20,'Available','2024-11-20 05:56:39','2024-11-20 05:56:39'),(44,12,NULL,'2024-11-20 07:22:04','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Opol Beach, Opol, Philippines',145.36,'10.78',127.80,'Canceled','2024-11-20 07:22:04','2024-11-20 08:56:26'),(45,7,NULL,'2024-11-20 08:06:02','Pakyaw','SM CDO Downtown Premier, Claro M. Recto Avenue, Cagayan de Oro, Misamis Oriental, Philippines','Barra, Opol, Misamis Oriental, Philippines',109.60,'7.80',98.00,'Scheduled','2024-11-20 08:06:02','2024-11-20 08:06:02'),(46,19,NULL,'2024-11-20 08:25:37','Delivery','null, Cagayan de Oro, Northern Mindanao, Philippines','Vamenta Boulevard, Cagayan de Oro, Northern Mindanao, Philippines',50.08,'2.84',48.40,'Canceled','2024-11-20 08:25:37','2024-11-20 08:26:17'),(47,7,3,'2024-11-20 08:48:10','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Carmen, Cagayan de Oro, Misamis Oriental, Philippines',63.04,'3.92',59.20,'Completed','2024-11-20 08:48:10','2024-11-20 23:28:29'),(48,12,3,'2024-11-20 08:57:53','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Bulua Integrated Bus Terminal, Cagayan de Oro, Misamis Oriental, Philippines',70.44,'5.37',73.70,'Completed','2024-11-20 08:57:53','2024-11-20 09:00:28'),(49,12,7,'2024-11-20 12:32:35','Moto Taxi','Capt. Vicente Roa Street, Lungsod ng Cagayan de Oro, Hilagang Mindanao, Philippines','Cagayan de Oro National Highway, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'1.43',40.00,'Canceled','2024-11-20 12:32:35','2024-11-20 12:35:09'),(50,12,NULL,'2024-11-20 12:33:24','Moto Taxi','Capt. Vicente Roa Street, Lungsod ng Cagayan de Oro, Hilagang Mindanao, Philippines','Cagayan de Oro National Highway, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'1.43',40.00,'Canceled','2024-11-20 12:33:24','2024-11-20 12:33:38'),(51,12,NULL,'2024-11-20 12:35:37','Moto Taxi','Capt. Vicente Roa Street, Lungsod ng Cagayan de Oro, Hilagang Mindanao, Philippines','Saarenas Avenue, Cagayan de Oro, Northern Mindanao, Philippines',69.40,'4.45',64.50,'Canceled','2024-11-20 12:35:37','2024-11-20 12:39:37'),(52,12,3,'2024-11-20 14:23:59','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Macasandig, Cagayan de Oro, Misamis Oriental, Philippines',111.40,'7.95',99.50,'Completed','2024-11-20 14:23:59','2024-11-20 14:29:24'),(53,12,NULL,'2024-11-20 14:33:16','Pakyaw','MACANHAN CARMEN, Cagayan de Oro, Misamis Oriental, Philippines','Iponan, Misamis Oriental, Philippines',120.64,'8.72',107.20,'Available','2024-11-20 14:33:16','2024-11-20 14:33:16'),(54,12,NULL,'2024-11-20 14:33:37','Pakyaw','MACANHAN CARMEN, Cagayan de Oro, Misamis Oriental, Philippines','Iponan, Misamis Oriental, Philippines',120.64,'8.72',107.20,'Available','2024-11-20 14:33:37','2024-11-20 14:33:37'),(55,12,3,'2024-11-20 14:34:29','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','ZAYAS RESIDENCE, Cagayan de Oro, Misamis Oriental, Philippines',143.80,'10.65',126.50,'Completed','2024-11-20 14:34:29','2024-11-20 14:38:14'),(56,12,3,'2024-11-20 15:39:49','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'1.10',40.00,'Completed','2024-11-20 15:39:49','2024-11-20 15:43:05'),(57,12,4,'2024-11-20 15:44:17','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Cogon Public Market, Cagayan de Oro, Misamis Oriental, Philippines',76.60,'5.05',70.50,'Completed','2024-11-20 15:44:17','2024-11-20 15:47:05'),(58,12,4,'2024-11-20 16:00:08','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Carmen, Cagayan de Oro, Misamis Oriental, Philippines',60.88,'3.74',57.40,'Completed','2024-11-20 16:00:08','2024-11-20 16:21:03'),(59,12,4,'2024-11-20 16:23:21','Delivery','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','MACANHAN CARMEN, Cagayan de Oro, Misamis Oriental, Philippines',47.92,'2.66',46.60,'Completed','2024-11-20 16:23:21','2024-11-20 16:35:10'),(60,12,NULL,'2024-11-20 17:03:24','Pakyaw','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Gusa, Cagayan de Oro, Misamis Oriental, Philippines',122.92,'8.91',109.10,'Scheduled','2024-11-20 17:03:24','2024-11-20 17:03:24'),(61,12,NULL,'2024-11-20 17:03:59','Pakyaw','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Gusa, Cagayan de Oro, Misamis Oriental, Philippines',122.92,'8.91',109.10,'Available','2024-11-20 17:03:59','2024-11-20 17:03:59'),(62,12,NULL,'2024-11-20 17:15:43','Pakyaw','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','SM CDO Downtown Premier, Claro M. Recto Avenue, Cagayan de Oro, Misamis Oriental, Philippines',93.88,'6.49',84.90,'Scheduled','2024-11-20 17:15:43','2024-11-20 17:15:43'),(63,12,NULL,'2024-11-20 17:17:29','Pakyaw','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','SM CDO Downtown Premier, Claro M. Recto Avenue, Cagayan de Oro, Misamis Oriental, Philippines',93.88,'6.49',84.90,'Scheduled','2024-11-20 17:17:29','2024-11-20 17:17:29'),(64,12,NULL,'2024-11-20 17:25:55','Pakyaw','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Bulua, Cagayan de Oro, Misamis Oriental, Philippines',113.56,'8.13',101.30,'Available','2024-11-20 17:25:55','2024-11-20 17:25:55'),(65,12,4,'2024-11-20 17:32:48','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Cogon Public Market, Cagayan de Oro, Misamis Oriental, Philippines',76.72,'5.06',70.60,'Completed','2024-11-20 17:32:48','2024-11-20 17:35:40'),(66,12,7,'2024-11-20 23:20:54','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Castro Street, Cagayan de Oro, Northern Mindanao, Philippines',58.00,'3.50',55.00,'Completed','2024-11-20 23:20:54','2024-11-20 23:25:40'),(67,12,NULL,'2024-11-20 23:27:36','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Concordio Diel Street, Cagayan de Oro, Northern Mindanao, Philippines',500.04,'3.17',51.70,'Available','2024-11-20 23:27:36','2024-11-20 23:27:36'),(68,12,NULL,'2024-11-20 23:27:49','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Concordio Diel Street, Cagayan de Oro, Northern Mindanao, Philippines',500.04,'3.17',51.70,'Available','2024-11-20 23:27:49','2024-11-20 23:27:49'),(69,12,NULL,'2024-11-20 23:28:01','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Concordio Diel Street, Cagayan de Oro, Northern Mindanao, Philippines',50.04,'3.17',51.70,'Available','2024-11-20 23:28:01','2024-11-20 23:28:01'),(70,12,NULL,'2024-11-20 23:28:13','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Concordio Diel Street, Cagayan de Oro, Northern Mindanao, Philippines',50.04,'3.17',51.70,'Available','2024-11-20 23:28:13','2024-11-20 23:28:13'),(71,12,NULL,'2024-11-20 23:28:19','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Concordio Diel Street, Cagayan de Oro, Northern Mindanao, Philippines',50.04,'3.17',51.70,'Available','2024-11-20 23:28:19','2024-11-20 23:28:19'),(72,12,7,'2024-11-20 23:29:06','Delivery','null, Cagayan de Oro, Northern Mindanao, Philippines','Julio Pacana Street, Cagayan de Oro, Northern Mindanao, Philippines',88.72,'6.06',80.60,'Completed','2024-11-20 23:29:06','2024-11-20 23:33:34'),(73,8,NULL,'2024-11-20 23:35:23','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Bukidnon, Philippines',1414.36,'116.53',1185.30,'Available','2024-11-20 23:35:23','2024-11-20 23:35:23'),(74,10,NULL,'2024-11-21 01:00:07','Pakyaw','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',123.04,'8.92',109.20,'Available','2024-11-21 01:00:07','2024-11-21 01:00:07'),(75,12,NULL,'2024-11-21 06:40:45','Pakyaw','Pathway Building 14., Cagayan de Oro, Northern Mindanao, Philippines','Cogon Public Market, Cagayan de Oro, Misamis Oriental, Philippines',40.00,'1.81',40.00,'Available','2024-11-21 06:40:45','2024-11-21 06:40:45'),(76,3,NULL,'2024-11-21 06:45:06','Pakyaw','Pathway Building 14., Cagayan de Oro, Northern Mindanao, Philippines','Claveria, Misamis Oriental, Philippines',810.52,'66.21',810.52,'Available','2024-11-21 06:45:06','2024-11-21 06:45:06'),(77,3,NULL,'2024-11-21 06:59:20','Delivery','Pathway Building 14., Cagayan de Oro, Northern Mindanao, Philippines','Butuan - Cagayan de Oro - Iligan Road, Cagayan de Oro, Northern Mindanao, Philippines',42.16,'2.18',42.16,'Canceled','2024-11-21 06:59:20','2024-11-21 07:41:34'),(78,3,NULL,'2024-11-21 07:01:06','Moto Taxi','Pathway Building 14., Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',47.20,'2.60',47.20,'Canceled','2024-11-21 07:01:06','2024-11-21 07:41:12'),(79,12,NULL,'2024-11-21 07:03:38','Delivery','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Barra, Opol, Misamis Oriental, Philippines',110.20,'7.85',110.20,'Canceled','2024-11-21 07:03:38','2024-11-21 07:06:23'),(80,12,7,'2024-11-21 07:06:46','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Balulang, Cagayan de Oro, Misamis Oriental, Philippines',128.32,'9.36',128.32,'Completed','2024-11-21 07:06:46','2024-11-21 07:08:52'),(81,12,7,'2024-11-21 07:09:10','Delivery','null, Cagayan de Oro, Northern Mindanao, Philippines','Balulang, Cagayan de Oro, Misamis Oriental, Philippines',128.32,'9.36',128.32,'Canceled','2024-11-21 07:09:10','2024-11-21 07:16:25'),(82,8,3,'2024-11-21 07:24:57','Moto Taxi','Gaisano City Mall, Claro M. Recto Avenue, Cagayan de Oro, Misamis Oriental, Philippines','Barra, Opol, Misamis Oriental, Philippines',98.56,'6.88',98.56,'Completed','2024-11-21 07:24:57','2024-11-21 07:27:47'),(83,8,NULL,'2024-11-21 07:29:48','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Dangcagan, Bukidnon, Philippines',1926.64,'159.22',1926.64,'Available','2024-11-21 07:29:48','2024-11-21 07:29:48'),(84,12,3,'2024-11-21 07:33:38','Delivery','null, Cagayan de Oro, Northern Mindanao, Philippines','Balulang, Cagayan de Oro, Misamis Oriental, Philippines',128.32,'9.36',128.32,'Completed','2024-11-21 07:33:38','2024-11-21 07:40:47'),(85,3,NULL,'2024-11-21 07:42:24','Pakyaw','Gaisano City Mall, Claro M. Recto Avenue, Cagayan de Oro, Misamis Oriental, Philippines','Barra, Opol, Misamis Oriental, Philippines',98.56,'6.88',98.56,'Available','2024-11-21 07:42:24','2024-11-21 07:42:24'),(86,7,NULL,'2024-11-21 07:45:59','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Marawi City, Lanao del Sur, Philippines',1492.48,'123.04',1492.48,'Available','2024-11-21 07:45:59','2024-11-21 07:45:59'),(87,7,NULL,'2024-11-21 07:46:48','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Marawi City, Lanao del Sur, Philippines',1492.48,'123.04',1492.48,'Available','2024-11-21 07:46:48','2024-11-21 07:46:48'),(88,7,NULL,'2024-11-21 07:50:12','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Barra Macabalan, Cagayan de Oro, Misamis Oriental, Philippines',111.88,'7.99',111.88,'Available','2024-11-21 07:50:12','2024-11-21 07:50:12'),(89,7,NULL,'2024-11-21 07:54:52','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Barra Macabalan, Cagayan de Oro, Misamis Oriental, Philippines',111.88,'7.99',111.88,'Available','2024-11-21 07:54:52','2024-11-21 07:54:52'),(90,7,NULL,'2024-11-21 07:56:18','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Barra Macabalan, Cagayan de Oro, Misamis Oriental, Philippines',111.88,'7.99',111.88,'Available','2024-11-21 07:56:18','2024-11-21 07:56:18'),(91,7,NULL,'2024-11-21 07:58:26','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Barra Macabalan, Cagayan de Oro, Misamis Oriental, Philippines',111.88,'7.99',111.88,'Canceled','2024-11-21 07:58:26','2024-11-21 08:18:31'),(92,7,NULL,'2024-11-21 08:01:33','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Marawi City, Lanao del Sur, Philippines',1492.48,'123.04',1492.48,'Canceled','2024-11-21 08:01:33','2024-11-21 08:15:33'),(93,7,NULL,'2024-11-21 08:03:58','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Marawi City, Lanao del Sur, Philippines',1492.48,'123.04',1492.48,'Canceled','2024-11-21 08:03:58','2024-11-21 08:06:55'),(94,7,NULL,'2024-11-21 08:19:07','Motor Taxi','Barra, Opol, Misamis Oriental, Philippines','Bulua, Cagayan de Oro, Misamis Oriental, Philippines',43.10,'2.31',43.72,'Canceled','2024-11-21 08:19:07','2024-11-21 08:23:50'),(95,23,NULL,'2024-11-21 08:19:12','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Lapasan National Highway, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'0.98',40.00,'Available','2024-11-21 08:19:12','2024-11-21 08:19:12'),(96,23,NULL,'2024-11-21 08:21:12','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Lapasan National Highway, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'0.98',40.00,'Available','2024-11-21 08:21:12','2024-11-21 08:21:12'),(97,23,NULL,'2024-11-21 08:22:26','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Lapasan National Highway, Cagayan de Oro, Northern Mindanao, Philippines',40.00,'0.98',40.00,'Canceled','2024-11-21 08:22:26','2024-11-21 08:33:53'),(98,23,NULL,'2024-11-21 08:23:44','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Lapasan, Cagayan de Oro, Misamis Oriental, Philippines',42.64,'2.22',42.64,'Canceled','2024-11-21 08:23:44','2024-11-21 08:33:35'),(99,23,NULL,'2024-11-21 08:24:22','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Lapasan, Cagayan de Oro, Misamis Oriental, Philippines',42.64,'2.22',42.64,'Canceled','2024-11-21 08:24:22','2024-11-21 08:33:18'),(100,23,NULL,'2024-11-21 08:34:56','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Saint Francis Street, Cagayan de Oro, Northern Mindanao, Philippines',68.56,'4.38',68.56,'Available','2024-11-21 08:34:56','2024-11-21 08:34:56'),(101,8,NULL,'2024-11-21 08:35:18','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Lapu-Lapu City, Cebu, Philippines',3777.52,'313.46',3777.52,'Canceled','2024-11-21 08:35:18','2024-11-21 08:41:41'),(102,8,7,'2024-11-21 08:35:50','Moto Taxi','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines','Lapu-Lapu City, Cebu, Philippines',3000.00,'313.46',3777.52,'Completed','2024-11-21 08:35:50','2024-11-21 08:41:03'),(103,23,NULL,'2024-11-21 08:38:07','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Saint Francis Street, Cagayan de Oro, Northern Mindanao, Philippines',68.56,'4.38',68.56,'Available','2024-11-21 08:38:07','2024-11-21 08:38:07'),(104,23,NULL,'2024-11-21 08:41:12','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Saint Francis Street, Cagayan de Oro, Northern Mindanao, Philippines',68.56,'4.38',68.56,'Available','2024-11-21 08:41:12','2024-11-21 08:41:12'),(105,7,NULL,'2024-11-21 08:51:20','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Davao City, Davao del Sur, Philippines',3529.36,'292.78',3529.36,'Canceled','2024-11-21 08:51:20','2024-11-21 08:54:46'),(106,7,3,'2024-11-21 09:02:01','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Gusa Elementary School, Gusa Old Road, Cagayan de Oro, Misamis Oriental, Philippines',60.28,'3.69',60.28,'Completed','2024-11-21 09:02:01','2024-11-21 09:06:29'),(107,19,NULL,'2024-11-21 11:01:54','Pakyaw','Barra, Opol, Misamis Oriental, Philippines','Dangcagan, Bukidnon, Philippines',1926.64,'159.22',1926.64,'Scheduled','2024-11-21 11:01:54','2024-11-21 11:01:54'),(108,25,21,'2024-11-22 03:19:52','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Ernesto Tamparong Street, Cagayan de Oro, Northern Mindanao, Philippines',62.08,'3.84',62.08,'Completed','2024-11-22 03:19:52','2024-11-22 03:24:07'),(109,3,NULL,'2024-11-23 00:00:39','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Villarin Street, Cagayan de Oro, Northern Mindanao, Philippines',54.64,'3.22',54.64,'Canceled','2024-11-23 00:00:39','2024-11-23 00:00:56'),(110,3,NULL,'2024-11-23 00:31:16','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines',41.44,'2.12',41.44,'Canceled','2024-11-23 00:31:16','2024-11-23 00:31:34'),(111,18,NULL,'2024-11-23 00:59:58','Pakyaw','Osmena Street, Cagayan de Oro, Northern Mindanao, Philippines','Davao International Airport, Buhangin, Davao City, Davao del Sur, Philippines',1500.00,'298.08',3592.96,'Canceled','2024-11-23 00:59:58','2024-11-23 01:00:11'),(112,7,NULL,'2024-11-23 01:02:44','Moto Taxi','Barra, Opol, Misamis Oriental, Philippines','Bulua, Cagayan de Oro, Misamis Oriental, Philippines',43.72,'2.31',43.72,'Canceled','2024-11-23 01:02:44','2024-11-23 01:09:51'),(113,18,NULL,'2024-11-23 01:21:49','Pakyaw','Osmena Street, Cagayan de Oro, Northern Mindanao, Philippines','Davao International Airport, Buhangin, Davao City, Davao del Sur, Philippines',1506.00,'298.08',3592.96,'Canceled','2024-11-23 01:21:49','2024-11-23 01:22:02'),(114,18,7,'2024-11-23 01:27:30','Moto Taxi','Osmena Street, Cagayan de Oro, Northern Mindanao, Philippines','Corrales Extension, Cagayan de Oro, Northern Mindanao, Philippines',60.00,'4.82',73.84,'Completed','2024-11-23 01:27:30','2024-11-23 01:33:40'),(115,12,7,'2024-11-23 01:34:33','Delivery','Osmena Street, Cagayan de Oro, Northern Mindanao, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',80.00,'5.76',85.12,'Completed','2024-11-23 01:34:33','2024-11-23 01:37:02'),(116,12,7,'2024-11-23 01:37:55','Pakyaw','Osmena Street, Cagayan de Oro, Northern Mindanao, Philippines','Davao International Airport, Buhangin, Davao City, Davao del Sur, Philippines',2500.00,'298.08',3592.96,'Completed','2024-11-23 01:37:55','2024-11-23 01:40:13'),(117,12,18,'2024-11-23 01:52:05','Moto Taxi','null, Cagayan de Oro, Northern Mindanao, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',93.28,'6.44',93.28,'Completed','2024-11-23 01:52:05','2024-11-23 01:53:27'),(118,12,18,'2024-11-23 01:54:21','Delivery','null, Cagayan de Oro, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',94.60,'6.55',94.60,'Completed','2024-11-23 01:54:21','2024-11-23 01:55:37'),(119,12,18,'2024-11-23 01:56:55','Pakyaw','null, Cagayan de Oro, Northern Mindanao, Philippines','Butuan - Cagayan de Oro - Iligan Road, Opol, Northern Mindanao, Philippines',150.00,'3.84',62.08,'Completed','2024-11-23 01:56:55','2024-11-24 06:26:52'),(120,10,NULL,'2024-11-23 09:25:14','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Cogon Public Market, Cagayan de Oro, Misamis Oriental, Philippines',76.72,'5.06',76.72,'Canceled','2024-11-23 09:25:14','2024-11-23 10:09:16'),(121,10,NULL,'2024-11-23 10:10:04','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Xavier University - Ateneo de Cagayan, Corrales Avenue, Cagayan de Oro, Misamis Oriental, Philippines',71.08,'4.59',71.08,'Canceled','2024-11-23 10:10:04','2024-11-23 10:26:40'),(122,29,NULL,'2024-11-23 10:28:05','Moto Taxi','Butuan - Cagayan de Oro - Iligan Road, Initao, Northern Mindanao, Philippines','Cagayan de Oro, Misamis Oriental, Philippines',640.12,'52.01',640.12,'Canceled','2024-11-23 10:28:05','2024-11-23 10:28:46'),(123,10,NULL,'2024-11-23 10:28:46','Moto Taxi','Balulang Road, Cagayan de Oro, Northern Mindanao, Philippines','Cogon Public Market, Cagayan de Oro, Misamis Oriental, Philippines',76.72,'5.06',76.72,'Available','2024-11-23 10:28:46','2024-11-23 10:28:46'),(124,18,NULL,'2024-11-23 13:44:38','Moto Taxi','Opol - Bulua Bus Station Diversion Road, Opol, Northern Mindanao, Philippines','null, Cagayan de Oro, Northern Mindanao, Philippines',82.00,'5.50',82.00,'Available','2024-11-23 13:44:38','2024-11-23 13:44:38'),(125,12,4,'2024-11-24 10:34:13','Moto Taxi','Barra, Opol, Misamis Oriental, Philippines','USTP Science Complex Building, Cagayan de Oro, Misamis Oriental, Philippines',112.48,'8.04',112.48,'Booked','2024-11-24 10:34:13','2024-11-24 10:37:20');
/*!40000 ALTER TABLE `ride_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_locations`
--

DROP TABLE IF EXISTS `ride_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ride_id` bigint unsigned NOT NULL,
  `customer_latitude` decimal(10,8) NOT NULL,
  `customer_longitude` decimal(11,8) NOT NULL,
  `dropoff_latitude` decimal(11,8) NOT NULL,
  `dropoff_longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ride_locations_ride_id_foreign` (`ride_id`),
  CONSTRAINT `ride_locations_ride_id_foreign` FOREIGN KEY (`ride_id`) REFERENCES `ride_histories` (`ride_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_locations`
--

LOCK TABLES `ride_locations` WRITE;
/*!40000 ALTER TABLE `ride_locations` DISABLE KEYS */;
INSERT INTO `ride_locations` VALUES (1,1,8.51650701,124.60835986,8.48564140,124.65602840,'2024-11-17 07:38:21','2024-11-17 07:38:21'),(2,2,8.51359810,124.60543450,8.48564140,124.65602840,'2024-11-18 08:38:45','2024-11-18 08:38:45'),(3,3,8.48633120,124.65698260,8.49654642,124.39427398,'2024-11-18 08:50:19','2024-11-18 08:50:19'),(4,4,8.48633120,124.65698260,8.49654642,124.39427398,'2024-11-18 08:55:14','2024-11-18 08:55:14'),(5,5,8.48632170,124.65723410,8.48631480,124.65722100,'2024-11-18 08:56:32','2024-11-18 08:56:32'),(6,6,8.48628340,124.65725910,8.50442673,124.61567793,'2024-11-18 09:25:50','2024-11-18 09:25:50'),(7,7,8.48628340,124.65725910,8.47439249,124.68199890,'2024-11-18 09:27:26','2024-11-18 09:27:26'),(8,8,8.48662430,124.65564210,8.48452520,124.66558110,'2024-11-18 09:28:00','2024-11-18 09:28:00'),(9,9,8.48634780,124.65714580,8.49559960,124.65661560,'2024-11-18 10:43:37','2024-11-18 10:43:37'),(10,10,8.44652380,124.63704400,8.48564140,124.65602840,'2024-11-18 10:48:25','2024-11-18 10:48:25'),(11,11,8.45709060,124.63080590,8.47598192,124.63549376,'2024-11-18 14:09:47','2024-11-18 14:09:47'),(12,12,8.45709060,124.63080590,8.47142750,124.64305457,'2024-11-18 14:12:18','2024-11-18 14:12:18'),(13,13,8.45709060,124.63080590,8.47868324,124.63730089,'2024-11-18 14:18:14','2024-11-18 14:18:14'),(14,14,8.45709060,124.63080590,8.49701994,124.65607334,'2024-11-18 14:20:32','2024-11-18 14:20:32'),(15,15,8.44652380,124.63704400,8.48564140,124.65602840,'2024-11-19 00:04:15','2024-11-19 00:04:15'),(16,16,8.46847660,124.68288610,8.48564140,124.65602840,'2024-11-19 03:40:29','2024-11-19 03:40:29'),(17,17,8.44141730,124.62757060,8.48564140,124.65602840,'2024-11-19 03:49:45','2024-11-19 03:49:45'),(18,18,8.44141730,124.62757060,8.48564140,124.65602840,'2024-11-19 04:08:50','2024-11-19 04:08:50'),(19,19,8.44141730,124.62757060,8.48564140,124.65602840,'2024-11-19 06:46:54','2024-11-19 06:46:54'),(20,20,8.48484122,124.65657391,8.51359810,124.60543450,'2024-11-19 08:24:00','2024-11-19 08:24:00'),(21,21,8.48681295,124.66316611,8.48669390,124.65583330,'2024-11-19 09:00:54','2024-11-19 09:00:54'),(22,22,8.48634030,124.65713730,8.48368889,124.66064785,'2024-11-19 10:37:59','2024-11-19 10:37:59'),(23,23,8.51359810,124.60543450,8.50781380,124.61650330,'2024-11-19 15:39:28','2024-11-19 15:39:28'),(24,24,8.44652380,124.63704400,8.48564140,124.65602840,'2024-11-19 16:23:06','2024-11-19 16:23:06'),(25,25,8.51359810,124.60543450,8.48564140,124.65602840,'2024-11-19 16:24:53','2024-11-19 16:24:53'),(26,26,8.47107170,124.63618770,8.47996320,124.65634000,'2024-11-19 16:38:29','2024-11-19 16:38:29'),(27,27,8.37881880,124.60983750,8.48858700,124.65194770,'2024-11-19 16:44:01','2024-11-19 16:44:01'),(28,28,8.51359810,124.60543450,8.50582340,124.60841800,'2024-11-19 18:07:43','2024-11-19 18:07:43'),(29,29,8.51359810,124.60543450,8.51060790,124.58882870,'2024-11-19 19:29:24','2024-11-19 19:29:24'),(30,30,8.50357040,124.60255160,8.50781380,124.61650330,'2024-11-19 19:43:28','2024-11-19 19:43:28'),(31,31,8.50346180,124.65947300,8.50781380,124.61650330,'2024-11-19 21:48:17','2024-11-19 21:48:17'),(32,32,8.50409020,124.60866260,8.51060790,124.58882870,'2024-11-19 21:51:12','2024-11-19 21:51:12'),(33,33,8.45058045,124.63184245,8.48564140,124.65602840,'2024-11-19 22:57:26','2024-11-19 22:57:26'),(34,34,8.46535430,124.63224280,8.48564140,124.65602840,'2024-11-20 01:06:23','2024-11-20 01:06:23'),(35,35,8.48585720,124.65663510,8.51359810,124.60543450,'2024-11-20 04:21:55','2024-11-20 04:21:55'),(36,36,8.48432060,124.65491060,8.51359810,124.60543450,'2024-11-20 04:25:43','2024-11-20 04:25:43'),(37,37,8.48564140,124.65602840,8.51359810,124.60543450,'2024-11-20 04:40:10','2024-11-20 04:40:10'),(38,38,8.48586850,124.65661010,8.51857630,124.58069770,'2024-11-20 05:18:56','2024-11-20 05:18:56'),(39,39,8.48586850,124.65661010,8.51857630,124.58069770,'2024-11-20 05:19:25','2024-11-20 05:19:25'),(40,40,8.48586910,124.65664630,8.51359810,124.60543450,'2024-11-20 05:22:08','2024-11-20 05:22:08'),(41,41,8.44141730,124.62757060,8.47734250,124.65155750,'2024-11-20 05:26:10','2024-11-20 05:26:10'),(42,44,8.48595950,124.65657420,8.51857630,124.58069770,'2024-11-20 07:22:10','2024-11-20 07:22:10'),(43,46,8.48591200,124.65660210,8.48271164,124.63849749,'2024-11-20 08:25:43','2024-11-20 08:25:43'),(44,47,8.48468570,124.65656217,8.47815380,124.63310370,'2024-11-20 08:48:15','2024-11-20 08:48:15'),(45,48,8.48468305,124.65652060,8.51207640,124.62349820,'2024-11-20 08:57:58','2024-11-20 08:57:58'),(46,49,8.48975129,124.63694584,8.49015816,124.63546023,'2024-11-20 12:32:40','2024-11-20 12:32:40'),(47,50,8.48975129,124.63694584,8.49015816,124.63546023,'2024-11-20 12:33:30','2024-11-20 12:33:30'),(48,51,8.48465800,124.65196800,8.50422313,124.62556355,'2024-11-20 12:35:43','2024-11-20 12:35:43'),(49,52,8.45073350,124.63183690,8.43714540,124.64693500,'2024-11-20 14:24:05','2024-11-20 14:24:05'),(50,55,8.45073350,124.63183690,8.48881540,124.59881720,'2024-11-20 14:34:35','2024-11-20 14:34:35'),(51,56,8.45705260,124.63079890,8.46448701,124.63179667,'2024-11-20 15:39:55','2024-11-20 15:39:55'),(52,57,8.45075400,124.63179290,8.47734250,124.65155750,'2024-11-20 15:44:23','2024-11-20 15:44:23'),(53,58,8.45076500,124.63178010,8.47815380,124.63310370,'2024-11-20 16:00:16','2024-11-20 16:00:16'),(54,59,8.45073500,124.63183600,8.47107170,124.63618770,'2024-11-20 16:23:28','2024-11-20 16:23:28'),(55,65,8.45072400,124.63180480,8.47734250,124.65155750,'2024-11-20 17:32:53','2024-11-20 17:32:53'),(56,66,8.45705320,124.63079300,8.47953250,124.63418383,'2024-11-20 23:21:00','2024-11-20 23:21:00'),(57,72,8.45705320,124.63079300,8.49507711,124.65226997,'2024-11-20 23:29:12','2024-11-20 23:29:12'),(58,77,8.48633980,124.65699680,8.48896539,124.63973332,'2024-11-21 06:59:27','2024-11-21 06:59:27'),(59,78,8.48629870,124.65699380,8.49800445,124.65980262,'2024-11-21 07:01:13','2024-11-21 07:01:13'),(60,79,8.48564140,124.65602840,8.51359810,124.60543450,'2024-11-21 07:03:44','2024-11-21 07:03:44'),(61,80,8.48629930,124.65705520,8.44141730,124.62757060,'2024-11-21 07:06:51','2024-11-21 07:06:51'),(62,81,8.48629930,124.65705520,8.44141730,124.62757060,'2024-11-21 07:09:17','2024-11-21 07:09:17'),(63,82,8.48625890,124.64981100,8.51359810,124.60543450,'2024-11-21 07:25:03','2024-11-21 07:25:03'),(64,84,8.48634890,124.65714560,8.44141730,124.62757060,'2024-11-21 07:33:45','2024-11-21 07:33:45'),(65,91,8.51359810,124.60543450,8.50346180,124.65947300,'2024-11-21 07:58:32','2024-11-21 07:58:32'),(66,92,8.51359810,124.60543450,8.01062130,124.29771800,'2024-11-21 08:01:39','2024-11-21 08:01:39'),(67,93,8.51359810,124.60543450,8.01062130,124.29771800,'2024-11-21 08:04:04','2024-11-21 08:04:04'),(68,94,8.51359810,124.60543450,8.50781380,124.61650330,'2024-11-21 08:19:13','2024-11-21 08:19:13'),(69,95,8.48564140,124.65602840,8.48141637,124.65678178,'2024-11-21 08:19:18','2024-11-21 08:19:18'),(70,96,8.48564140,124.65602840,8.48141637,124.65678178,'2024-11-21 08:21:17','2024-11-21 08:21:17'),(71,97,8.48564140,124.65602840,8.48141637,124.65678178,'2024-11-21 08:22:32','2024-11-21 08:22:32'),(72,98,8.48564140,124.65602840,8.47947050,124.66629510,'2024-11-21 08:23:50','2024-11-21 08:23:50'),(73,99,8.48564140,124.65602840,8.47947050,124.66629510,'2024-11-21 08:24:28','2024-11-21 08:24:28'),(74,100,8.48635300,124.65713860,8.49989487,124.63036370,'2024-11-21 08:35:02','2024-11-21 08:35:02'),(75,101,8.48564140,124.65602840,10.31686460,123.96490950,'2024-11-21 08:35:24','2024-11-21 08:35:24'),(76,102,8.48564140,124.65602840,10.31686460,123.96490950,'2024-11-21 08:35:56','2024-11-21 08:35:56'),(77,103,8.48635300,124.65713860,8.49989487,124.63036370,'2024-11-21 08:38:13','2024-11-21 08:38:13'),(78,104,8.48635300,124.65713860,8.49989487,124.63036370,'2024-11-21 08:41:18','2024-11-21 08:41:18'),(79,105,8.51359810,124.60543450,7.07361140,125.61102480,'2024-11-21 08:51:26','2024-11-21 08:51:26'),(80,106,8.48635140,124.65713790,8.47622280,124.68271330,'2024-11-21 09:02:07','2024-11-21 09:02:07'),(81,107,8.51359810,124.60543450,7.60254580,125.01678660,'2024-11-21 11:02:00','2024-11-21 11:02:00'),(82,108,8.51266070,124.62655600,8.49030639,124.63772167,'2024-11-22 03:19:59','2024-11-22 03:19:59'),(83,109,8.45704900,124.63078140,8.47834931,124.62806907,'2024-11-23 00:00:45','2024-11-23 00:00:45'),(84,110,8.45703830,124.63079550,8.47258054,124.63544581,'2024-11-23 00:31:23','2024-11-23 00:31:23'),(85,111,8.50400010,124.61661620,7.13060190,125.64552950,'2024-11-23 01:00:04','2024-11-23 01:00:04'),(86,112,8.51359810,124.60543450,8.50781380,124.61650330,'2024-11-23 01:02:50','2024-11-23 01:02:50'),(87,113,8.50398480,124.61662150,7.13060190,125.64552950,'2024-11-23 01:21:55','2024-11-23 01:21:55'),(88,114,8.50398480,124.61662150,8.48719131,124.65044942,'2024-11-23 01:27:35','2024-11-23 01:27:35'),(89,115,8.50397370,124.61664950,8.48564140,124.65602840,'2024-11-23 01:34:39','2024-11-23 01:34:39'),(90,116,8.50397370,124.61664950,7.13060190,125.64552950,'2024-11-23 01:38:01','2024-11-23 01:38:01'),(91,117,8.45710870,124.63077880,8.48564140,124.65602840,'2024-11-23 01:52:10','2024-11-23 01:52:10'),(92,118,8.45710870,124.63077880,8.50391044,124.62622069,'2024-11-23 01:54:27','2024-11-23 01:54:27'),(93,119,8.53601033,124.56492048,8.51234235,124.58484560,'2024-11-23 01:57:01','2024-11-23 01:57:01'),(94,120,8.45069130,124.63172630,8.47734250,124.65155750,'2024-11-23 09:25:20','2024-11-23 09:25:20'),(95,121,8.45069130,124.63172630,8.47668590,124.64616230,'2024-11-23 10:10:10','2024-11-23 10:10:10'),(96,122,8.49278100,124.30205700,8.48027290,124.64976360,'2024-11-23 10:28:11','2024-11-23 10:28:11'),(97,123,8.45069130,124.63172630,8.47734250,124.65155750,'2024-11-23 10:28:52','2024-11-23 10:28:52'),(98,124,8.51320911,124.60022002,8.48469332,124.61149670,'2024-11-23 13:44:44','2024-11-23 13:44:44'),(99,125,8.51359810,124.60543450,8.48564140,124.65602840,'2024-11-24 10:34:18','2024-11-24 10:34:18');
/*!40000 ALTER TABLE `ride_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riders`
--

DROP TABLE IF EXISTS `riders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riders` (
  `rider_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `registration_date` date NOT NULL,
  `verification_status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_payment_date` date DEFAULT NULL,
  `rider_latitude` decimal(10,8) DEFAULT NULL,
  `rider_longitude` decimal(11,8) DEFAULT NULL,
  `availability` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rider_id`),
  KEY `riders_user_id_foreign` (`user_id`),
  CONSTRAINT `riders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riders`
--

LOCK TABLES `riders` WRITE;
/*!40000 ALTER TABLE `riders` DISABLE KEYS */;
INSERT INTO `riders` VALUES (1,3,'2024-11-16','Verified',NULL,8.50392180,124.60279530,'Available','2024-11-16 16:09:53','2024-11-24 17:45:44'),(2,4,'2024-11-16','Verified',NULL,8.50352900,124.60263040,'Available','2024-11-16 16:09:53','2024-11-25 02:43:59'),(3,5,'2024-11-16','Unverified',NULL,NULL,NULL,NULL,'2024-11-16 16:09:53','2024-11-16 16:09:53'),(4,6,'2024-11-16','Unverified',NULL,NULL,NULL,NULL,'2024-11-16 16:09:53','2024-11-16 16:09:53'),(5,7,'2024-11-16','Verified',NULL,37.42209360,-122.08392200,'Available','2024-11-16 16:09:53','2024-11-23 02:13:57'),(6,14,'2024-11-17','Verified',NULL,8.50398960,124.61662550,'Available','2024-11-17 07:36:18','2024-11-17 07:38:54'),(7,15,'2024-11-18','Unverified',NULL,8.48634910,124.65714190,'Available','2024-11-18 08:40:30','2024-11-21 08:13:45'),(8,17,'2024-11-18','Unverified',NULL,NULL,NULL,NULL,'2024-11-18 08:57:14','2024-11-18 08:57:14'),(9,18,'2024-11-18','Verified',NULL,8.50398420,124.61663040,'Available','2024-11-18 09:00:12','2024-11-23 13:45:29'),(10,21,'2024-11-20','Verified',NULL,8.46622820,124.65754010,'Available','2024-11-20 12:33:44','2024-11-22 14:09:20'),(11,24,'2024-11-21','Unverified',NULL,NULL,NULL,NULL,'2024-11-21 08:06:21','2024-11-21 08:06:21'),(12,28,'2024-11-23','Unverified',NULL,NULL,NULL,NULL,'2024-11-23 05:47:46','2024-11-23 05:47:46');
/*!40000 ALTER TABLE `riders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SuperAdmin','Super Administrator role','full_in_app_access','2024-11-16 16:09:49','2024-11-16 16:09:49'),(2,'Admin','Administrator role','full_in_app_access','2024-11-16 16:09:49','2024-11-16 16:09:49'),(3,'Rider','Rider role','limited_rider_access','2024-11-16 16:09:49','2024-11-16 16:09:49'),(4,'Customer','Customer role','limited_access','2024-11-16 16:09:49','2024-11-16 16:09:49');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Superadmin','Superadmin','Male','2001-01-01','superadmin@gmail.com','superadmin','Active',0.00,'$2y$12$rP9SzINRbRQiPcqVvA6O3uY.FQhAGw7kc4zBdHU9iP0h7QW8F.hk2','09123456789','2024-11-16 16:09:49','2024-11-16 16:09:49',0),(2,2,'Admin','Admin','Male','2003-03-03','admin@gmail.com','admin','Active',0.00,'$2y$12$k49yL.MhQTAdtQkpXrgjd.eumftcDOW1jVIbr.iKDIsBfrMF4noPC','09123456789','2024-11-16 16:09:49','2024-11-16 16:09:49',0),(3,3,'Aladdin','Buwanding','Male','1920-01-15','aladdin@gmail.com','aladdin','Active',2.75,'$2y$12$3SDAfNehI2s7MfItqHgIm.zaYT8pkmZyqEnUEcWL.Gm40a5/dZ3ce','1234567890','2024-11-16 16:09:50','2024-11-24 17:37:47',1),(4,3,'Raphael','Alingig','Male','1920-01-15','raphael@gmail.com','raphael','Active',3.40,'$2y$12$E4YVfSJ8d1vIAn6VeM5AAO3GbCnbA2xm9lhfYncYphnMDWfC68arm','1234567890','2024-11-16 16:09:50','2024-11-25 02:44:16',0),(5,3,'John','Ratunil','Male','1920-01-15','john@gmail.com','john','Active',0.00,'$2y$12$RZMRZN8n62w5bKZmUb0jReGP72jNaWZwMmlqSAqaI1rG2KRORpaIy','1234567890','2024-11-16 16:09:50','2024-11-16 16:09:50',0),(6,3,'Ray','Ibarra','Male','1920-01-15','ray@gmail.com','ray','Active',0.00,'$2y$12$qGdAXn.FP/PktUrd2FMcjum4USk4oLwKDTXrXi1etwn.dxuv7dqii','1234567890','2024-11-16 16:09:50','2024-11-16 16:09:50',0),(7,3,'Mark','Juaton','Male','1920-01-15','mark@gmail.com','mark','Active',3.89,'$2y$12$6ZXegC9rkGoTS9mhU2EQRO6Nw8qAXacrjATU518IGe7bqMiMsuCaG','1234567890','2024-11-16 16:09:51','2024-11-23 01:40:10',0),(8,4,'Thad','Huber','Male','1920-01-15','thad@gmail.com','thad','Active',0.00,'$2y$12$yoPvrLKDRD3L4QgAc1uDW.rN0m/4TWcC.PtvEVfGB5rM.H98GdE3q','1234567890','2024-11-16 16:09:51','2024-11-20 04:39:16',0),(9,4,'Erin','Flower','Male','1920-01-15','Erin@gmail.com','erin','Active',0.00,'$2y$12$5CICeSMVWTOrEhBioIQqzeaERoMoT45c0XwY6Lc/jyPNr080pRbRS','1234567890','2024-11-16 16:09:51','2024-11-20 04:55:18',0),(10,4,'Gil','Vincent','Male','1920-01-15','gil@gmail.com','gil','Active',0.00,'$2y$12$U.MXbqF28XGDmoKQ4i3PdutwTEN/r86kxu6K9gCtwNUUurD6pPdYa','1234567890','2024-11-16 16:09:51','2024-11-24 17:41:32',0),(11,4,'Jayne','Olvier','Female','1920-01-15','jayne@gmail.com','jayne','Active',0.00,'$2y$12$ltcnRS1WZih5S/ce8QjTkOYCZLrse/haMOvk8lvnLL2Dfc1qUL0oq','1234567890','2024-11-16 16:09:52','2024-11-16 16:09:52',0),(12,4,'Sony','Ali','Male','1920-01-15','sony@gmail.com','sony','Active',4.00,'$2y$12$CglXosFNcbbHVG3RpZ/W9O7fzUFdOXmxnNFdm8daVBxfXOFpIwlj6','1234567890','2024-11-16 16:09:52','2024-11-25 04:20:54',0),(13,4,'Tracy','Moreno','Female','1920-01-15','tracy@gmail.com','tracy','Active',0.00,'$2y$12$uARWyC1wPCnILhK2ZV42N.XnQxv8fBL0h.EsCmB7t/wtzVeQAKNdO','1234567890','2024-11-16 16:09:52','2024-11-16 16:09:52',0),(14,3,'Marklien','Reyes','Male','1997-03-09','reyesmarklien28@gmail.com','Marklien89','Active',0.00,'$2y$12$OpwKsqx/JPwEd.ZRd1uaieTJXo0eWPTh1dL5gGzGBgxApGhU5m8rW','0945773956','2024-11-17 07:36:17','2024-11-23 01:18:44',0),(15,3,'johncarlo','ratunil','Male','2003-08-08','johncarloratunil217@gmail.com','ratunil','Active',0.00,'$2y$12$gO5chknS7fXiZai7WTLMyulSt9KNwL2K0TmghasNy3I0yo7WQuojK','09350132237','2024-11-18 08:40:29','2024-11-18 08:40:29',0),(16,4,'EJ Gwapo','Calderon','Male','2024-11-12','ejcalder@gmail.com','Ej123456','Active',0.00,'$2y$12$gNzP0ETpc78RcrHKE8tjS..PaDCg52.HkTCqen0vra/n3nqs9tJN.','09755484306','2024-11-18 08:46:16','2024-11-18 08:46:16',0),(17,3,'Haskar','Bobong','Female','1996-07-10','huskar@gmail.com','Haskar','Active',0.00,'$2y$12$wFQcORlnPpCAtKlfEFrreeB8wW8lYxIIEPesdNYTnj8Q43RvYgbU2','0964843191819','2024-11-18 08:57:14','2024-11-18 08:57:14',0),(18,3,'Asta','Yami','Male','2003-08-14','asta123@gmail.com','Asta123','Active',5.00,'$2y$12$RD1ZS6S7veZ1vztz/8L0..s9KRrPlycXq/xnkVi15DOUmSSGiwYj6','09658521344','2024-11-18 09:00:11','2024-11-24 06:26:49',0),(19,4,'Lea','Panilag','Female','2024-10-17','leapanilag@gmail.com','lea','Active',1.00,'$2y$12$VDDz.VuJX74mXK0m2LRPpOqEbhql.6tdc8EqcF5ExzBF8d4o3wNNe','09553304544','2024-11-19 16:13:31','2024-11-19 18:11:41',0),(20,4,'admin','admin','Male','2024-11-20','cucumbersalad@wearehackerone.com','cucumbersalad','Active',0.00,'$2y$12$QECdg0xGfpo8SIQ0eldA3OrRD.2uuYMfsbN7MqUIgUCuOAButoaDS','09497416922','2024-11-20 03:31:24','2024-11-20 03:31:24',0),(21,3,'Danny frances','Lapasaran','Male','2024-11-20','dannyfrances1976@gmail.com','Anset','Active',5.00,'$2y$12$kY9qLX.ieExk3peL9N0vpuVLK87k8vFEe4MRtmC9rAcK.l9I9kzem','+639174116836','2024-11-20 12:33:43','2024-11-22 03:24:02',0),(22,4,'Harvey','Babia','Male','1998-12-23','yhgnb@gmail.com','Harvey123','Active',0.00,'$2y$12$AURA7IBkxGXmxOVzVdV02ei7861Nx00vQbqB8UvDhS15b.s2r9dki','09666666666','2024-11-21 08:03:08','2024-11-21 08:03:08',0),(23,4,'Jun','Tan','Male','2024-11-21','hshshe@moy.hshs','Juntan','Active',0.00,'$2y$12$yps9fE4liaiXC1N6pg2TBuKdtVc8l3KdC76JMCv/bk050EOGob2Ti','123456789','2024-11-21 08:06:11','2024-11-21 08:06:11',0),(24,3,'Jhon','Babia','Male','2024-11-21','email@email.com','Babia123','Active',0.00,'$2y$12$XuOUu86T/p/GKOF8IBD6mO6mcvICow8eLMlOO2JIGkjy7r1BucisW','09666666666','2024-11-21 08:06:21','2024-11-21 08:06:21',0),(25,4,'Kevinmar','Macalam','Male','1986-06-24','kevinmarmacalam@gmail.com','Mario','Active',0.00,'$2y$12$GVQw4kWL3lYoMtzfwfxcoeVw5MI1pkqSB8VF.3fPfHEHom7MecgZ6','9631303397','2024-11-22 03:16:22','2024-11-22 03:16:22',0),(26,4,'sample','user','Male','1970-01-01','sampleuser@gmail.com','sampleuser','Active',0.00,'$2y$12$kZ8EqMHFiSqmrxEgw83Yc.C/hM7Z.52ATohCcpfUjSviZo0eO5dJK','09677166575','2024-11-23 05:29:05','2024-11-23 05:29:05',0),(27,4,'sample','customer','Male','2009-11-23','samplecustomer@gmail.com','samplecustomer','Active',0.00,'$2y$12$7jmKFgwVok8cM8/qTyssRuwDqlelGJj15Je2dQdpVSIfi2MH191rq','09263772364','2024-11-23 05:46:26','2024-11-23 05:46:26',0),(28,3,'sample','rider','Male','2004-11-23','samplerider@gmail.com','samplerider','Active',0.00,'$2y$12$pv7K8A/jlMXQbx8kJKzpsuFR01Bdhf0/TrjPNSQVG6ELOrElBarGe','32131232131','2024-11-23 05:47:46','2024-11-23 05:47:46',0),(29,4,'Jan','Pagasian','Male','1990-01-21','jantpagasian@gmail.com','JanPags','Active',0.00,'$2y$12$93fseMDpGyXUkLre3iaICeTtcjpyKpk.CPgDEVu.Lyv9khp6qhTEC','+639536333309','2024-11-23 10:26:37','2024-11-23 10:26:37',0);
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

-- Dump completed on 2024-12-07  3:06:43
