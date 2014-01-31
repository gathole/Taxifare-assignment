-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: taxifare
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add migration history',8,'add_migrationhistory'),(23,'Can change migration history',8,'change_migrationhistory'),(24,'Can delete migration history',8,'delete_migrationhistory'),(25,'Can add api access',9,'add_apiaccess'),(26,'Can change api access',9,'change_apiaccess'),(27,'Can delete api access',9,'delete_apiaccess'),(28,'Can add api key',10,'add_apikey'),(29,'Can change api key',10,'change_apikey'),(30,'Can delete api key',10,'delete_apikey'),(31,'Can add city',11,'add_city'),(32,'Can change city',11,'change_city'),(33,'Can delete city',11,'delete_city'),(34,'Can add fare variation',12,'add_farevariation'),(35,'Can change fare variation',12,'change_farevariation'),(36,'Can delete fare variation',12,'delete_farevariation'),(37,'Can add offer',13,'add_offer'),(38,'Can change offer',13,'change_offer'),(39,'Can delete offer',13,'delete_offer'),(40,'Can add trip type',14,'add_triptype'),(41,'Can change trip type',14,'change_triptype'),(42,'Can delete trip type',14,'delete_triptype'),(43,'Can add car',15,'add_car'),(44,'Can change car',15,'change_car'),(45,'Can delete car',15,'delete_car'),(46,'Can add city trip',16,'add_citytrip'),(47,'Can change city trip',16,'change_citytrip'),(48,'Can delete city trip',16,'delete_citytrip');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','admin@admin.com','pbkdf2_sha256$10000$Y4u6wcoMHhqw$2/ZbmbH92+4SapDDsHrZyY1IKe8kak8Fk1NTdPOb/YU=',1,1,1,'2014-01-30 22:08:44','2014-01-29 19:06:04');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-01-29 19:11:10',1,11,'1','Delhi',1,''),(2,'2014-01-29 19:11:28',1,11,'2','Bangalore',1,''),(3,'2014-01-29 19:11:51',1,11,'3','Mumbai',1,''),(4,'2014-01-29 19:18:20',1,12,'2','Delhi',1,''),(5,'2014-01-29 19:18:51',1,12,'3','Bangalore',1,''),(6,'2014-01-29 19:19:09',1,12,'4','Mumbai',1,''),(7,'2014-01-29 19:20:02',1,13,'1','Hello',1,''),(8,'2014-01-29 19:22:11',1,14,'1','PointToPoint',1,''),(9,'2014-01-29 19:28:44',1,14,'2','AirportTransfer',1,''),(10,'2014-01-29 19:28:59',1,14,'3','Outstation',1,''),(11,'2014-01-29 19:29:51',1,16,'1','Delhi--Outstation',1,''),(12,'2014-01-29 19:30:09',1,16,'2','Mumbai--PointToPoint',1,''),(13,'2014-01-29 19:30:30',1,16,'3','Bangalore--PointToPoint',1,''),(14,'2014-01-29 19:35:55',1,16,'1','Delhi--PointToPoint',1,''),(15,'2014-01-29 19:36:06',1,16,'2','Mumbai--PointToPoint',1,''),(16,'2014-01-29 19:36:40',1,16,'3','Bangalore--PointToPoint',1,''),(17,'2014-01-29 19:37:12',1,16,'4','Delhi--AirportTransfer',1,''),(18,'2014-01-29 19:37:21',1,16,'5','Delhi--Outstation',1,''),(19,'2014-01-29 19:37:48',1,16,'6','Bangalore--AirportTransfer',1,''),(20,'2014-01-29 19:37:56',1,16,'7','Bangalore--Outstation',1,''),(21,'2014-01-29 19:38:09',1,16,'8','Mumbai--AirportTransfer',1,''),(22,'2014-01-29 19:38:16',1,16,'9','Mumbai--Outstation',1,''),(23,'2014-01-29 20:28:01',1,15,'2','Hatchback',1,''),(24,'2014-01-29 20:28:14',1,15,'3','Sedan',1,''),(25,'2014-01-29 20:28:26',1,15,'4','SUV',1,''),(26,'2014-01-29 21:03:04',1,13,'1','HelloWorld',1,''),(27,'2014-01-30 19:09:49',1,15,'4','SUV',2,'Changed fare_pe.'),(28,'2014-01-30 19:09:49',1,15,'3','Sedan',2,'Changed fare_pe.'),(29,'2014-01-30 19:09:49',1,15,'2','Hatchback',2,'Changed fare_pe.'),(30,'2014-01-30 19:10:31',1,11,'3','Mumbai',2,'Changed base_fare.'),(31,'2014-01-30 19:10:31',1,11,'2','Bangalore',2,'Changed base_fare.'),(32,'2014-01-30 20:31:03',1,15,'1','Hatchback',1,''),(33,'2014-01-30 20:31:13',1,15,'2','Sedan',1,''),(34,'2014-01-30 20:31:21',1,15,'3','SUV',1,''),(35,'2014-01-30 20:32:27',1,13,'1','DiwaliTrip',1,''),(36,'2014-01-30 20:33:31',1,15,'3','SUV',2,'Changed fare_percent.'),(37,'2014-01-30 20:33:31',1,15,'2','Sedan',2,'Changed fare_percent.'),(38,'2014-01-30 20:33:31',1,15,'1','Hatchback',2,'Changed fare_percent.'),(39,'2014-01-30 21:03:22',1,3,'1','admin',2,'Changed password.'),(40,'2014-01-30 21:04:47',1,3,'1','admin',2,'Changed password. Added api key \"ll for admin\".'),(41,'2014-01-31 17:36:48',1,11,'3','Mumbai',2,'Changed extra_km_fare.'),(42,'2014-01-31 17:37:56',1,11,'3','Mumbai',2,'Changed extra_km_fare.'),(43,'2014-01-31 17:46:00',1,11,'3','Mumbai',2,'Changed extra_km_fare.'),(44,'2014-01-31 17:46:11',1,11,'2','Bangalore',2,'Changed extra_km_fare.'),(45,'2014-01-31 17:46:12',1,11,'1','Delhi',2,'Changed extra_km_fare.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'migration history','south','migrationhistory'),(9,'api access','tastypie','apiaccess'),(10,'api key','tastypie','apikey'),(11,'city','taxi','city'),(12,'fare variation','taxi','farevariation'),(13,'offer','taxi','offer'),(14,'trip type','taxi','triptype'),(15,'car','taxi','car'),(16,'city trip','taxi','citytrip');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5150b4ce96fd61c68fd409884f0f3754','MjFlOTY2MjRkMGVmYmIzYzFjOTFkOTUxZmJkNmQ4ODlhNDJlYzIyMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-13 20:30:21'),('75d2978119ca2dbcab3c491fafb59263','N2M2ZmY2ZWE1ZTVjMTUxMDE3ZWEyYjgzNWUzMzYzMDdiMDMwMWM4YzqAAn1xAS4=\n','2014-02-13 22:08:46'),('c2951abdaaf9f3b1299973e3229c3047','MjFlOTY2MjRkMGVmYmIzYzFjOTFkOTUxZmJkNmQ4ODlhNDJlYzIyMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2014-02-12 19:10:23');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'tastypie','0001_initial','2014-01-29 19:06:14'),(2,'tastypie','0002_add_apikey_index','2014-01-29 19:06:14'),(3,'taxi','0001_initial','2014-01-29 19:08:12'),(4,'taxi','0002_auto__add_farevariation','2014-01-29 19:09:44'),(5,'taxi','0003_auto__add_offer','2014-01-29 19:09:44'),(6,'taxi','0004_auto__add_triptype','2014-01-29 19:09:44'),(7,'taxi','0005_auto__add_car','2014-01-29 19:09:45'),(8,'taxi','0006_auto__chg_field_farevariation_outside_city','2014-01-29 19:15:10'),(9,'taxi','0007_auto__add_citytrip__del_field_triptype_flat_fare','2014-01-29 19:27:08'),(10,'taxi','0008_auto__del_citytrip__del_offer','2014-01-29 19:35:26'),(11,'taxi','0009_auto__add_offer','2014-01-29 19:35:27'),(12,'taxi','0010_auto__add_citytrip__add_unique_citytrip_city_trip_type','2014-01-29 19:35:28'),(13,'taxi','0011_auto__del_field_car_fare_pe__add_field_car_fare_pecent__del_field_offe','2014-01-30 20:27:06'),(14,'taxi','0012_auto__del_car__del_offer','2014-01-30 20:27:14'),(15,'taxi','0013_auto__add_offer','2014-01-30 20:27:45'),(16,'taxi','0014_auto__add_car','2014-01-30 20:27:45'),(17,'taxi','0015_auto__del_car','2014-01-30 20:29:24'),(18,'taxi','0016_auto__add_car','2014-01-30 20:30:43');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_332d09f456bfdb62` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
INSERT INTO `tastypie_apikey` VALUES (1,1,'ll','2014-01-30 21:04:40');
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_car`
--

DROP TABLE IF EXISTS `taxi_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `fare_percent` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_car`
--

LOCK TABLES `taxi_car` WRITE;
/*!40000 ALTER TABLE `taxi_car` DISABLE KEYS */;
INSERT INTO `taxi_car` VALUES (1,'Hatchback',8),(2,'Sedan',5),(3,'SUV',3);
/*!40000 ALTER TABLE `taxi_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_city`
--

DROP TABLE IF EXISTS `taxi_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `base_fare` double NOT NULL,
  `base_km` double NOT NULL,
  `extra_km_fare` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_city`
--

LOCK TABLES `taxi_city` WRITE;
/*!40000 ALTER TABLE `taxi_city` DISABLE KEYS */;
INSERT INTO `taxi_city` VALUES (1,'Delhi',200,10,15),(2,'Bangalore',500,15,20),(3,'Mumbai',300,20,25);
/*!40000 ALTER TABLE `taxi_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_citytrip`
--

DROP TABLE IF EXISTS `taxi_citytrip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_citytrip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `trip_type_id` int(11) NOT NULL,
  `flat_fare` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taxi_citytrip_city_id_1b4f16c13cbfffc2_uniq` (`city_id`,`trip_type_id`),
  KEY `taxi_citytrip_586a73b5` (`city_id`),
  KEY `taxi_citytrip_f4f5993` (`trip_type_id`),
  CONSTRAINT `city_id_refs_id_5b5a60a24848708c` FOREIGN KEY (`city_id`) REFERENCES `taxi_city` (`id`),
  CONSTRAINT `trip_type_id_refs_id_3c7f0be6cbdbe310` FOREIGN KEY (`trip_type_id`) REFERENCES `taxi_triptype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_citytrip`
--

LOCK TABLES `taxi_citytrip` WRITE;
/*!40000 ALTER TABLE `taxi_citytrip` DISABLE KEYS */;
INSERT INTO `taxi_citytrip` VALUES (1,1,1,1000),(2,3,1,200),(3,2,1,500),(4,1,2,500),(5,1,3,0),(6,2,2,600),(7,2,3,0),(8,3,2,1200),(9,3,3,0);
/*!40000 ALTER TABLE `taxi_citytrip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_farevariation`
--

DROP TABLE IF EXISTS `taxi_farevariation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_farevariation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `outside_city` double NOT NULL,
  `night_charge` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_id` (`city_id`),
  CONSTRAINT `city_id_refs_id_275b1531b8a5906e` FOREIGN KEY (`city_id`) REFERENCES `taxi_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_farevariation`
--

LOCK TABLES `taxi_farevariation` WRITE;
/*!40000 ALTER TABLE `taxi_farevariation` DISABLE KEYS */;
INSERT INTO `taxi_farevariation` VALUES (2,1,5,3),(3,2,10,5),(4,3,7,5);
/*!40000 ALTER TABLE `taxi_farevariation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_offer`
--

DROP TABLE IF EXISTS `taxi_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `discount_percent` double NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_offer`
--

LOCK TABLES `taxi_offer` WRITE;
/*!40000 ALTER TABLE `taxi_offer` DISABLE KEYS */;
INSERT INTO `taxi_offer` VALUES (1,'DiwaliTrip',10,'2014-02-01');
/*!40000 ALTER TABLE `taxi_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_triptype`
--

DROP TABLE IF EXISTS `taxi_triptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_triptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_triptype`
--

LOCK TABLES `taxi_triptype` WRITE;
/*!40000 ALTER TABLE `taxi_triptype` DISABLE KEYS */;
INSERT INTO `taxi_triptype` VALUES (2,'AirportTransfer'),(3,'Outstation'),(1,'PointToPoint');
/*!40000 ALTER TABLE `taxi_triptype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-01  0:46:08
