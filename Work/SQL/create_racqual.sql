-- MySQL dump 10.13  Distrib 5.6.16, for Win64 (x86_64)
--
-- Host: localhost    Database: racqual
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `listinginfo`
--

DROP TABLE IF EXISTS `listinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listinginfo` (
  `listingID` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) DEFAULT NULL,
  `racquetID` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `neworUsed` varchar(20) DEFAULT NULL,
  `dateListed` date DEFAULT NULL,
  `dateSold` date DEFAULT NULL,
  `usernameBuyer` varchar(20) DEFAULT NULL,
  `sellerRating` varchar(20) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`listingID`),
  KEY `username` (`username`),
  KEY `racquetID` (`racquetID`),
  CONSTRAINT `listinginfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`),
  CONSTRAINT `listinginfo_ibfk_2` FOREIGN KEY (`racquetID`) REFERENCES `racquetinfo` (`racquetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listinginfo`
--

LOCK TABLES `listinginfo` WRITE;
/*!40000 ALTER TABLE `listinginfo` DISABLE KEYS */;
INSERT INTO `listinginfo` VALUES (1,'srkanth',2,1000,'new','2014-10-05',NULL,NULL,NULL,'buy this brand new racquet, free shipping','.../images/srkanth/wilsonj.jpg'),(2,'srkanth',3,500,'used','2014-10-04',NULL,NULL,NULL,'buy this brand new racquet, free shipping','.../images/srkanth/asics109.jpg'),(3,'jayp',1,100,'new','2014-10-01',NULL,NULL,NULL,'Cheapest racquet in the market!!!','.../images/jayp/dunlopif98.jpg');
/*!40000 ALTER TABLE `listinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racquetinfo`
--

DROP TABLE IF EXISTS `racquetinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `racquetinfo` (
  `racquetID` int(11) NOT NULL DEFAULT '0',
  `modelName` varchar(20) DEFAULT NULL,
  `brand` varchar(10) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `swingweight` double DEFAULT NULL,
  `balancePoint` double DEFAULT NULL,
  `qualityIndex` double DEFAULT NULL,
  PRIMARY KEY (`racquetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racquetinfo`
--

LOCK TABLES `racquetinfo` WRITE;
/*!40000 ALTER TABLE `racquetinfo` DISABLE KEYS */;
INSERT INTO `racquetinfo` VALUES (1,'iDapt Force 98','dunlop',0.31751,69.95,317,33.12,1.1),(2,'Juice 100S','wilson',0.31751,68.58,320,33.02,1.08),(3,'109','asics',0.292,69.22,313,34,1.078);
/*!40000 ALTER TABLE `racquetinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('etam','789456123','Eric','Tam','etam@ghoo.com',NULL,NULL,NULL,NULL),('ironman','WARMACHINEROX','Tony','stark','info@stark.com',NULL,NULL,NULL,NULL),('jayp','dreamteam','Jay','Patel','jay@hostname.com','415-666-8877','santa clara','california',NULL),('jsu','abcd1234','Jeffrey','Su','su@life.com',NULL,NULL,NULL,NULL),('shub','1234abcd','Shubha','Ranganathan','shub@email.com',NULL,NULL,NULL,NULL),('srkanth','dreamteam','Srikanth','Narahari','sri@sjsu.com','415-999-8877','san jose','california',5);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-10 17:01:46
