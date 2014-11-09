CREATE DATABASE  IF NOT EXISTS `boarddb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `boarddb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: boarddb
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  `TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `HIT` int(11) DEFAULT '0',
  `REF` int(11) DEFAULT '0',
  `INDENT` int(11) DEFAULT '0',
  `STEP` int(11) DEFAULT '0',
  PRIMARY KEY (`NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'test','test','테스트2','테스트2','2014-11-08 22:05:38',10,0,0,0),(3,'test','test','[답글] 테스트2','[답글] 테스트2','2014-11-09 01:50:25',1,0,1,1),(4,'test','test','[답글] [답글] 테스트2','[답글] [답글] 테스트2','2014-11-09 01:51:40',0,0,2,2),(5,'test','test','테스트3','테스트3','2014-11-09 02:05:11',1,5,0,0),(6,'test','test','[답글] 테스트3','[답글] 테스트3','2014-11-09 02:05:25',0,5,1,1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board2`
--

DROP TABLE IF EXISTS `board2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board2` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  `TIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `HIT` int(11) DEFAULT '0',
  `REF` int(11) DEFAULT '0',
  `INDENT` int(11) DEFAULT '0',
  `STEP` int(11) DEFAULT '0',
  PRIMARY KEY (`NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board2`
--

LOCK TABLES `board2` WRITE;
/*!40000 ALTER TABLE `board2` DISABLE KEYS */;
INSERT INTO `board2` VALUES (4,'test','test','테스트5','테스트5','2014-11-09 12:03:33',7,1,0,0),(5,'test','test','[답글] 테스트5','[답글] 테스트5','2014-11-09 13:00:50',1,1,1,1),(6,'test','test','[답글] [답글] 테스트5','[답글] [답글] 테스트5','2014-11-09 13:03:12',0,1,2,2),(7,'test','test','테스트6','테스트6','2014-11-09 13:13:01',1,7,0,0),(9,'test','test','테스트8','테스트8','2014-11-09 13:13:38',1,9,0,0),(10,'test','test','[답글] 테스트6','[답글] 테스트6','2014-11-09 13:14:01',0,7,1,1),(11,'test','test','[답글] 테스트8','[답글] 테스트8','2014-11-09 13:14:09',0,9,1,1);
/*!40000 ALTER TABLE `board2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-09 13:18:58
