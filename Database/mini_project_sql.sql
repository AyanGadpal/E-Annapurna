-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: mini_project
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `allocation`
--

DROP TABLE IF EXISTS `allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allocation` (
  `AllID` int(11) NOT NULL AUTO_INCREMENT,
  `C_ID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `date_tran` date DEFAULT NULL,
  PRIMARY KEY (`AllID`),
  KEY `C_ID` (`C_ID`),
  KEY `FoodID` (`FoodID`),
  CONSTRAINT `allocation_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `total_food` (`FoodID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation`
--

LOCK TABLES `allocation` WRITE;
/*!40000 ALTER TABLE `allocation` DISABLE KEYS */;
INSERT INTO `allocation` VALUES (1,1,1,'2019-09-30');
/*!40000 ALTER TABLE `allocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger allo_tri before insert on allocation for each row begin set
new.date_tran = now();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `AreaID` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'katraj'),(2,'vakad');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumer` (
  `FoodID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AreaID` int(11) NOT NULL,
  `hname` varchar(25) NOT NULL,
  `Quantity` float DEFAULT NULL,
  `type_of_shelter` varchar(20) NOT NULL,
  `breakfast` varchar(20) DEFAULT NULL,
  `lunch` varchar(20) DEFAULT NULL,
  `dinner` varchar(20) DEFAULT NULL,
  `mobno` int(12) NOT NULL,
  `toddler` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `adolescent` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `elderly` int(11) NOT NULL,
  PRIMARY KEY (`C_ID`),
  KEY `AreaID` (`AreaID`),
  KEY `FoodID` (`FoodID`),
  CONSTRAINT `consumer_ibfk_1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`),
  CONSTRAINT `consumer_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `total_food` (`FoodID`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` VALUES (2,1,2,'ffn',NULL,'EducationInstitude','dsdsf','dsfsdfsfs',NULL,465465165,18,10,12,26,13),(2,2,2,'ffn',NULL,'EducationInstitude','dsdsf','dsfsdfsfs','sddsb',465465165,18,10,12,26,13),(2,3,1,'ABC',NULL,'EducationInstitude','12','1','2',123456789,15,38,16,39,17),(2,4,2,'dnyaneshwar',NULL,'kgk','2','1','2',1234554321,2,2,2,2,2),(2,76,2,'dnyaneshwar',NULL,'kgk','2','1','2',1234554321,2,2,2,2,2),(2,376,2,'dnyaneshwar',NULL,'kgk','2','1','2',1234554321,2,2,2,2,2);
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `DonorPan` varchar(10) DEFAULT NULL,
  `DonorName` varchar(20) NOT NULL,
  `DonateAmt` decimal(10,2) NOT NULL,
  `DonorAddress` varchar(50) NOT NULL,
  `date_tran` date DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (4,'BROPC8409D','Ayan',20000.00,'Jalna',NULL),(5,'zxccz223','a',23.00,'das',NULL),(6,'sfsdsd','asd',2300.76,'pune','2019-09-30');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger donor_tri
before insert on donor
for each row begin
set new.date_tran = now();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DonateAddFund` AFTER INSERT ON `donor` FOR EACH ROW begin
  UPDATE total_fund 
  set Fund = Fund+new.DonateAmt WHERE F_id = 1;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `received_food`
--

DROP TABLE IF EXISTS `received_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `received_food` (
  `R_ID` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `FoodID` int(11) DEFAULT NULL,
  `amount` float NOT NULL,
  `date_tran` date DEFAULT NULL,
  PRIMARY KEY (`R_ID`),
  KEY `s_id` (`s_id`),
  KEY `FoodID` (`FoodID`),
  CONSTRAINT `received_food_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `sponsors` (`s_id`),
  CONSTRAINT `received_food_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `total_food` (`FoodID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `received_food`
--

LOCK TABLES `received_food` WRITE;
/*!40000 ALTER TABLE `received_food` DISABLE KEYS */;
INSERT INTO `received_food` VALUES (7,7,2,10,NULL),(8,8,2,50,NULL),(9,8,1,56,NULL),(10,9,2,12000,NULL),(11,10,2,120,NULL),(16,21,2,100,'2019-09-30'),(17,11,2,100,'2019-09-30'),(18,11,1,100,'2019-09-30');
/*!40000 ALTER TABLE `received_food` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spnAddFood` AFTER INSERT ON `received_food` FOR EACH ROW begin
		UPDATE total_food 
		set Quantity = Quantity+new.amount WHERE FoodID = new.FoodID;
		end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `s_fund`
--

DROP TABLE IF EXISTS `s_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_fund` (
  `SFund_ID` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `amount` float NOT NULL,
  `date_tran` date DEFAULT NULL,
  PRIMARY KEY (`SFund_ID`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `s_fund_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `sponsors` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_fund`
--

LOCK TABLES `s_fund` WRITE;
/*!40000 ALTER TABLE `s_fund` DISABLE KEYS */;
INSERT INTO `s_fund` VALUES (2,8,17,NULL),(3,9,10000,NULL),(4,10,100002,NULL),(5,21,100,NULL),(6,11,100,'2019-09-30');
/*!40000 ALTER TABLE `s_fund` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SpnAddFund` AFTER INSERT ON `s_fund` FOR EACH ROW begin
			UPDATE total_fund 
			set Fund = Fund+new.amount WHERE F_id = 1;
			end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT,
  `AreaID` int(11) DEFAULT NULL,
  `spn_nm` varchar(30) NOT NULL,
  `whatentry` varchar(30) NOT NULL,
  `mobno` int(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `fund` float DEFAULT '0',
  `food` float DEFAULT '0',
  `rawgrain` float DEFAULT '0',
  PRIMARY KEY (`s_id`),
  KEY `AreaID` (`AreaID`),
  CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES (1,1,'','',1234554321,'cgcgcg@sd.com',0,0,10),(4,1,'Ayan','asd',1234567,'Ayangadpal2@gmail.co',21323,12312,33412),(5,1,'Ayan','asd',1234567,'Ayangadepal2@gmail.c',21323,12312,33412),(6,1,'Ayan','asd',2342344,'2342',34,0,0),(7,2,'Ayan ','RWA',123456789,'ayan@gmail.com',7,10,20),(8,2,'Ayan .g','RWA',12345678,'.g@gmail.com',17,50,56),(9,1,'Ayan','Restaurant',2312,'Ayan@mail.com',10000,12000,0),(10,1,'ROhan','EventCaterer',2312,'Ayan@mail.com',100002,120,0),(11,1,'Ayan','asas',1234553421,'dffrfref@df.com',100,100,100),(21,1,'Ayan','asas',1234553421,'dffrfref@df.com',100,100,0);
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger spnTrigger1           after insert on sponsors            for each row       begin         IF new.food > 0 THEN               INSERT into             received_food(s_id,FoodID,amount,date_tran)               values(new.s_id,2,new.food,now());              END IF;            IF new.rawgrain > 0 THEN              INSERT into               received_food(s_id,FoodID,amount,date_tran)               values(new.s_id,1,new.rawgrain,now());              END IF;             IF new.fund > 0 THEN               INSERT into               s_fund(s_id,amount,date_tran)               values(new.s_id,new.fund,now());           END IF;        end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `total_food`
--

DROP TABLE IF EXISTS `total_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_food` (
  `FoodID` int(11) NOT NULL,
  `Quantity` float NOT NULL,
  `food_type` varchar(10) NOT NULL,
  PRIMARY KEY (`FoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_food`
--

LOCK TABLES `total_food` WRITE;
/*!40000 ALTER TABLE `total_food` DISABLE KEYS */;
INSERT INTO `total_food` VALUES (1,156,'raw'),(2,213,'coocked');
/*!40000 ALTER TABLE `total_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_fund`
--

DROP TABLE IF EXISTS `total_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_fund` (
  `F_id` int(11) NOT NULL,
  `Fund` float NOT NULL,
  PRIMARY KEY (`F_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_fund`
--

LOCK TABLES `total_fund` WRITE;
/*!40000 ALTER TABLE `total_fund` DISABLE KEYS */;
INSERT INTO `total_fund` VALUES (1,132543);
/*!40000 ALTER TABLE `total_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vol_allocation`
--

DROP TABLE IF EXISTS `vol_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vol_allocation` (
  `AllID` int(11) NOT NULL,
  `v_id` int(11) NOT NULL,
  `date_tran` date DEFAULT NULL,
  KEY `AllID` (`AllID`),
  KEY `v_id` (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vol_allocation`
--

LOCK TABLES `vol_allocation` WRITE;
/*!40000 ALTER TABLE `vol_allocation` DISABLE KEYS */;
INSERT INTO `vol_allocation` VALUES (1,1,'2019-09-30');
/*!40000 ALTER TABLE `vol_allocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger vol_tri
before insert on vol_allocation
for each row begin
set new.date_tran = now();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteer` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `AreaID` int(11) DEFAULT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `mobno` int(10) NOT NULL,
  `DOB` varchar(20) NOT NULL,
  `organization` varchar(30) NOT NULL,
  `education` varchar(20) NOT NULL,
  `why_to_join` varchar(60) NOT NULL,
  `duration` varchar(7) NOT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`v_id`),
  KEY `AreaID` (`AreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,2,'Dnyanu','Bhand','d@gmail.com',1234,'11-10-1111','PICT','B.E.','kjfsdf','0000000',0),(4,2,'dfasffdsf','fsdfsf','deadf@gmail.com',123421321,'11-10-1111','PICT','B.E.','kjfsdf','0100100',0);
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-30 15:58:35
