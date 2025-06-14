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
-- Table structure for table `passage_record`
--

DROP TABLE IF EXISTS `passage_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passage_record` (
  `Serial_Number` int NOT NULL AUTO_INCREMENT,
  `Passage_Time` datetime NOT NULL,
  `Gate_ID` int NOT NULL,
  `Purchase_ID` int NOT NULL,
  `Ticket_ID` int NOT NULL,
  PRIMARY KEY (`Serial_Number`),
  KEY `PurchaseID_idx` (`Purchase_ID`),
  KEY `GateID_idx` (`Gate_ID`),
  KEY `TicketID_idx` (`Ticket_ID`),
  CONSTRAINT `GateID` FOREIGN KEY (`Gate_ID`) REFERENCES `device_record` (`Device_ID`),
  CONSTRAINT `PurchaseID` FOREIGN KEY (`Purchase_ID`) REFERENCES `purchase_record` (`Order_ID`),
  CONSTRAINT `TicketIDfk2` FOREIGN KEY (`Ticket_ID`) REFERENCES `products` (`TicketID`)
) ENGINE=InnoDB AUTO_INCREMENT=90107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passage_record`
--

LOCK TABLES `passage_record` WRITE;
/*!40000 ALTER TABLE `passage_record` DISABLE KEYS */;
INSERT INTO `passage_record` VALUES (90100,'2025-03-02 15:15:50',501,10001,1),(90101,'2025-03-05 20:31:20',501,10002,2),(90102,'2025-03-06 08:33:10',502,10002,2),(90103,'2025-03-06 10:02:03',501,10003,3),(90104,'2025-03-06 11:01:02',501,10004,1),(90105,'2025-03-06 22:35:44',502,10004,1),(90106,'2025-03-07 10:54:06',501,10004,1);
/*!40000 ALTER TABLE `passage_record` ENABLE KEYS */;
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
