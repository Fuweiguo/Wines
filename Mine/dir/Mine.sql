-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: Mine
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add users',7,'add_users'),(20,'Can change users',7,'change_users'),(21,'Can delete users',7,'delete_users'),(22,'Can add goods',8,'add_goods'),(23,'Can change goods',8,'change_goods'),(24,'Can delete goods',8,'delete_goods'),(25,'Can add carts',9,'add_carts'),(26,'Can change carts',9,'change_carts'),(27,'Can delete carts',9,'delete_carts'),(28,'Can add orders',10,'add_orders'),(29,'Can change orders',10,'change_orders'),(30,'Can delete orders',10,'delete_orders'),(31,'Can add orderdetail',11,'add_orderdetail'),(32,'Can change orderdetail',11,'change_orderdetail'),(33,'Can delete orderdetail',11,'delete_orderdetail');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_number` int(11) NOT NULL,
  `c_is` tinyint(1) NOT NULL,
  `c_delete` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_goods_id_defc570d_fk_goods_id` (`goods_id`),
  KEY `carts_user_id_3a9d1785_fk_user_id` (`user_id`),
  CONSTRAINT `carts_goods_id_defc570d_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (68,0,1,1,3,5),(69,1,1,1,4,5),(70,1,1,1,3,5),(71,0,1,1,1,5),(72,1,1,1,2,5);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'app','carts'),(8,'app','goods'),(11,'app','orderdetail'),(10,'app','orders'),(7,'app','users'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-14 12:42:17.831720'),(2,'auth','0001_initial','2019-03-14 12:42:18.103365'),(3,'admin','0001_initial','2019-03-14 12:42:18.164737'),(4,'admin','0002_logentry_remove_auto_add','2019-03-14 12:42:18.180967'),(5,'contenttypes','0002_remove_content_type_name','2019-03-14 12:42:18.231530'),(6,'auth','0002_alter_permission_name_max_length','2019-03-14 12:42:18.253087'),(7,'auth','0003_alter_user_email_max_length','2019-03-14 12:42:18.282606'),(8,'auth','0004_alter_user_username_opts','2019-03-14 12:42:18.310917'),(9,'auth','0005_alter_user_last_login_null','2019-03-14 12:42:18.335061'),(10,'auth','0006_require_contenttypes_0002','2019-03-14 12:42:18.338687'),(11,'auth','0007_alter_validators_add_error_messages','2019-03-14 12:42:18.349829'),(12,'auth','0008_alter_user_username_max_length','2019-03-14 12:42:18.376953'),(13,'sessions','0001_initial','2019-03-14 12:42:18.401381'),(14,'app','0001_initial','2019-03-15 02:54:38.065680'),(15,'app','0002_delete_users','2019-03-15 02:55:49.033042'),(16,'app','0003_users','2019-03-15 02:57:04.544222'),(17,'app','0004_remove_users_phone','2019-03-15 04:23:08.399196'),(18,'app','0005_users_phone','2019-03-15 04:24:17.079134'),(19,'app','0006_delete_users','2019-03-15 05:00:39.784774'),(20,'app','0007_users','2019-03-15 05:01:19.796966'),(21,'app','0008_goods','2019-03-15 08:27:07.855430'),(22,'app','0009_carts','2019-03-15 09:23:47.865030'),(23,'app','0010_auto_20190316_1230','2019-03-16 04:30:28.735637'),(24,'app','0011_orders','2019-03-16 14:14:53.043699'),(25,'app','0012_orderdetail','2019-03-17 13:14:54.621381'),(26,'app','0013_auto_20190317_2116','2019-03-17 13:16:24.028120'),(27,'app','0014_auto_20190318_0019','2019-03-17 16:19:31.378782'),(28,'app','0015_orders_isdelete','2019-03-18 01:53:33.806118');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5n400ghgm3g75kbz7daa499so8o9824w','MGZhYTc2NWZkYzEwNGM3ZWY4ZDc5ZmJhNDJmNTcyYWVjNTE5YmVhMjp7InRva2VuIjoiZjhmYjQ4OTc3M2IwMDYxZWE4NWUyZGJkODJiOGFhZTUifQ==','2019-03-31 15:52:47.216101'),('5yrslqarxbvbuwqzwq264hsr0s5hve69','YjBlN2RlZDYxMGZiODg2ZTllNDI0MzIyMzUyOTg4MjMzOGY1ZTEyODp7InRva2VuIjoiNjIwYmIxOThmY2NiZjhhZjliZjliYTViMGNkZWMwMTYifQ==','2019-04-01 17:00:37.691676'),('d5cv039kie0gyngewcrzkn4o44icsfv9','YTY1ZmJlM2M4YWNmMjFlMDE3ZWEwM2I0MTU3ZGRjMmYyZGFjMGVhOTp7InRva2VuIjoiMmNmZTQxOWUxZmRiMGZkMDE4YzU2NWUyMzVmZDk1ZmEifQ==','2019-03-29 16:01:05.516176'),('k0h6hqjiiyhzq1tp8kbo7wjqqo5cykll','YzYxODFmZjczNDk1YTQ2NjBhZjNkYjgwM2RkYTAyOTQ3N2YwZGEzZDp7InRva2VuIjoiZTUwMGMyNjAyNWFiNDc4NTJiZTJjYjQ0ODViMDA0MzgifQ==','2019-03-29 16:26:10.047487'),('khl58loqcpfvoe0swnsozg26p9tobo3s','YzdiYWM2OWJkZjgyZjkwOGQxNTE3N2U4NGY0NzkzZGYyYmJjMjQ2ODp7InRva2VuIjoiY2UyYmVkYTkyYTU1NDY4MGMwMzRmYjdiMmNmNzcwYTAifQ==','2019-04-01 06:13:54.579423'),('mwu3ysvybmpghw01y2qn75yutoy9vy6v','ZmU2NTRlMTFhNTlmZTU2YWQwOWFhZTRmYzdiZTFkYjAwMjVjNGVhZTp7InRva2VuIjoiMmEzNTM2ZjgzMjY3MGQ1YTNkZTYyOGYyODdiNTYzMTQifQ==','2019-04-02 02:46:16.529871'),('ttl5fpl7qwaukkeqt3hkyazdjj84ltb9','OTE1NGYxM2VhNDI3NGYzMTVmY2U3MGE3OTEwOTM3OGU3YmUwMzUwYjp7InRva2VuIjoiNGM3OGJkYmFjZWI4YjQ5M2Y2ZWY0YzFmZTA3YzNkZDcifQ==','2019-03-29 14:22:39.269823');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(40) NOT NULL,
  `g_img` varchar(100) NOT NULL,
  `g_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'52°老泸州和爽6酒 500ml','1.jpg',188),(2,'43°国窖1573礼盒600ml','3.jpg',198.99),(3,'53°茅台财富珍品 500ml','4.jpg',399.98),(4,'43°红星蓝瓶八年陈酿 500ml （12瓶装）','6.jpg',1458.98);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isdelete` tinyint(1) NOT NULL,
  `num` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drderdetail_goods_id_dd3207a9_fk_goods_id` (`goods_id`),
  KEY `drderdetail_orders_id_c2f581cd_fk_orders_id` (`orders_id`),
  CONSTRAINT `drderdetail_goods_id_dd3207a9_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `drderdetail_orders_id_c2f581cd_fk_orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,0,5,3,1),(2,0,1,1,1),(3,0,5,3,2),(4,0,1,1,2),(5,0,6,3,3),(6,0,1,1,3),(7,0,6,3,4),(8,0,1,1,4),(9,0,6,3,5),(10,0,1,1,5),(11,0,6,3,6),(12,0,1,1,6),(13,0,6,3,7),(14,0,1,1,7),(15,0,6,3,8),(16,0,1,1,8),(17,0,6,3,9),(18,0,1,1,9),(19,0,6,3,10),(20,0,1,1,10),(21,0,6,3,11),(22,0,1,1,11),(23,0,6,3,12),(24,0,1,1,12),(25,0,6,3,13),(26,0,1,1,13),(27,0,6,3,14),(28,0,1,1,14),(29,0,6,3,15),(30,0,1,1,15),(31,0,6,3,16),(32,0,1,1,16),(33,0,6,3,17),(34,0,1,1,17),(35,0,6,3,18),(36,0,1,1,18),(37,0,6,3,19),(38,0,1,1,19),(39,0,6,3,20),(40,0,1,1,20),(41,0,6,3,21),(42,0,1,1,21),(43,0,6,3,22),(44,0,1,1,22),(45,0,6,3,23),(46,0,1,1,23),(47,0,6,3,24),(48,0,1,1,24),(49,0,6,3,25),(50,0,1,1,25),(51,0,6,3,26),(52,0,1,1,26),(53,0,6,3,27),(54,0,1,1,27),(55,0,6,3,28),(56,0,1,1,28),(57,0,6,3,29),(58,0,1,1,29),(59,0,6,3,30),(60,0,1,1,30),(61,0,6,3,31),(62,0,1,1,31),(63,0,6,3,32),(64,0,1,1,32),(65,0,6,3,33),(66,0,1,1,33),(67,0,6,3,34),(68,0,1,1,34),(69,0,6,3,35),(70,0,1,1,35),(71,0,6,3,36),(72,0,1,1,36),(73,0,6,3,37),(74,0,1,1,37),(75,0,6,3,38),(76,0,1,1,38),(77,0,6,3,39),(78,0,1,1,39),(79,0,6,3,40),(80,0,1,1,40),(81,0,6,3,41),(82,0,1,1,41),(83,0,6,3,42),(84,0,1,1,42),(85,0,6,3,43),(86,0,1,1,43),(87,0,6,3,44),(88,0,1,1,44),(89,0,6,3,45),(90,0,1,1,45),(91,0,6,3,46),(92,0,1,1,46),(93,0,6,3,47),(94,0,1,1,47),(95,0,6,3,48),(96,0,1,1,48),(97,0,6,3,49),(98,0,1,1,49),(99,0,6,3,50),(100,0,1,1,50),(101,0,6,3,51),(102,0,1,1,51),(103,0,6,3,52),(104,0,1,1,52),(105,0,6,3,53),(106,0,1,1,53),(107,0,2,3,55),(108,0,1,3,60),(109,0,1,3,61),(110,0,1,3,62),(111,0,1,3,63),(112,0,1,3,64),(113,0,1,3,65),(114,0,1,3,66),(115,0,1,3,67),(116,0,1,3,68),(117,0,1,3,69),(118,0,1,3,70),(119,0,1,3,71),(120,0,1,3,72),(121,0,1,3,73),(122,0,1,3,74),(123,0,1,3,75),(124,0,1,3,76),(125,0,1,3,77),(126,0,1,3,78),(127,0,1,3,79),(128,0,1,3,80),(129,0,1,3,81),(130,0,1,3,82),(131,0,1,3,83),(132,0,1,3,84),(133,0,1,3,85),(134,0,1,3,86),(135,0,1,3,87),(136,0,1,3,88),(137,0,1,3,89),(138,0,1,3,90),(139,0,1,3,91),(140,0,1,3,92),(141,0,1,3,93),(142,0,1,3,94),(143,0,1,3,95),(144,0,1,3,96),(145,0,1,3,97),(146,0,1,3,98),(147,0,1,3,99),(148,1,1,3,100),(149,0,1,3,101),(150,0,1,3,102),(151,1,1,3,103),(152,1,1,1,103),(153,0,1,3,104),(154,0,1,1,104),(155,0,1,3,105),(156,0,1,1,105),(157,0,1,3,106),(158,0,1,1,106),(159,0,1,3,107),(160,0,1,1,107),(161,1,2,3,108),(162,1,1,1,108),(163,0,2,3,109),(164,0,1,1,109),(165,0,1,2,109),(166,1,2,3,110),(167,1,1,1,110),(168,1,1,2,110),(169,0,2,3,111),(170,0,1,1,111),(171,0,1,2,111),(172,0,2,3,112),(173,0,1,1,112),(174,0,1,2,112),(175,0,2,3,113),(176,0,1,1,113),(177,0,1,2,113),(178,0,2,3,114),(179,0,1,1,114),(180,0,1,2,114),(181,0,2,3,115),(182,0,1,1,115),(183,0,1,2,115),(184,0,2,3,116),(185,0,1,1,116),(186,0,1,2,116),(187,0,2,3,117),(188,0,1,1,117),(189,0,1,2,117),(190,0,2,3,118),(191,0,1,1,118),(192,0,1,2,118),(193,0,2,3,119),(194,0,1,1,119),(195,0,1,2,119),(196,0,2,3,120),(197,0,1,1,120),(198,0,1,2,120),(199,0,2,3,121),(200,0,1,1,121),(201,0,1,2,121),(202,0,2,3,122),(203,0,1,1,122),(204,0,1,2,122),(205,0,2,3,123),(206,0,1,1,123),(207,0,1,2,123),(208,0,2,3,124),(209,0,1,1,124),(210,0,1,2,124),(211,0,2,3,125),(212,0,1,1,125),(213,0,1,2,125),(214,0,2,3,126),(215,0,1,1,126),(216,0,1,2,126),(217,0,2,3,127),(218,0,1,1,127),(219,0,1,2,127),(220,0,2,3,128),(221,0,1,1,128),(222,0,1,2,128),(223,0,2,3,129),(224,0,1,1,129),(225,0,1,2,129),(226,0,2,3,130),(227,0,1,1,130),(228,0,1,2,130),(229,0,2,3,131),(230,0,1,1,131),(231,0,1,2,131),(232,0,2,3,132),(233,0,1,1,132),(234,0,1,2,132),(235,0,2,3,133),(236,0,1,1,133),(237,0,1,2,133),(238,0,2,3,134),(239,0,1,1,134),(240,0,1,2,134),(241,0,2,3,135),(242,0,1,1,135),(243,0,1,2,135),(244,0,2,3,136),(245,0,1,1,136),(246,0,1,2,136),(247,0,2,3,137),(248,0,1,1,137),(249,0,1,2,137),(250,0,2,3,138),(251,0,1,1,138),(252,0,1,2,138),(253,0,2,3,139),(254,0,1,1,139),(255,0,1,2,139),(256,0,2,3,140),(257,0,1,1,140),(258,0,1,2,140),(259,0,2,3,141),(260,0,1,1,141),(261,0,1,2,141),(262,0,2,3,142),(263,0,1,1,142),(264,0,1,2,142),(265,0,2,3,143),(266,0,1,1,143),(267,0,1,2,143),(268,0,2,3,144),(269,0,1,1,144),(270,0,1,2,144),(271,0,2,3,145),(272,0,1,1,145),(273,0,1,2,145),(274,0,2,3,146),(275,0,1,1,146),(276,0,1,2,146),(277,0,2,3,147),(278,0,1,1,147),(279,0,1,2,147),(280,0,2,3,148),(281,0,1,1,148),(282,0,1,2,148),(283,0,2,3,149),(284,0,1,1,149),(285,0,1,2,149),(286,0,2,3,150),(287,0,1,1,150),(288,0,1,2,150),(289,0,2,3,151),(290,0,1,1,151),(291,0,1,2,151),(292,0,2,3,152),(293,0,1,1,152),(294,0,1,2,152),(295,1,2,3,153),(296,1,1,1,153),(297,1,1,2,153),(298,0,2,3,154),(299,0,1,1,154),(300,0,1,2,154),(301,0,2,3,155),(302,0,1,1,155),(303,0,1,2,155),(304,1,2,3,156),(305,1,1,1,156),(306,0,1,2,156),(307,0,2,3,157),(308,0,6,1,157),(309,0,1,2,157),(310,1,1,4,158),(311,0,1,4,159),(312,0,1,3,159),(313,0,1,4,160),(314,0,1,3,160),(315,0,1,4,161),(316,0,1,3,161),(317,0,1,4,162),(318,0,1,3,162),(319,0,1,4,163),(320,0,1,3,163),(321,0,1,4,164),(322,0,1,3,164),(323,0,1,4,165),(324,0,1,3,165),(325,0,1,4,166),(326,0,1,3,166),(327,0,1,4,167),(328,0,1,3,167),(329,0,1,4,168),(330,0,19,3,168),(331,0,1,4,169),(332,0,19,3,169),(333,0,1,4,170),(334,0,19,3,170),(335,0,1,4,171),(336,0,19,3,171),(337,0,1,4,172),(338,0,19,3,172),(339,0,1,4,173),(340,0,19,3,173),(341,0,1,4,174);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(256) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `updatetime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isdelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_7e2523fb_fk_user_id` (`user_id`),
  CONSTRAINT `orders_user_id_7e2523fb_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'<built-in method random of Random object at 0x222d148><built-in method random of Random object at 0x222d148>','2019-03-17 15:08:09.805341','2019-03-18 02:08:15.498373',0,5,1),(2,'<built-in method random of Random object at 0x1d94358><built-in method random of Random object at 0x1d94358>','2019-03-17 15:11:45.207175','2019-03-18 02:08:06.192483',0,5,1),(3,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:18:37.387537','2019-03-18 02:08:17.435885',0,5,1),(4,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:18:49.674579','2019-03-18 02:08:18.254408',0,5,1),(5,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:21:22.941139','2019-03-17 15:21:22.941183',0,5,0),(6,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:21:25.107534','2019-03-18 02:08:21.980683',0,5,1),(7,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:21:38.219427','2019-03-18 02:11:50.814069',0,5,1),(8,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:21:56.375806','2019-03-18 02:08:23.594526',0,5,1),(9,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:23:23.535747','2019-03-17 15:23:23.535811',0,5,0),(10,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:23:24.597468','2019-03-18 02:11:52.246182',0,5,1),(11,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:23:59.084590','2019-03-17 15:23:59.084630',0,5,0),(12,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:24:00.015492','2019-03-17 15:24:00.015595',0,5,0),(13,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:24:13.793489','2019-03-17 15:24:13.793532',0,5,0),(14,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:29:33.790502','2019-03-17 15:29:33.790612',0,5,0),(15,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:29:38.239460','2019-03-17 15:29:38.239504',0,5,0),(16,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:30:43.218921','2019-03-17 15:30:43.218965',0,5,0),(17,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:32:08.293279','2019-03-17 15:32:08.293319',0,5,0),(18,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:32:09.602302','2019-03-17 15:32:09.602346',0,5,0),(19,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:32:29.457490','2019-03-17 15:32:29.457535',0,5,0),(20,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:32:30.456615','2019-03-17 15:32:30.456662',0,5,0),(21,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:32:58.389089','2019-03-17 15:32:58.389135',0,5,0),(22,'<built-in method random of Random object at 0x1d497d8><built-in method random of Random object at 0x1d497d8>','2019-03-17 15:32:59.871740','2019-03-17 15:32:59.871783',0,5,0),(23,'<built-in method random of Random object at 0x16c78e8><built-in method random of Random object at 0x16c78e8>','2019-03-17 15:34:27.066097','2019-03-17 15:34:27.066141',0,5,0),(24,'<built-in method random of Random object at 0x1fae6e8>','2019-03-17 15:35:16.920813','2019-03-17 15:35:16.920856',0,5,0),(25,'<built-in method random of Random object at 0x1fae6e8>','2019-03-17 15:35:18.628953','2019-03-17 15:35:18.628994',0,5,0),(26,'<built-in method random of Random object at 0x1fae6e8>','2019-03-17 15:35:19.781415','2019-03-17 15:35:19.781461',0,5,0),(27,'1552836947.998473','2019-03-17 15:35:47.999141','2019-03-17 15:35:47.999188',0,5,0),(28,'1552836949.2741287','2019-03-17 15:35:49.274710','2019-03-17 15:35:49.274760',0,5,0),(29,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:12.543757','2019-03-17 15:37:12.543817',0,5,0),(30,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:13.852594','2019-03-17 15:37:13.852653',0,5,0),(31,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:22.309962','2019-03-17 15:37:22.310006',0,5,0),(32,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:23.180597','2019-03-17 15:37:23.180651',0,5,0),(33,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:23.799731','2019-03-17 15:37:23.799799',0,5,0),(34,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:24.352041','2019-03-17 15:37:24.352082',0,5,0),(35,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:25.211809','2019-03-17 15:37:25.211851',0,5,0),(36,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:25.802833','2019-03-17 15:37:25.802903',0,5,0),(37,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:37:26.387452','2019-03-17 15:37:26.387494',0,5,0),(38,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:38:14.398810','2019-03-17 15:38:14.398885',0,5,0),(39,'<built-in method random of Random object at 0x2a0ec28>','2019-03-17 15:38:16.277075','2019-03-17 15:38:16.277172',0,5,0),(40,'<built-in method random of Random object at 0x24e4438>','2019-03-17 15:38:54.032688','2019-03-17 15:38:54.032737',0,5,0),(41,'<built-in method random of Random object at 0x24e4438>','2019-03-17 15:38:55.165899','2019-03-17 15:38:55.165943',0,5,0),(42,'<built-in method random of Random object at 0x24e4438>','2019-03-17 15:39:56.153737','2019-03-17 15:39:56.153816',0,5,0),(43,'<built-in method random of Random object at 0x24e4438>','2019-03-17 15:39:57.211517','2019-03-17 15:39:57.211557',0,5,0),(44,'<built-in method random of Random object at 0x24e4438>','2019-03-17 15:41:42.817371','2019-03-17 15:41:42.817417',0,5,0),(45,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:41:44.367215','2019-03-17 15:41:44.367288',0,5,0),(46,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:41:45.849237','2019-03-17 15:41:45.849286',0,5,0),(47,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:41:46.977869','2019-03-17 15:41:46.977910',0,5,0),(48,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:42:03.248326','2019-03-17 15:42:03.248418',0,5,0),(49,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:42:04.214000','2019-03-17 15:42:04.214043',0,5,0),(50,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:42:05.430301','2019-03-17 15:42:05.430343',0,5,0),(51,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:42:06.669104','2019-03-17 15:42:06.669203',0,5,0),(52,'<built-in method random of Random object at 0x10a9218>','2019-03-17 15:42:08.157957','2019-03-17 15:42:08.158000',0,5,0),(53,'<built-in method random of Random object at 0x1c36af8>','2019-03-17 15:44:52.835221','2019-03-17 15:44:52.835266',0,5,0),(54,'<built-in method random of Random object at 0x1c36af8>','2019-03-17 15:50:24.995904','2019-03-17 15:50:24.995945',0,5,0),(55,'<built-in method random of Random object at 0x28b3158>','2019-03-17 15:52:58.274141','2019-03-17 15:52:58.274182',0,5,0),(56,'<built-in method random of Random object at 0x28b3158>','2019-03-17 15:57:52.032570','2019-03-17 15:57:52.032616',0,5,0),(57,'<built-in method random of Random object at 0x28b3158>','2019-03-17 15:57:53.285993','2019-03-17 15:57:53.286054',0,5,0),(58,'<built-in method random of Random object at 0x28b3158>','2019-03-17 15:58:10.556735','2019-03-17 15:58:10.556777',0,5,0),(59,'<built-in method random of Random object at 0x28b3158>','2019-03-17 15:58:14.094010','2019-03-17 15:58:14.094048',0,5,0),(60,'<built-in method random of Random object at 0x16302a8>','2019-03-17 15:58:47.254140','2019-03-17 15:58:47.254185',0,5,0),(61,'<built-in method random of Random object at 0x16302a8>','2019-03-17 15:58:50.887587','2019-03-17 15:58:50.887633',0,5,0),(62,'<built-in method random of Random object at 0x16302a8>','2019-03-17 15:58:51.747479','2019-03-17 15:58:51.747525',0,5,0),(63,'<built-in method random of Random object at 0x16302a8>','2019-03-17 15:59:23.418654','2019-03-17 15:59:23.418695',0,5,0),(64,'<built-in method random of Random object at 0x16302a8>','2019-03-17 15:59:59.027982','2019-03-17 15:59:59.028082',0,5,0),(65,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:00:01.413487','2019-03-17 16:00:01.413529',0,5,0),(66,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:00:17.218888','2019-03-17 16:00:17.218968',0,5,0),(67,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:00:38.430009','2019-03-17 16:00:38.430053',0,5,0),(68,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:00:39.574264','2019-03-17 16:00:39.574358',0,5,0),(69,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:01:03.109617','2019-03-17 16:01:03.109664',0,5,0),(70,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:01:33.310529','2019-03-17 16:01:33.310573',0,5,0),(71,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:01:38.319280','2019-03-17 16:01:38.319323',0,5,0),(72,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:02:12.850042','2019-03-17 16:02:12.850084',0,5,0),(73,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:02:14.040808','2019-03-17 16:02:14.040898',0,5,0),(74,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:02:22.710016','2019-03-17 16:02:22.710089',0,5,0),(75,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:03:06.952995','2019-03-17 16:03:06.953043',0,5,0),(76,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:03:08.211932','2019-03-17 16:03:08.211977',0,5,0),(77,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:03:09.339676','2019-03-17 16:03:09.339719',0,5,0),(78,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:03:37.556003','2019-03-17 16:03:37.556045',0,5,0),(79,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:03:40.489413','2019-03-17 16:03:40.489458',0,5,0),(80,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:03:55.451338','2019-03-17 16:03:55.451414',0,5,0),(81,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:03:56.592773','2019-03-17 16:03:56.592870',0,5,0),(82,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:04:37.614121','2019-03-17 16:04:37.614163',0,5,0),(83,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:04:41.252048','2019-03-17 16:04:41.252093',0,5,0),(84,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:04:42.414403','2019-03-17 16:04:42.414444',0,5,0),(85,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:05:12.901385','2019-03-17 16:05:12.901425',0,5,0),(86,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:05:14.372841','2019-03-17 16:05:14.372885',0,5,0),(87,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:05:22.505786','2019-03-17 16:05:22.505830',0,5,0),(88,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:06:38.002361','2019-03-17 16:06:38.002443',0,5,0),(89,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:06:41.331267','2019-03-17 16:06:41.331310',0,5,0),(90,'<built-in method random of Random object at 0x16302a8>','2019-03-17 16:06:49.052936','2019-03-17 16:06:49.052984',0,5,0),(91,'<built-in method random of Random object at 0x1515ca8>','2019-03-17 16:14:26.733993','2019-03-17 16:14:26.734071',0,5,0),(92,'<built-in method random of Random object at 0x222baa8>','2019-03-17 16:15:50.953926','2019-03-17 16:15:50.953971',0,5,0),(93,'<built-in method random of Random object at 0x1f58da8>','2019-03-17 16:19:56.527727','2019-03-17 16:19:56.527771',0,5,0),(94,'<built-in method random of Random object at 0x1f58da8>','2019-03-17 16:19:57.681807','2019-03-17 16:19:57.681850',0,5,0),(95,'<built-in method random of Random object at 0x1f58da8>','2019-03-17 16:20:00.764418','2019-03-17 16:20:00.764465',0,5,0),(96,'<built-in method random of Random object at 0x1f58da8>','2019-03-17 16:20:02.061273','2019-03-17 16:20:02.061345',0,5,0),(97,'<built-in method random of Random object at 0x1588068>','2019-03-17 16:21:05.246370','2019-03-17 16:21:05.246412',0,5,0),(98,'<built-in method random of Random object at 0x1588068>','2019-03-17 16:21:14.083758','2019-03-17 16:21:14.083801',0,5,0),(99,'<built-in method random of Random object at 0x1db5708>','2019-03-17 16:21:50.483043','2019-03-17 16:21:50.483086',0,5,0),(100,'<built-in method random of Random object at 0x158d688>','2019-03-17 16:22:44.239918','2019-03-17 16:22:44.239959',0,5,0),(101,'<built-in method random of Random object at 0x158d688>','2019-03-17 16:22:48.379008','2019-03-17 16:22:48.379051',0,5,0),(102,'<built-in method random of Random object at 0x158d688>','2019-03-17 16:22:49.618980','2019-03-17 16:22:49.619024',0,5,0),(103,'<built-in method random of Random object at 0x158d688>','2019-03-17 16:24:50.510465','2019-03-17 16:24:50.510507',0,5,0),(104,'<built-in method random of Random object at 0x158d688>','2019-03-17 16:25:08.818610','2019-03-17 16:25:08.818651',0,5,0),(105,'<built-in method random of Random object at 0x162ea48>','2019-03-17 16:28:08.400744','2019-03-17 16:28:08.400787',0,5,0),(106,'<built-in method random of Random object at 0x162ea48>','2019-03-17 16:28:09.288287','2019-03-17 16:28:09.288328',0,5,0),(107,'<built-in method random of Random object at 0x162ea48>','2019-03-17 16:28:10.886575','2019-03-17 16:28:10.886619',0,5,0),(108,'<built-in method random of Random object at 0x1c0a438>','2019-03-18 01:10:25.148723','2019-03-18 01:10:25.148765',0,5,0),(109,'<built-in method random of Random object at 0x1c0a438>','2019-03-18 01:12:27.056612','2019-03-18 01:12:27.056653',0,5,0),(110,'<built-in method random of Random object at 0x1c0a438>','2019-03-18 01:12:32.785847','2019-03-18 01:12:32.785887',0,5,0),(111,'<built-in method random of Random object at 0x1c0a438>','2019-03-18 01:12:41.832343','2019-03-18 01:12:41.832408',0,5,0),(112,'<built-in method random of Random object at 0x1c0a438>','2019-03-18 01:13:32.615213','2019-03-18 01:13:32.615257',0,5,0),(113,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:16:04.040638','2019-03-18 01:16:04.040681',0,5,0),(114,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:18:29.416157','2019-03-18 01:18:29.416213',0,5,0),(115,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:11.323495','2019-03-18 01:19:11.323571',0,5,0),(116,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:36.750703','2019-03-18 01:19:36.750746',0,5,0),(117,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:37.956395','2019-03-18 01:19:37.956436',0,5,0),(118,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:39.051974','2019-03-18 01:19:39.052010',0,5,0),(119,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:40.140708','2019-03-18 01:19:40.140759',0,5,0),(120,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:41.227940','2019-03-18 01:19:41.228025',0,5,0),(121,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:42.186955','2019-03-18 01:19:42.186997',0,5,0),(122,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:43.270136','2019-03-18 01:19:43.270180',0,5,0),(123,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:44.307258','2019-03-18 01:19:44.307303',0,5,0),(124,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:46.044286','2019-03-18 01:19:46.044356',0,5,0),(125,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:46.596164','2019-03-18 01:19:46.596205',0,5,0),(126,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:47.212683','2019-03-18 01:19:47.212766',0,5,0),(127,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:47.718599','2019-03-18 01:19:47.718644',0,5,0),(128,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:48.135350','2019-03-18 01:19:48.135395',0,5,0),(129,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:48.565104','2019-03-18 01:19:48.565150',0,5,0),(130,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:48.987518','2019-03-18 01:19:48.987564',0,5,0),(131,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:49.388456','2019-03-18 01:19:49.388500',0,5,0),(132,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:49.796194','2019-03-18 01:19:49.796241',0,5,0),(133,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:50.236322','2019-03-18 01:19:50.236371',0,5,0),(134,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:51.121033','2019-03-18 01:19:51.121073',0,5,0),(135,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:57.077618','2019-03-18 01:19:57.077658',0,5,0),(136,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:57.581567','2019-03-18 01:19:57.581612',0,5,0),(137,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:58.139404','2019-03-18 01:19:58.139443',0,5,0),(138,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:58.594417','2019-03-18 01:19:58.594457',0,5,0),(139,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:59.063442','2019-03-18 01:19:59.063482',0,5,0),(140,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:59.467354','2019-03-18 01:19:59.467397',0,5,0),(141,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:19:59.861890','2019-03-18 01:19:59.861929',0,5,0),(142,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:00.834370','2019-03-18 01:20:00.834412',0,5,0),(143,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:01.988452','2019-03-18 01:20:01.988491',0,5,0),(144,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:02.479899','2019-03-18 01:20:02.480008',0,5,0),(145,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:02.932277','2019-03-18 01:20:02.932386',0,5,0),(146,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:03.485664','2019-03-18 01:20:03.485708',0,5,0),(147,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:03.937741','2019-03-18 01:20:03.937786',0,5,0),(148,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:04.703535','2019-03-18 01:20:04.703572',0,5,0),(149,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:05.139253','2019-03-18 01:20:05.139298',0,5,0),(150,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:05.605828','2019-03-18 01:20:05.605873',0,5,0),(151,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:06.153699','2019-03-18 01:20:06.153738',0,5,0),(152,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:06.572826','2019-03-18 01:20:06.572872',0,5,0),(153,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:07.247339','2019-03-18 01:20:07.247381',0,5,0),(154,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:20:23.463502','2019-03-18 01:20:23.463543',0,5,0),(155,'<built-in method random of Random object at 0x25aa998>','2019-03-18 01:21:22.600586','2019-03-18 01:21:22.600631',0,5,0),(156,'<built-in method random of Random object at 0xdb75f8>','2019-03-18 01:27:48.954805','2019-03-18 01:27:48.954851',0,5,0),(157,'<built-in method random of Random object at 0x263f8c8>','2019-03-18 02:34:19.417409','2019-03-18 02:34:19.417452',0,5,0),(158,'1552876643.3666692','2019-03-18 02:37:23.367204','2019-03-18 02:37:23.367248',0,5,0),(159,'1552889651.410804','2019-03-18 06:14:11.411442','2019-03-18 06:14:11.411490',0,5,0),(160,'1552894614.3883297','2019-03-18 07:36:54.389005','2019-03-18 07:36:54.389049',0,5,0),(161,'1552894680.6416488','2019-03-18 07:38:00.642375','2019-03-18 07:38:00.642417',0,5,0),(162,'1552894730.0467222','2019-03-18 07:38:50.047319','2019-03-18 07:38:50.047360',0,5,0),(163,'1552894904.40564','2019-03-18 07:41:44.406212','2019-03-18 07:41:44.406289',0,5,0),(164,'1552894955.4493124','2019-03-18 07:42:35.449980','2019-03-18 07:42:35.450024',0,5,0),(165,'1552895033.1986604','2019-03-18 07:43:53.199286','2019-03-18 07:43:53.199333',0,5,0),(166,'1552895111.9647384','2019-03-18 07:45:11.965515','2019-03-18 07:45:11.965562',0,5,0),(167,'1552895538.9606369','2019-03-18 07:52:18.961295','2019-03-18 07:52:18.961346',0,5,0),(168,'1552898456.0711513','2019-03-18 08:40:56.071749','2019-03-18 08:40:56.071792',0,5,0),(169,'1552898468.3756216','2019-03-18 08:41:08.376615','2019-03-18 08:41:08.376678',0,5,0),(170,'1552898470.3571742','2019-03-18 08:41:10.357882','2019-03-18 08:41:10.357962',0,5,0),(171,'1552898472.2086766','2019-03-18 08:41:12.209154','2019-03-18 08:41:12.209196',0,5,0),(172,'1552900515.557022','2019-03-18 09:15:15.557766','2019-03-18 09:15:15.557812',0,5,0),(173,'1552900516.9441655','2019-03-18 09:15:16.944663','2019-03-18 09:15:16.944703',0,5,0),(174,'1552962355.0638871','2019-03-19 02:25:55.064553','2019-03-19 02:25:55.064603',0,5,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `user_img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'不可能啊','15219358739','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-15 06:12:03.052657','icon_index_02.png'),(3,'不可能啊','15219358733','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-15 06:14:09.397080','icon_index_02.png'),(4,'1234','13912442345','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-15 06:22:15.783931','icon_index_02.png'),(5,'668','18813320064','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-15 08:02:59.772989','icon_index_02.png'),(8,'','','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-18 11:29:42.899337','icon_index_02.png'),(17,'123','15219353647','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-18 16:54:55.447495','icon_index_02.png'),(19,'125','15219353623','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-18 16:55:44.811518','icon_index_02.png'),(20,'158857','15813245364','e9e2aa8136260a22b0b09fdee43ccb8a','2019-03-18 17:00:37.680926','icon_index_02.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 11:18:09
