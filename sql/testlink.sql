CREATE DATABASE /*!32312 IF NOT EXISTS*/ `testlink`;
USE `testlink`;
-- MySQL dump 10.13  Distrib 5.1.37, for apple-darwin10.0.0 (i386)
--
-- Host: localhost    Database: testlink
-- ------------------------------------------------------
-- Server version	5.1.37

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
-- Table structure for table `assignment_status`
--

DROP TABLE IF EXISTS `assignment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_status`
--

LOCK TABLES `assignment_status` WRITE;
/*!40000 ALTER TABLE `assignment_status` DISABLE KEYS */;
INSERT INTO `assignment_status` (`id`, `description`) VALUES (1,'open');
INSERT INTO `assignment_status` (`id`, `description`) VALUES (2,'closed');
INSERT INTO `assignment_status` (`id`, `description`) VALUES (3,'completed');
INSERT INTO `assignment_status` (`id`, `description`) VALUES (4,'todo_urgent');
INSERT INTO `assignment_status` (`id`, `description`) VALUES (5,'todo');
/*!40000 ALTER TABLE `assignment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_types`
--

DROP TABLE IF EXISTS `assignment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_table` varchar(30) DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_types`
--

LOCK TABLES `assignment_types` WRITE;
/*!40000 ALTER TABLE `assignment_types` DISABLE KEYS */;
INSERT INTO `assignment_types` (`id`, `fk_table`, `description`) VALUES (1,'testplan_tcversions','testcase_execution');
INSERT INTO `assignment_types` (`id`, `fk_table`, `description`) VALUES (2,'tcversions','testcase_review');
/*!40000 ALTER TABLE `assignment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fk_table` varchar(250) DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_path` varchar(250) DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` longblob,
  `compression_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builds`
--

DROP TABLE IF EXISTS `builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  `notes` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `release_date` date DEFAULT NULL,
  `closed_on_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`testplan_id`,`name`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available builds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builds`
--

LOCK TABLES `builds` WRITE;
/*!40000 ALTER TABLE `builds` DISABLE KEYS */;
/*!40000 ALTER TABLE `builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_design_values`
--

DROP TABLE IF EXISTS `cfield_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_design_values` (
  `field_id` int(10) NOT NULL DEFAULT '0',
  `node_id` int(10) NOT NULL DEFAULT '0',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_design_values` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_design_values`
--

LOCK TABLES `cfield_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_execution_values`
--

DROP TABLE IF EXISTS `cfield_execution_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT '0',
  `execution_id` int(10) NOT NULL DEFAULT '0',
  `testplan_id` int(10) NOT NULL DEFAULT '0',
  `tcversion_id` int(10) NOT NULL DEFAULT '0',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_execution_values`
--

LOCK TABLES `cfield_execution_values` WRITE;
/*!40000 ALTER TABLE `cfield_execution_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_execution_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_node_types`
--

DROP TABLE IF EXISTS `cfield_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_node_types` (
  `field_id` int(10) NOT NULL DEFAULT '0',
  `node_type_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`node_type_id`),
  KEY `idx_custom_fields_assign` (`node_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_node_types`
--

LOCK TABLES `cfield_node_types` WRITE;
/*!40000 ALTER TABLE `cfield_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testplan_design_values`
--

DROP TABLE IF EXISTS `cfield_testplan_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testplan_design_values` (
  `field_id` int(10) NOT NULL DEFAULT '0',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT 'point to testplan_tcversion id',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`link_id`),
  KEY `idx_cfield_tplan_design_val` (`link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testplan_design_values`
--

LOCK TABLES `cfield_testplan_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_testplan_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testplan_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testprojects`
--

DROP TABLE IF EXISTS `cfield_testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testprojects` (
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `testproject_id` int(10) unsigned NOT NULL DEFAULT '0',
  `display_order` smallint(5) unsigned NOT NULL DEFAULT '1',
  `location` smallint(5) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `required_on_design` tinyint(1) NOT NULL DEFAULT '0',
  `required_on_execution` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`testproject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testprojects`
--

LOCK TABLES `cfield_testprojects` WRITE;
/*!40000 ALTER TABLE `cfield_testprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(64) NOT NULL DEFAULT '' COMMENT 'label to display on user interface',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `possible_values` varchar(4000) NOT NULL DEFAULT '',
  `default_value` varchar(4000) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `length_min` int(10) NOT NULL DEFAULT '0',
  `length_max` int(10) NOT NULL DEFAULT '0',
  `show_on_design` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enable_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_custom_fields_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` varchar(50) NOT NULL DEFAULT 'unknown',
  `upgrade_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` (`version`, `upgrade_ts`, `notes`) VALUES ('DB 1.4','2012-06-05 17:38:16','TestLink 1.9.1');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL DEFAULT '0',
  `log_level` smallint(5) unsigned NOT NULL DEFAULT '0',
  `source` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `fired_at` int(10) unsigned NOT NULL DEFAULT '0',
  `activity` varchar(45) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `fired_at` (`fired_at`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (1,1,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1338914684,'LOGIN',1,'users');
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (2,2,2,'GUI','No project found: Assume a new installation and redirect to create it',1338914684,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (3,3,2,'GUI','E_NOTICE\nUndefined property: CKEditor::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338914687,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (4,4,2,'GUI','No project found: Assume a new installation and redirect to create it',1338915280,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (5,5,2,'GUI','E_NOTICE\nUndefined property: CKEditor::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338915280,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (6,6,2,'GUI','No project found: Assume a new installation and redirect to create it',1338915331,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (7,7,2,'GUI','E_WARNING\nMissing argument 2 for CKeditorWrapper::__construct(), called in /Users/andy/Works/Gabi/testlink/testlink/lib/functions/web_editor.php on line 114 and defined - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 9',1338915331,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (8,7,2,'GUI','E_NOTICE\nUndefined variable: name - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 10',1338915331,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (9,8,2,'GUI','No project found: Assume a new installation and redirect to create it',1338915353,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (10,9,2,'GUI','E_WARNING\nMissing argument 2 for CKeditorWrapper::__construct(), called in /Users/andy/Works/Gabi/testlink/testlink/lib/functions/web_editor.php on line 114 and defined - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 9',1338915354,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (11,9,2,'GUI','E_NOTICE\nUndefined variable: name - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 10',1338915354,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (12,9,2,'GUI','E_NOTICE\nUndefined property: CKeditorWrapper::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338915354,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (13,9,2,'GUI','E_NOTICE\nUndefined variable: ckeditor - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 19',1338915354,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (14,10,2,'GUI','No project found: Assume a new installation and redirect to create it',1338915367,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (15,11,2,'GUI','E_WARNING\nMissing argument 2 for CKeditorWrapper::__construct(), called in /Users/andy/Works/Gabi/testlink/testlink/lib/functions/web_editor.php on line 114 and defined - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 9',1338915367,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (16,11,2,'GUI','E_NOTICE\nUndefined variable: name - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 10',1338915367,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (17,11,2,'GUI','E_NOTICE\nUndefined property: CKeditorWrapper::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338915367,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (18,12,2,'GUI','No project found: Assume a new installation and redirect to create it',1338916432,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (19,13,2,'GUI','No project found: Assume a new installation and redirect to create it',1338916800,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (20,14,2,'GUI','No project found: Assume a new installation and redirect to create it',1338916974,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (21,15,2,'GUI','E_WARNING\nMissing argument 2 for CKeditorWrapper::__construct(), called in /Users/andy/Works/Gabi/testlink/testlink/lib/functions/web_editor.php on line 114 and defined - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 9',1338916974,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (22,15,2,'GUI','E_NOTICE\nUndefined variable: name - in /Users/andy/Works/Gabi/testlink/testlink/third_party/ckeditor/wrapper.php - Line 10',1338916974,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (23,15,2,'GUI','E_NOTICE\nUndefined property: CKeditorWrapper::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338916974,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (24,16,2,'GUI','No project found: Assume a new installation and redirect to create it',1338917353,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (25,17,2,'GUI','E_NOTICE\nUndefined property: CKeditorWrapper::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338917353,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (26,18,2,'GUI','No project found: Assume a new installation and redirect to create it',1338917489,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (27,19,2,'GUI','E_NOTICE\nUndefined property: CKeditorWrapper::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338917489,'PHP',NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (28,20,2,'GUI','No project found: Assume a new installation and redirect to create it',1338922068,NULL,NULL,NULL);
INSERT INTO `events` (`id`, `transaction_id`, `log_level`, `source`, `description`, `fired_at`, `activity`, `object_id`, `object_type`) VALUES (29,21,2,'GUI','E_NOTICE\nUndefined property: CKeditorWrapper::$InstanceName - in /Users/andy/Works/Gabi/testlink/testlink/lib/project/projectEdit.php - Line 132',1338922068,'PHP',NULL,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_bugs`
--

DROP TABLE IF EXISTS `execution_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_bugs` (
  `execution_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` varchar(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`execution_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_bugs`
--

LOCK TABLES `execution_bugs` WRITE;
/*!40000 ALTER TABLE `execution_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executions`
--

DROP TABLE IF EXISTS `executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `build_id` int(10) NOT NULL DEFAULT '0',
  `tester_id` int(10) unsigned DEFAULT NULL,
  `execution_ts` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tcversion_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `platform_id` int(10) unsigned NOT NULL DEFAULT '0',
  `execution_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 -> manual, 2 -> automated',
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `executions_idx1` (`testplan_id`,`tcversion_id`,`platform_id`,`build_id`),
  KEY `executions_idx2` (`execution_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executions`
--

LOCK TABLES `executions` WRITE;
/*!40000 ALTER TABLE `executions` DISABLE KEYS */;
/*!40000 ALTER TABLE `executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testproject_id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `content` text,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `inventory_idx1` (`testproject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `testproject_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `testproject_id` (`testproject_id`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target_date` date DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `a` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `b` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `c` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_testplan_id` (`name`,`testplan_id`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_types`
--

DROP TABLE IF EXISTS `node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'testproject',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_types`
--

LOCK TABLES `node_types` WRITE;
/*!40000 ALTER TABLE `node_types` DISABLE KEYS */;
INSERT INTO `node_types` (`id`, `description`) VALUES (1,'testproject');
INSERT INTO `node_types` (`id`, `description`) VALUES (2,'testsuite');
INSERT INTO `node_types` (`id`, `description`) VALUES (3,'testcase');
INSERT INTO `node_types` (`id`, `description`) VALUES (4,'testcase_version');
INSERT INTO `node_types` (`id`, `description`) VALUES (5,'testplan');
INSERT INTO `node_types` (`id`, `description`) VALUES (6,'requirement_spec');
INSERT INTO `node_types` (`id`, `description`) VALUES (7,'requirement');
INSERT INTO `node_types` (`id`, `description`) VALUES (8,'requirement_version');
INSERT INTO `node_types` (`id`, `description`) VALUES (9,'testcase_step');
INSERT INTO `node_types` (`id`, `description`) VALUES (10,'requirement_revision');
/*!40000 ALTER TABLE `node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes_hierarchy`
--

DROP TABLE IF EXISTS `nodes_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes_hierarchy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `node_type_id` int(10) unsigned NOT NULL DEFAULT '1',
  `node_order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_m_nodeorder` (`parent_id`,`node_order`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes_hierarchy`
--

LOCK TABLES `nodes_hierarchy` WRITE;
/*!40000 ALTER TABLE `nodes_hierarchy` DISABLE KEYS */;
INSERT INTO `nodes_hierarchy` (`id`, `name`, `parent_id`, `node_type_id`, `node_order`) VALUES (1,'Ace thing',NULL,1,1);
/*!40000 ALTER TABLE `nodes_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_keywords`
--

DROP TABLE IF EXISTS `object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fk_table` varchar(30) DEFAULT '',
  `keyword_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_keywords`
--

LOCK TABLES `object_keywords` WRITE;
/*!40000 ALTER TABLE `object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_platforms` (`testproject_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_coverage`
--

DROP TABLE IF EXISTS `req_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_coverage` (
  `req_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  KEY `req_testcase` (`req_id`,`testcase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='relation test case ** requirements';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_coverage`
--

LOCK TABLES `req_coverage` WRITE;
/*!40000 ALTER TABLE `req_coverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_relations`
--

DROP TABLE IF EXISTS `req_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_relations`
--

LOCK TABLES `req_relations` WRITE;
/*!40000 ALTER TABLE `req_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_revisions`
--

DROP TABLE IF EXISTS `req_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT '1',
  `req_doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `expected_coverage` int(10) NOT NULL DEFAULT '1',
  `log_message` text,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_revisions`
--

LOCK TABLES `req_revisions` WRITE;
/*!40000 ALTER TABLE `req_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs`
--

DROP TABLE IF EXISTS `req_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_specs` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `doc_id` varchar(64) NOT NULL,
  `scope` text,
  `total_req` int(10) NOT NULL DEFAULT '0',
  `type` char(1) DEFAULT 'n',
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_spec_uk1` (`doc_id`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Dev. Documents (e.g. System Requirements Specification)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs`
--

LOCK TABLES `req_specs` WRITE;
/*!40000 ALTER TABLE `req_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_versions`
--

DROP TABLE IF EXISTS `req_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_versions` (
  `id` int(10) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT '1',
  `revision` smallint(5) unsigned NOT NULL DEFAULT '1',
  `scope` text,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `expected_coverage` int(10) NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_versions`
--

LOCK TABLES `req_versions` WRITE;
/*!40000 ALTER TABLE `req_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirements` (
  `id` int(10) unsigned NOT NULL,
  `srs_id` int(10) unsigned NOT NULL,
  `req_doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requirements_req_doc_id` (`srs_id`,`req_doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rights_descr` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` (`id`, `description`) VALUES (1,'testplan_execute');
INSERT INTO `rights` (`id`, `description`) VALUES (2,'testplan_create_build');
INSERT INTO `rights` (`id`, `description`) VALUES (3,'testplan_metrics');
INSERT INTO `rights` (`id`, `description`) VALUES (4,'testplan_planning');
INSERT INTO `rights` (`id`, `description`) VALUES (5,'testplan_user_role_assignment');
INSERT INTO `rights` (`id`, `description`) VALUES (6,'mgt_view_tc');
INSERT INTO `rights` (`id`, `description`) VALUES (7,'mgt_modify_tc');
INSERT INTO `rights` (`id`, `description`) VALUES (8,'mgt_view_key');
INSERT INTO `rights` (`id`, `description`) VALUES (9,'mgt_modify_key');
INSERT INTO `rights` (`id`, `description`) VALUES (10,'mgt_view_req');
INSERT INTO `rights` (`id`, `description`) VALUES (11,'mgt_modify_req');
INSERT INTO `rights` (`id`, `description`) VALUES (12,'mgt_modify_product');
INSERT INTO `rights` (`id`, `description`) VALUES (13,'mgt_users');
INSERT INTO `rights` (`id`, `description`) VALUES (14,'role_management');
INSERT INTO `rights` (`id`, `description`) VALUES (15,'user_role_assignment');
INSERT INTO `rights` (`id`, `description`) VALUES (16,'mgt_testplan_create');
INSERT INTO `rights` (`id`, `description`) VALUES (17,'cfield_view');
INSERT INTO `rights` (`id`, `description`) VALUES (18,'cfield_management');
INSERT INTO `rights` (`id`, `description`) VALUES (19,'system_configuration');
INSERT INTO `rights` (`id`, `description`) VALUES (20,'mgt_view_events');
INSERT INTO `rights` (`id`, `description`) VALUES (21,'mgt_view_usergroups');
INSERT INTO `rights` (`id`, `description`) VALUES (22,'events_mgt');
INSERT INTO `rights` (`id`, `description`) VALUES (23,'testproject_user_role_assignment');
INSERT INTO `rights` (`id`, `description`) VALUES (24,'platform_management');
INSERT INTO `rights` (`id`, `description`) VALUES (25,'platform_view');
INSERT INTO `rights` (`id`, `description`) VALUES (26,'project_inventory_management');
INSERT INTO `rights` (`id`, `description`) VALUES (27,'project_inventory_view');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_assignments`
--

DROP TABLE IF EXISTS `risk_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `node_id` int(10) unsigned NOT NULL DEFAULT '0',
  `risk` char(1) NOT NULL DEFAULT '2',
  `importance` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`),
  UNIQUE KEY `risk_assignments_tplan_node_id` (`testplan_id`,`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_assignments`
--

LOCK TABLES `risk_assignments` WRITE;
/*!40000 ALTER TABLE `risk_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_rights`
--

DROP TABLE IF EXISTS `role_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_rights` (
  `role_id` int(10) NOT NULL DEFAULT '0',
  `right_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`right_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_rights`
--

LOCK TABLES `role_rights` WRITE;
/*!40000 ALTER TABLE `role_rights` DISABLE KEYS */;
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (4,3);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (4,6);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (4,7);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (4,8);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (4,9);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (4,10);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (4,11);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (5,3);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (5,6);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (5,8);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,1);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,2);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,3);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,6);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,7);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,8);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,9);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,11);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,25);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (6,27);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (7,1);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (7,3);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (7,6);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (7,8);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,1);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,2);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,3);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,4);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,5);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,6);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,7);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,8);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,9);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,10);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,11);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,12);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,13);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,14);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,15);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,16);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,17);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,18);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,19);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,20);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,21);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,22);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,23);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,24);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,25);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,26);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (8,27);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,1);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,2);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,3);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,4);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,5);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,6);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,7);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,8);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,9);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,10);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,11);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,15);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,16);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,24);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,25);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,26);
INSERT INTO `role_rights` (`role_id`, `right_id`) VALUES (9,27);
/*!40000 ALTER TABLE `role_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_rights_roles_descr` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (1,'<reserved system role 1>',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (2,'<reserved system role 2>',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (3,'<no rights>',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (4,'test designer',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (5,'guest',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (6,'senior tester',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (7,'tester',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (8,'admin',NULL);
INSERT INTO `roles` (`id`, `description`, `notes`) VALUES (9,'leader',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcsteps`
--

DROP TABLE IF EXISTS `tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcsteps` (
  `id` int(10) unsigned NOT NULL,
  `step_number` int(11) NOT NULL DEFAULT '1',
  `actions` text,
  `expected_results` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `execution_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 -> manual, 2 -> automated',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcsteps`
--

LOCK TABLES `tcsteps` WRITE;
/*!40000 ALTER TABLE `tcsteps` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcversions`
--

DROP TABLE IF EXISTS `tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcversions` (
  `id` int(10) unsigned NOT NULL,
  `tc_external_id` int(10) unsigned DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT '1',
  `layout` smallint(5) unsigned NOT NULL DEFAULT '1',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1',
  `summary` text,
  `preconditions` text,
  `importance` smallint(5) unsigned NOT NULL DEFAULT '2',
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updater_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `execution_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 -> manual, 2 -> automated',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcversions`
--

LOCK TABLES `tcversions` WRITE;
/*!40000 ALTER TABLE `tcversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_keywords`
--

DROP TABLE IF EXISTS `testcase_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_keywords` (
  `testcase_id` int(10) unsigned NOT NULL DEFAULT '0',
  `keyword_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`testcase_id`,`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_keywords`
--

LOCK TABLES `testcase_keywords` WRITE;
/*!40000 ALTER TABLE `testcase_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_platforms`
--

DROP TABLE IF EXISTS `testplan_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL,
  `platform_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_testplan_platforms` (`testplan_id`,`platform_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Connects a testplan with platforms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_platforms`
--

LOCK TABLES `testplan_platforms` WRITE;
/*!40000 ALTER TABLE `testplan_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplan_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_tcversions`
--

DROP TABLE IF EXISTS `testplan_tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_tcversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT '0',
  `node_order` int(10) unsigned NOT NULL DEFAULT '1',
  `urgency` smallint(5) NOT NULL DEFAULT '2',
  `platform_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplan_tcversions_tplan_tcversion` (`testplan_id`,`tcversion_id`,`platform_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_tcversions`
--

LOCK TABLES `testplan_tcversions` WRITE;
/*!40000 ALTER TABLE `testplan_tcversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplan_tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans`
--

DROP TABLE IF EXISTS `testplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `testplans_testproject_id_active` (`testproject_id`,`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans`
--

LOCK TABLES `testplans` WRITE;
/*!40000 ALTER TABLE `testplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testprojects`
--

DROP TABLE IF EXISTS `testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testprojects` (
  `id` int(10) unsigned NOT NULL,
  `notes` text,
  `color` varchar(12) NOT NULL DEFAULT '#9BD',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `option_reqs` tinyint(1) NOT NULL DEFAULT '0',
  `option_priority` tinyint(1) NOT NULL DEFAULT '0',
  `option_automation` tinyint(1) NOT NULL DEFAULT '0',
  `options` text,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) unsigned NOT NULL DEFAULT '0',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testprojects_prefix` (`prefix`),
  KEY `testprojects_id_active` (`id`,`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testprojects`
--

LOCK TABLES `testprojects` WRITE;
/*!40000 ALTER TABLE `testprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsuites`
--

DROP TABLE IF EXISTS `testsuites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testsuites` (
  `id` int(10) unsigned NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsuites`
--

LOCK TABLES `testsuites` WRITE;
/*!40000 ALTER TABLE `testsuites` DISABLE KEYS */;
/*!40000 ALTER TABLE `testsuites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_point` varchar(45) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (1,'/login.php',1338914684,1338914684,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (2,'/lib/general/mainPage.php',1338914684,1338914684,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (3,'/lib/project/projectEdit.php',1338914687,1338914687,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (4,'/lib/general/mainPage.php',1338915280,1338915280,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (5,'/lib/project/projectEdit.php',1338915280,1338915280,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (6,'/lib/general/mainPage.php',1338915331,1338915331,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (7,'/lib/project/projectEdit.php',1338915331,1338915331,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (8,'/lib/general/mainPage.php',1338915353,1338915353,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (9,'/lib/project/projectEdit.php',1338915354,1338915354,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (10,'/lib/general/mainPage.php',1338915367,1338915367,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (11,'/lib/project/projectEdit.php',1338915367,1338915367,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (12,'/lib/general/mainPage.php',1338916432,1338916432,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (13,'/lib/general/mainPage.php',1338916800,1338916800,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (14,'/lib/general/mainPage.php',1338916974,1338916974,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (15,'/lib/project/projectEdit.php',1338916974,1338916974,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (16,'/lib/general/mainPage.php',1338917353,1338917353,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (17,'/lib/project/projectEdit.php',1338917353,1338917353,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (18,'/lib/general/mainPage.php',1338917489,1338917489,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (19,'/lib/project/projectEdit.php',1338917489,1338917489,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (20,'/lib/general/mainPage.php',1338922068,1338922068,1,'f94fde3b56f4259274706c57789330f7');
INSERT INTO `transactions` (`id`, `entry_point`, `start_time`, `end_time`, `user_id`, `session_id`) VALUES (21,'/lib/project/projectEdit.php',1338922068,1338922068,1,'f94fde3b56f4259274706c57789330f7');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_assignments`
--

DROP TABLE IF EXISTS `user_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '1',
  `feature_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned DEFAULT '0',
  `build_id` int(10) unsigned DEFAULT '0',
  `deadline_ts` datetime DEFAULT NULL,
  `assigner_id` int(10) unsigned DEFAULT '0',
  `creation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_assignments_feature_id` (`feature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assignments`
--

LOCK TABLES `user_assignments` WRITE;
/*!40000 ALTER TABLE `user_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_group` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_assign`
--

DROP TABLE IF EXISTS `user_group_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_assign` (
  `usergroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `idx_user_group_assign` (`usergroup_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_assign`
--

LOCK TABLES `user_group_assign` WRITE;
/*!40000 ALTER TABLE `user_group_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testplan_roles`
--

DROP TABLE IF EXISTS `user_testplan_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testplan_roles` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `testplan_id` int(10) NOT NULL DEFAULT '0',
  `role_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`testplan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testplan_roles`
--

LOCK TABLES `user_testplan_roles` WRITE;
/*!40000 ALTER TABLE `user_testplan_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_testplan_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testproject_roles`
--

DROP TABLE IF EXISTS `user_testproject_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testproject_roles` (
  `user_id` int(10) NOT NULL DEFAULT '0',
  `testproject_id` int(10) NOT NULL DEFAULT '0',
  `role_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`testproject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testproject_roles`
--

LOCK TABLES `user_testproject_roles` WRITE;
/*!40000 ALTER TABLE `user_testproject_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_testproject_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `first` varchar(30) NOT NULL DEFAULT '',
  `last` varchar(30) NOT NULL DEFAULT '',
  `locale` varchar(10) NOT NULL DEFAULT 'en_GB',
  `default_testproject_id` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `script_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='User information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `login`, `password`, `role_id`, `email`, `first`, `last`, `locale`, `default_testproject_id`, `active`, `script_key`) VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',8,'','Testlink','Administrator','en_GB',NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'testlink'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-06-05 20:01:22
