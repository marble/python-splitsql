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
-- Table structure for table `tx_templavoila_tmplobj`
--

DROP TABLE IF EXISTS `tx_templavoila_tmplobj`;
CREATE TABLE `tx_templavoila_tmplobj` (
  `uid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `t3ver_oid` int(11) NOT NULL default '0',
  `t3ver_id` int(11) NOT NULL default '0',
  `t3ver_wsid` int(11) NOT NULL default '0',
  `t3ver_label` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `t3ver_state` tinyint(4) NOT NULL default '0',
  `t3ver_stage` tinyint(4) NOT NULL default '0',
  `t3ver_count` int(11) NOT NULL default '0',
  `t3ver_tstamp` int(11) NOT NULL default '0',
  `t3_origuid` int(11) NOT NULL default '0',
  `tstamp` int(11) unsigned NOT NULL default '0',
  `crdate` int(11) unsigned NOT NULL default '0',
  `cruser_id` int(11) unsigned NOT NULL default '0',
  `fileref_mtime` int(11) unsigned NOT NULL default '0',
  `deleted` tinyint(4) unsigned NOT NULL default '0',
  `sorting` int(11) unsigned NOT NULL default '0',
  `title` varchar(60) collate utf8_unicode_ci NOT NULL default '',
  `datastructure` varchar(100) collate utf8_unicode_ci NOT NULL default '',
  `fileref` tinytext collate utf8_unicode_ci NOT NULL,
  `templatemapping` mediumtext collate utf8_unicode_ci NOT NULL,
  `previewicon` tinytext collate utf8_unicode_ci NOT NULL,
  `description` tinytext collate utf8_unicode_ci NOT NULL,
  `rendertype` varchar(10) collate utf8_unicode_ci NOT NULL default '',
  `sys_language_uid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `rendertype_ref` int(11) unsigned NOT NULL default '0',
  `localprocessing` text collate utf8_unicode_ci NOT NULL,
  `fileref_md5` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_templavoila_tmplobj`
--

LOCK TABLES `tx_templavoila_tmplobj` WRITE;
/*!40000 ALTER TABLE `tx_templavoila_tmplobj` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_templavoila_tmplobj` ENABLE KEYS */;
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
