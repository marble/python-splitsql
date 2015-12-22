-- MySQL dump 10.11
--
-- Host: 127.0.0.3    Database: db123456_789
-- ------------------------------------------------------
-- Server version	5.0.51b-log

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
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
CREATE TABLE `be_groups` (
  `uid` int(11) unsigned NOT NULL auto_increment,
  `pid` int(11) unsigned NOT NULL default '0',
  `tstamp` int(11) unsigned NOT NULL default '0',
  `title` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `non_exclude_fields` text collate utf8_unicode_ci NOT NULL,
  `explicit_allowdeny` text collate utf8_unicode_ci NOT NULL,
  `allowed_languages` varchar(255) collate utf8_unicode_ci default '',
  `custom_options` text collate utf8_unicode_ci NOT NULL,
  `db_mountpoints` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `pagetypes_select` varchar(255) collate utf8_unicode_ci default '',
  `tables_select` text collate utf8_unicode_ci NOT NULL,
  `tables_modify` text collate utf8_unicode_ci NOT NULL,
  `crdate` int(11) unsigned NOT NULL default '0',
  `cruser_id` int(11) unsigned NOT NULL default '0',
  `groupMods` text collate utf8_unicode_ci NOT NULL,
  `file_mountpoints` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `hidden` tinyint(1) unsigned NOT NULL default '0',
  `inc_access_lists` tinyint(3) unsigned NOT NULL default '0',
  `description` text collate utf8_unicode_ci NOT NULL,
  `lockToDomain` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `deleted` tinyint(1) unsigned NOT NULL default '0',
  `TSconfig` text collate utf8_unicode_ci NOT NULL,
  `subgroup` varchar(255) collate utf8_unicode_ci default '',
  `hide_in_lists` tinyint(4) NOT NULL default '0',
  `workspace_perms` tinyint(3) NOT NULL default '1',
  `tx_templavoila_access` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`uid`),
  KEY `parent` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-08-06 23:41:52
