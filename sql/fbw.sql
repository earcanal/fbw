-- MySQL dump 10.11
--
-- Host: localhost    Database: fbw
-- ------------------------------------------------------
-- Server version	5.0.83-0ubuntu3

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
-- Table structure for table `aka`
--

DROP TABLE IF EXISTS `aka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aka` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `player_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `i_player` (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aka`
--

LOCK TABLES `aka` WRITE;
/*!40000 ALTER TABLE `aka` DISABLE KEYS */;
INSERT INTO `aka` VALUES (1,'The Wall',7),(2,'The Cat',1);
/*!40000 ALTER TABLE `aka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixture`
--

DROP TABLE IF EXISTS `fixture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixture` (
  `id` int(11) NOT NULL auto_increment,
  `dt` datetime default NULL,
  `weather` varchar(255) default NULL,
  `motm` int(11) default NULL,
  `t1` int(11) NOT NULL,
  `t2` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `i_motm` (`motm`),
  KEY `i_t1` (`t1`),
  KEY `i_t2` (`t2`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixture`
--

LOCK TABLES `fixture` WRITE;
/*!40000 ALTER TABLE `fixture` DISABLE KEYS */;
INSERT INTO `fixture` VALUES (1,'2010-02-15 00:00:00','Chilly',NULL,0,0);
/*!40000 ALTER TABLE `fixture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL auto_increment,
  `number` int(2) NOT NULL default '0',
  `name` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,'Jay'),(2,11,'Paul S'),(3,10,'Jerry'),(4,0,'Kev'),(5,2,'Paul M'),(6,3,'John'),(7,4,'Nigel'),(8,5,'Terry'),(9,6,'Neil'),(10,7,'Will'),(11,8,'Geth'),(12,9,'Bill'),(13,12,'Lucky'),(14,13,'Tizz'),(15,14,'Jim'),(16,15,'Paul J'),(17,16,'Ed'),(18,17,'Rob'),(19,18,'Si');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat`
--

DROP TABLE IF EXISTS `stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat` (
  `id` int(11) NOT NULL auto_increment,
  `stat_type_id` int(11) default NULL,
  `fixture_id` int(11) default NULL,
  `player_id` int(11) default NULL,
  `value` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `i_stat_type` (`stat_type_id`),
  KEY `i_fixture` (`fixture_id`),
  KEY `i_player` (`player_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat`
--

LOCK TABLES `stat` WRITE;
/*!40000 ALTER TABLE `stat` DISABLE KEYS */;
INSERT INTO `stat` VALUES (1,1,1,15,1);
/*!40000 ALTER TABLE `stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_type`
--

DROP TABLE IF EXISTS `stat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_type`
--

LOCK TABLES `stat_type` WRITE;
/*!40000 ALTER TABLE `stat_type` DISABLE KEYS */;
INSERT INTO `stat_type` VALUES (1,'Goal');
/*!40000 ALTER TABLE `stat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `bib` tinyint(1) default NULL,
  `fixture_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `i_fixture` (`fixture_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Bibs',1,1),(2,'Non-Bibs',0,1);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_player`
--

DROP TABLE IF EXISTS `team_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_player` (
  `team_id` int(11) NOT NULL default '0',
  `player_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`team_id`,`player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_player`
--

LOCK TABLES `team_player` WRITE;
/*!40000 ALTER TABLE `team_player` DISABLE KEYS */;
INSERT INTO `team_player` VALUES (1,5),(1,6),(1,7),(1,10),(1,12),(1,14),(1,15),(1,17),(2,2),(2,3),(2,8),(2,9),(2,11),(2,13),(2,16),(2,17);
/*!40000 ALTER TABLE `team_player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-02-16 23:39:29
