CREATE DATABASE  IF NOT EXISTS `ems` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ems`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ems
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dep`
--

DROP TABLE IF EXISTS `dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dep` (
  `depid` int NOT NULL AUTO_INCREMENT,
  `depname` varchar(45) NOT NULL,
  PRIMARY KEY (`depid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dep`
--

LOCK TABLES `dep` WRITE;
/*!40000 ALTER TABLE `dep` DISABLE KEYS */;
INSERT INTO `dep` VALUES (1,'IT'),(2,'HR'),(3,'SALES'),(4,'DIRECTOR'),(5,'CEO'),(6,'MANAGER');
/*!40000 ALTER TABLE `dep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `empid` int NOT NULL AUTO_INCREMENT,
  `empname` varchar(45) NOT NULL,
  `empdob` date NOT NULL,
  `empgender` char(10) NOT NULL,
  `empaddress` varchar(500) DEFAULT NULL,
  `empphonenumber` bigint unsigned NOT NULL,
  `empsalary` double NOT NULL,
  `empjoindate` datetime DEFAULT NULL,
  `emphours` int NOT NULL,
  `empdepid` int NOT NULL,
  PRIMARY KEY (`empid`),
  KEY `empdepid_FK_idx` (`empdepid`),
  CONSTRAINT `empdepid_FK` FOREIGN KEY (`empdepid`) REFERENCES `dep` (`depid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1,'ASHOK PRAJAPATI','2001-02-12','MALE','D-305 NEW MANIANGAR',1234567890,50000,'2020-01-01 00:00:00',9,1);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empskills`
--

DROP TABLE IF EXISTS `empskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empskills` (
  `empid` int NOT NULL,
  `skillid` int NOT NULL,
  KEY `empid_FK_idx` (`empid`),
  KEY `skillid_FK_idx` (`skillid`),
  CONSTRAINT `empid_FK` FOREIGN KEY (`empid`) REFERENCES `emp` (`empid`),
  CONSTRAINT `skillid_FK` FOREIGN KEY (`skillid`) REFERENCES `skills` (`skillid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empskills`
--

LOCK TABLES `empskills` WRITE;
/*!40000 ALTER TABLE `empskills` DISABLE KEYS */;
INSERT INTO `empskills` VALUES (1,1),(1,2),(1,4);
/*!40000 ALTER TABLE `empskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skillid` int NOT NULL AUTO_INCREMENT,
  `skillname` varchar(45) NOT NULL,
  PRIMARY KEY (`skillid`),
  UNIQUE KEY `skillname_UNIQUE` (`skillname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (3,'CSS'),(2,'HTML'),(1,'JAVA'),(4,'JAVASCRIPT'),(5,'Other');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ems'
--

--
-- Dumping routines for database 'ems'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAllEmployeesWithSkills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEmployeesWithSkills`()
BEGIN
  SELECT emp.empid, emp.empname, emp.empdob, emp.empgender, emp.empaddress, 
         emp.empphonenumber, emp.empsalary, emp.empjoindate, emp.emphours, 
         dep.depname AS empdepname,
         GROUP_CONCAT(skills.skillname SEPARATOR ', ') AS skills
  FROM emp
  INNER JOIN dep ON emp.empdepid = dep.depid
  LEFT JOIN empskills ON emp.empid = empskills.empid
  LEFT JOIN skills ON empskills.skillid = skills.skillid
  GROUP BY emp.empid, emp.empname, emp.empdob, emp.empgender, emp.empaddress, 
           emp.empphonenumber, emp.empsalary, emp.empjoindate, emp.emphours, 
           dep.depname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEmployeeDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmployeeDetails`(IN emp_id INT)
BEGIN
	SELECT emp.empid, emp.empname, emp.empdob, emp.empgender, emp.empaddress,  
         emp.empphonenumber, emp.empsalary, emp.empjoindate, emp.emphours,
         emp.empdepid,
         GROUP_CONCAT(skills.skillid SEPARATOR ', ') AS skills
  FROM emp
  LEFT JOIN empskills ON emp.empid = empskills.empid
  LEFT JOIN skills ON empskills.skillid = skills.skillid
  WHERE emp.empid = emp_id  -- Filter by provided ID
  GROUP BY emp.empid, emp.empname, emp.empdob, emp.empgender, emp.empaddress,  
           emp.empphonenumber, emp.empsalary, emp.empjoindate, emp.emphours;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16  9:58:31
