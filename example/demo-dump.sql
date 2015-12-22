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

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  `ses_name` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  `ses_iplock` varchar(39) collate utf8_unicode_ci NOT NULL default '',
  `ses_hashlock` int(11) NOT NULL default '0',
  `ses_userid` int(11) unsigned NOT NULL default '0',
  `ses_tstamp` int(11) unsigned NOT NULL default '0',
  `ses_data` longtext collate utf8_unicode_ci NOT NULL,
  `ses_backuserid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ses_id`,`ses_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
INSERT INTO `be_sessions` VALUES ('039555ce936fc6878d7012075bed6f44','be_typo_user','87.123.205.2',230214231,1,1216911277,'',0);
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
CREATE TABLE `be_users` (
  `uid` int(11) unsigned NOT NULL auto_increment,
  `pid` int(11) unsigned NOT NULL default '0',
  `tstamp` int(11) unsigned NOT NULL default '0',
  `username` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `password` varchar(40) collate utf8_unicode_ci NOT NULL default '',
  `admin` tinyint(4) unsigned NOT NULL default '0',
  `usergroup` varchar(255) collate utf8_unicode_ci default '',
  `disable` tinyint(1) unsigned NOT NULL default '0',
  `starttime` int(11) unsigned NOT NULL default '0',
  `endtime` int(11) unsigned NOT NULL default '0',
  `lang` char(2) collate utf8_unicode_ci NOT NULL default '',
  `email` varchar(80) collate utf8_unicode_ci NOT NULL default '',
  `db_mountpoints` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `options` tinyint(4) unsigned NOT NULL default '0',
  `crdate` int(11) unsigned NOT NULL default '0',
  `cruser_id` int(11) unsigned NOT NULL default '0',
  `realName` varchar(80) collate utf8_unicode_ci NOT NULL default '',
  `userMods` varchar(255) collate utf8_unicode_ci default '',
  `allowed_languages` varchar(255) collate utf8_unicode_ci default '',
  `uc` text collate utf8_unicode_ci NOT NULL,
  `file_mountpoints` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `fileoper_perms` tinyint(4) NOT NULL default '0',
  `workspace_perms` tinyint(3) NOT NULL default '1',
  `lockToDomain` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `disableIPlock` tinyint(1) unsigned NOT NULL default '0',
  `deleted` tinyint(1) unsigned NOT NULL default '0',
  `TSconfig` text collate utf8_unicode_ci NOT NULL,
  `lastlogin` int(10) unsigned NOT NULL default '0',
  `createdByAction` int(11) NOT NULL default '0',
  `usergroup_cached_list` varchar(255) collate utf8_unicode_ci default '',
  `workspace_id` int(11) NOT NULL default '0',
  `workspace_preview` tinyint(3) NOT NULL default '1',
  PRIMARY KEY  (`uid`),
  KEY `parent` (`pid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1198143277,'speedy','29879872979279285bd16642bf29af94',1,'',0,0,0,'','','',0,1198138069,0,'','','','a:22:{s:14:\"interfaceSetup\";s:7:\"backend\";s:10:\"moduleData\";a:12:{s:12:\"alt_menu.php\";a:0:{}s:11:\"tools_dbint\";a:3:{s:8:\"function\";s:8:\"refindex\";s:6:\"search\";s:3:\"raw\";s:22:\"search_query_makeQuery\";s:3:\"all\";}s:8:\"tools_em\";a:11:{s:8:\"function\";s:28:\"tx_terupdatecheck41_modfunc1\";s:9:\"listOrder\";s:3:\"cat\";s:15:\"display_details\";s:1:\"1\";s:13:\"singleDetails\";s:4:\"info\";s:17:\"selectedLanguages\";s:19:\"a:1:{i:0;s:2:\"de\";}\";s:10:\"extMirrors\";s:2321:\"a:7:{s:9:\"typo3.org\";a:5:{s:5:\"title\";s:25:\"TYPO3.org Main Repository\";s:4:\"host\";s:9:\"typo3.org\";s:4:\"path\";s:15:\"/fileadmin/ter/\";s:7:\"country\";s:3:\"DEU\";s:7:\"sponsor\";a:3:{s:4:\"name\";s:13:\"punkt.de GmbH\";s:4:\"link\";s:16:\"http://punkt.de/\";s:4:\"logo\";s:64:\"http://www.typo3.org/fileadmin/templates/images/logo-punktde.gif\";}}s:22:\"ter.rz.tu-clausthal.de\";a:5:{s:5:\"title\";s:17:\"DE Mirror 1 (DFN)\";s:4:\"host\";s:22:\"ter.rz.tu-clausthal.de\";s:4:\"path\";s:5:\"/ter/\";s:7:\"country\";s:3:\"DEU\";s:7:\"sponsor\";a:3:{s:4:\"name\";s:12:\"TU Clausthal\";s:4:\"link\";s:27:\"http://www.tu-clausthal.de/\";s:4:\"logo\";s:69:\"http://www.typo3.org/fileadmin/templates/images/logo-tu-clausthal.gif\";}}s:15:\"ter.mittwald.de\";a:5:{s:5:\"title\";s:11:\"DE Mirror 2\";s:4:\"host\";s:15:\"ter.mittwald.de\";s:4:\"path\";s:5:\"/ter/\";s:7:\"country\";s:3:\"DEU\";s:7:\"sponsor\";a:3:{s:4:\"name\";s:26:\"mittwaldmedien CM Services\";s:4:\"link\";s:23:\"http://www.mittwald.de/\";s:4:\"logo\";s:65:\"http://www.typo3.org/fileadmin/templates/images/logo-mittwald.gif\";}}s:17:\"ter.sitedesign.dk\";a:5:{s:5:\"title\";s:11:\"DK Mirror 1\";s:4:\"host\";s:17:\"ter.sitedesign.dk\";s:4:\"path\";s:5:\"/ter/\";s:7:\"country\";s:3:\"DNK\";s:7:\"sponsor\";a:3:{s:4:\"name\";s:13:\"siteDesign.dk\";s:4:\"link\";s:21:\"http://siteDesign.dk/\";s:4:\"logo\";s:69:\"http://www.typo3.org/fileadmin/templates/images/logo-sitedesigndk.gif\";}}s:10:\"ter.tue.nl\";a:5:{s:5:\"title\";s:11:\"NL Mirror 1\";s:4:\"host\";s:10:\"ter.tue.nl\";s:4:\"path\";s:1:\"/\";s:7:\"country\";s:3:\"NLD\";s:7:\"sponsor\";a:3:{s:4:\"name\";s:12:\"TU Eindhoven\";s:4:\"link\";s:18:\"http://www.tue.nl/\";s:4:\"logo\";s:69:\"http://www.typo3.org/fileadmin/templates/images/logo-tu-eindhoven.gif\";}}s:28:\"mirror-typo3.vinehosting.com\";a:5:{s:5:\"title\";s:16:\"US Mirror 1 (NJ)\";s:4:\"host\";s:28:\"mirror-typo3.vinehosting.com\";s:4:\"path\";s:5:\"/ter/\";s:7:\"country\";s:3:\"USA\";s:7:\"sponsor\";a:3:{s:4:\"name\";s:11:\"VineHosting\";s:4:\"link\";s:27:\"http://www.Vinehosting.com/\";s:4:\"logo\";s:68:\"http://www.typo3.org/fileadmin/templates/images/logo-vinehosting.gif\";}}s:18:\"ter.cannonbose.com\";a:5:{s:5:\"title\";s:16:\"US Mirror 2 (TX)\";s:4:\"host\";s:18:\"ter.cannonbose.com\";s:4:\"path\";s:5:\"/ter/\";s:7:\"country\";s:3:\"USA\";s:7:\"sponsor\";a:3:{s:4:\"name\";s:10:\"CannonBose\";s:4:\"link\";s:26:\"http://www.cannonbose.com/\";s:4:\"logo\";s:67:\"http://www.typo3.org/fileadmin/templates/images/logo-cannonbose.gif\";}}}\";s:17:\"display_unchecked\";s:2:\"on\";s:13:\"mirrorListURL\";s:44:\"http://repositories.typo3.org/mirrors.xml.gz\";s:34:\"tx_ter_update_check_display_devupd\";s:1:\"1\";s:37:\"tx_ter_update_check_display_installed\";s:1:\"1\";s:11:\"display_shy\";s:1:\"1\";}s:12:\"tools_config\";a:1:{s:8:\"function\";s:1:\"0\";}s:9:\"xMod_test\";a:1:{s:19:\"constant_editor_cat\";s:5:\"basic\";}s:8:\"web_list\";a:1:{s:15:\"bigControlPanel\";s:1:\"1\";}s:16:\"xMOD_alt_doc.php\";a:0:{}s:11:\"alt_doc.php\";a:2:{i:0;a:0:{}i:1;s:32:\"e5fdc1cc0d1bed1632e94473175bcb61\";}s:19:\"web_txtemplavoilaM1\";a:1:{s:8:\"language\";s:1:\"0\";}s:6:\"web_ts\";a:1:{s:8:\"function\";s:20:\"tx_tstemplateceditor\";}s:19:\"web_txtemplavoilaM2\";a:0:{}s:8:\"web_perm\";a:2:{s:5:\"depth\";s:1:\"1\";s:4:\"mode\";s:1:\"0\";}}s:19:\"thumbnailsByDefault\";N;s:14:\"emailMeAtLogin\";N;s:13:\"condensedMode\";N;s:10:\"noMenuMode\";s:0:\"\";s:17:\"startInTaskCenter\";N;s:18:\"hideSubmoduleIcons\";i:0;s:8:\"helpText\";s:2:\"on\";s:8:\"titleLen\";i:30;s:17:\"edit_wideDocument\";N;s:18:\"edit_showFieldHelp\";s:4:\"icon\";s:8:\"edit_RTE\";s:2:\"on\";s:20:\"edit_docModuleUpload\";s:2:\"on\";s:15:\"disableCMlayers\";N;s:13:\"navFrameWidth\";s:0:\"\";s:17:\"navFrameResizable\";i:0;s:4:\"lang\";s:2:\"de\";s:15:\"moduleSessionID\";a:11:{s:11:\"tools_dbint\";s:32:\"76f21a0fb870d44d0ce43542e83efcc9\";s:8:\"tools_em\";s:32:\"039555ce936fc6878d7012075bed6f44\";s:12:\"tools_config\";s:32:\"76f21a0fb870d44d0ce43542e83efcc9\";s:9:\"xMod_test\";s:32:\"76f21a0fb870d44d0ce43542e83efcc9\";s:8:\"web_list\";s:32:\"76f21a0fb870d44d0ce43542e83efcc9\";s:16:\"xMOD_alt_doc.php\";s:32:\"76f21a0fb870d44d0ce43542e83efcc9\";s:11:\"alt_doc.php\";s:32:\"76f21a0fb870d44d0ce43542e83efcc9\";s:19:\"web_txtemplavoilaM1\";s:32:\"70790d88d4c919280e1d6c528c426317\";s:6:\"web_ts\";s:32:\"70790d88d4c919280e1d6c528c426317\";s:19:\"web_txtemplavoilaM2\";s:32:\"70790d88d4c919280e1d6c528c426317\";s:8:\"web_perm\";s:32:\"70790d88d4c919280e1d6c528c426317\";}s:10:\"copyLevels\";i:0;s:15:\"recursiveDelete\";N;s:11:\"browseTrees\";a:1:{s:11:\"browsePages\";s:24:\"a:1:{i:0;a:1:{i:0;i:1;}}\";}}','',7,1,'',0,0,'',1216910954,0,'',0,1);
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_staticinfotables_hotlist`
--

DROP TABLE IF EXISTS `tx_staticinfotables_hotlist`;
CREATE TABLE `tx_staticinfotables_hotlist` (
  `uid_local` int(11) unsigned NOT NULL default '0',
  `tablenames` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `application` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `sorting` bigint(20) unsigned NOT NULL default '0',
  KEY `uid_local` (`uid_local`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_staticinfotables_hotlist`
--

LOCK TABLES `tx_staticinfotables_hotlist` WRITE;
/*!40000 ALTER TABLE `tx_staticinfotables_hotlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_staticinfotables_hotlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_templavoila_datastructure`
--

DROP TABLE IF EXISTS `tx_templavoila_datastructure`;
CREATE TABLE `tx_templavoila_datastructure` (
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
  `deleted` tinyint(4) unsigned NOT NULL default '0',
  `sorting` int(11) unsigned NOT NULL default '0',
  `title` varchar(60) collate utf8_unicode_ci NOT NULL default '',
  `dataprot` mediumtext collate utf8_unicode_ci NOT NULL,
  `scope` tinyint(4) unsigned NOT NULL default '0',
  `previewicon` tinytext collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`uid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `parent` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tx_templavoila_datastructure`
--

LOCK TABLES `tx_templavoila_datastructure` WRITE;
/*!40000 ALTER TABLE `tx_templavoila_datastructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_templavoila_datastructure` ENABLE KEYS */;
UNLOCK TABLES;

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
