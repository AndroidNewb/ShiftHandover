-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: shifthandover
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `shiftactivity`
--

DROP TABLE IF EXISTS `shiftactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shiftactivity` (
  `Date` date NOT NULL,
  `Current_Shift` int(11) NOT NULL DEFAULT '1',
  `Next_Shift` int(11) NOT NULL DEFAULT '2',
  `Completed_Tasks` mediumtext,
  `In_Progress` mediumtext,
  `Changes` mediumtext,
  `Issues_Encountered` mediumtext,
  `Handover_By` varchar(45) NOT NULL,
  `Handover_To` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Database for shift activities archiving';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shiftactivity`
--

LOCK TABLES `shiftactivity` WRITE;
/*!40000 ALTER TABLE `shiftactivity` DISABLE KEYS */;
INSERT INTO `shiftactivity` VALUES ('2018-11-06',2,3,'grfgrfg\r\n\r\ndasddadad','asdasdasdas\r\n\r\nasdasdasd','asdasdas\r\n1312312\r\n\r\n\r\n123313123','fiodkf\r\n\r\nasdasdasda','Vamshika','Amit_Kumar'),('2018-11-07',1,2,'rfg','12345','909','963','Vamshika','Amit_Kumar'),('2018-11-12',3,1,'rtfgvbtgrfvbrtfgvb','rtfg','fvfvff','rfvfvfgvfgv','Amit_Kumar','Vamshika');
/*!40000 ALTER TABLE `shiftactivity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-30  9:20:05
