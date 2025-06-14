-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: chick hicks
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `maintenance_record`
--

DROP TABLE IF EXISTS `maintenance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_record` (
  `maintenance_ID` int NOT NULL AUTO_INCREMENT,
  `Device_ID` int NOT NULL,
  `Vendor_ID` int NOT NULL,
  `Maintenance_Item` varchar(45) NOT NULL,
  `Maintenance_Time` datetime NOT NULL,
  `Maintenance_Cost` int NOT NULL,
  `Next_Maintenance_Date` date DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `state` int DEFAULT NULL,
  PRIMARY KEY (`maintenance_ID`),
  KEY `deviceID_idx` (`Device_ID`),
  KEY `vendorID_idx` (`Vendor_ID`),
  CONSTRAINT `deviceID` FOREIGN KEY (`Device_ID`) REFERENCES `device_record` (`Device_ID`),
  CONSTRAINT `vendorID` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor_record` (`Vendor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=123017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_record`
--

LOCK TABLES `maintenance_record` WRITE;
/*!40000 ALTER TABLE `maintenance_record` DISABLE KEYS */;
INSERT INTO `maintenance_record` VALUES (123001,501,18501,'更換閘門感應器','2025-03-15 10:00:00',5000,'2025-06-15','更換後測試正常',NULL),(123002,502,18501,'更換閘門感應器','2025-03-15 10:00:00',5000,'2025-06-15','更換後測試正常',NULL),(123003,502,18501,'測試','2024-12-12 12:12:12',220,'2025-03-12','測試',NULL),(123004,501,18501,'修馬達','2024-12-12 12:00:00',10,'2025-03-12','修完沒有問題',NULL),(123005,501,18501,'��','2025-12-12 20:12:12',200,'2026-03-12','��',NULL),(123006,501,18501,'修理閘門','2020-12-25 12:32:25',100,'2021-03-25','沒問題',NULL),(123007,503,18501,'這是測試','2025-05-28 20:29:00',99999,'2025-06-07','這只是測試喔',-1);
/*!40000 ALTER TABLE `maintenance_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-14 20:30:02
