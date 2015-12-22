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


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-08-06 23:41:52
