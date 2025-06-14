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
-- Temporary view structure for view `purchaserecord`
--

DROP TABLE IF EXISTS `purchaserecord`;
/*!50001 DROP VIEW IF EXISTS `purchaserecord`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `purchaserecord` AS SELECT 
 1 AS `Order_ID`,
 1 AS `License_Plate`,
 1 AS `Purchase_Date`,
 1 AS `TicketName`,
 1 AS `Cost`,
 1 AS `Expiration_Date`,
 1 AS `Purchase_Quantity`,
 1 AS `PassTimes`,
 1 AS `Status`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vendorrecord`
--

DROP TABLE IF EXISTS `vendorrecord`;
/*!50001 DROP VIEW IF EXISTS `vendorrecord`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vendorrecord` AS SELECT 
 1 AS `Vendor_ID`,
 1 AS `Vendor_Name`,
 1 AS `Contact_Person`,
 1 AS `Phone`,
 1 AS `Email`,
 1 AS `Address`,
 1 AS `Service_Type`,
 1 AS `Contract_Start`,
 1 AS `Contract_End`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tickets_total`
--

DROP TABLE IF EXISTS `tickets_total`;
/*!50001 DROP VIEW IF EXISTS `tickets_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tickets_total` AS SELECT 
 1 AS `TicketName`,
 1 AS `TotalPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!50001 DROP VIEW IF EXISTS `ticket`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ticket` AS SELECT 
 1 AS `TicketID`,
 1 AS `TicketName`,
 1 AS `Price`,
 1 AS `Max_Uses`,
 1 AS `Duration`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maintenancerecord`
--

DROP TABLE IF EXISTS `maintenancerecord`;
/*!50001 DROP VIEW IF EXISTS `maintenancerecord`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maintenancerecord` AS SELECT 
 1 AS `maintenance_ID`,
 1 AS `Device_ID`,
 1 AS `Device_Name`,
 1 AS `Contact_Person`,
 1 AS `Vendor_Name`,
 1 AS `Maintenance_Item`,
 1 AS `Maintenance_Time`,
 1 AS `Maintenance_Cost`,
 1 AS `Next_Maintenance_Date`,
 1 AS `Remarks`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `device_usage_daily`
--

DROP TABLE IF EXISTS `device_usage_daily`;
/*!50001 DROP VIEW IF EXISTS `device_usage_daily`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `device_usage_daily` AS SELECT 
 1 AS `Device_ID`,
 1 AS `Device_Name`,
 1 AS `Remarks`,
 1 AS `Usage_Date`,
 1 AS `Daily_Usage_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `device_total_usage`
--

DROP TABLE IF EXISTS `device_total_usage`;
/*!50001 DROP VIEW IF EXISTS `device_total_usage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `device_total_usage` AS SELECT 
 1 AS `Device_ID`,
 1 AS `Device_Name`,
 1 AS `Remarks`,
 1 AS `Usage_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `passagerecord`
--

DROP TABLE IF EXISTS `passagerecord`;
/*!50001 DROP VIEW IF EXISTS `passagerecord`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passagerecord` AS SELECT 
 1 AS `Serial_Number`,
 1 AS `Passage_Time`,
 1 AS `Gate_ID`,
 1 AS `License_Plate`,
 1 AS `TicketName`,
 1 AS `Expiration_Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `devicerecord`
--

DROP TABLE IF EXISTS `devicerecord`;
/*!50001 DROP VIEW IF EXISTS `devicerecord`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `devicerecord` AS SELECT 
 1 AS `Device_ID`,
 1 AS `Device_Name`,
 1 AS `Purchase_Time`,
 1 AS `Purchase_Amount`,
 1 AS `Maintenance_Interval`,
 1 AS `Remarks`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `purchaserecord`
--

/*!50001 DROP VIEW IF EXISTS `purchaserecord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchaserecord` AS select `a`.`Order_ID` AS `Order_ID`,`a`.`License_Plate` AS `License_Plate`,`a`.`Purchase_Date` AS `Purchase_Date`,`b`.`TicketName` AS `TicketName`,(`a`.`Purchase_Quantity` * `b`.`Price`) AS `Cost`,`a`.`Expiration_Date` AS `Expiration_Date`,`a`.`Purchase_Quantity` AS `Purchase_Quantity`,count(`c`.`Serial_Number`) AS `PassTimes`,`a`.`Status` AS `Status`,`a`.`state` AS `state` from ((`purchase_record` `a` join `products` `b` on((`a`.`Ticket_ID` = `b`.`TicketID`))) left join `passage_record` `c` on((`a`.`Order_ID` = `c`.`Purchase_ID`))) where ((`a`.`state` <> -(1)) or (`a`.`state` is null)) group by `a`.`Order_ID` order by `a`.`Order_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendorrecord`
--

/*!50001 DROP VIEW IF EXISTS `vendorrecord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendorrecord` AS select `vendor_record`.`Vendor_ID` AS `Vendor_ID`,`vendor_record`.`Vendor_Name` AS `Vendor_Name`,`vendor_record`.`Contact_Person` AS `Contact_Person`,`vendor_record`.`Phone` AS `Phone`,`vendor_record`.`Email` AS `Email`,`vendor_record`.`Address` AS `Address`,`vendor_record`.`Service_Type` AS `Service_Type`,`vendor_record`.`Contract_Start` AS `Contract_Start`,`vendor_record`.`Contract_End` AS `Contract_End`,`vendor_record`.`state` AS `state` from `vendor_record` where ((`vendor_record`.`state` <> -(1)) or (`vendor_record`.`state` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tickets_total`
--

/*!50001 DROP VIEW IF EXISTS `tickets_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tickets_total` AS select `a`.`TicketName` AS `TicketName`,sum((`a`.`Price` * `b`.`Purchase_Quantity`)) AS `TotalPrice` from (`products` `a` join `purchase_record` `b` on((`a`.`TicketID` = `b`.`Ticket_ID`))) group by `a`.`TicketName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ticket`
--

/*!50001 DROP VIEW IF EXISTS `ticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ticket` AS select `products`.`TicketID` AS `TicketID`,`products`.`TicketName` AS `TicketName`,`products`.`Price` AS `Price`,`products`.`Max_Uses` AS `Max_Uses`,`products`.`Duration` AS `Duration`,`products`.`state` AS `state` from `products` where ((`products`.`state` <> -(1)) or (`products`.`state` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maintenancerecord`
--

/*!50001 DROP VIEW IF EXISTS `maintenancerecord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maintenancerecord` AS select `a`.`maintenance_ID` AS `maintenance_ID`,`a`.`Device_ID` AS `Device_ID`,`c`.`Device_Name` AS `Device_Name`,`b`.`Contact_Person` AS `Contact_Person`,`b`.`Vendor_Name` AS `Vendor_Name`,`a`.`Maintenance_Item` AS `Maintenance_Item`,`a`.`Maintenance_Time` AS `Maintenance_Time`,`a`.`Maintenance_Cost` AS `Maintenance_Cost`,`a`.`Next_Maintenance_Date` AS `Next_Maintenance_Date`,`a`.`Remarks` AS `Remarks`,`a`.`state` AS `state` from ((`maintenance_record` `a` join `device_record` `c` on((`a`.`Device_ID` = `c`.`Device_ID`))) join `vendor_record` `b` on((`a`.`Vendor_ID` = `b`.`Vendor_ID`))) where ((`a`.`state` <> -(1)) or (`a`.`state` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `device_usage_daily`
--

/*!50001 DROP VIEW IF EXISTS `device_usage_daily`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `device_usage_daily` AS select `d`.`Device_ID` AS `Device_ID`,`d`.`Device_Name` AS `Device_Name`,`d`.`Remarks` AS `Remarks`,cast(`p`.`Passage_Time` as date) AS `Usage_Date`,count(`p`.`Serial_Number`) AS `Daily_Usage_Count` from (`device_record` `d` left join `passage_record` `p` on((`d`.`Device_ID` = `p`.`Gate_ID`))) group by `d`.`Device_ID`,`d`.`Device_Name`,cast(`p`.`Passage_Time` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `device_total_usage`
--

/*!50001 DROP VIEW IF EXISTS `device_total_usage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `device_total_usage` AS select `d`.`Device_ID` AS `Device_ID`,`d`.`Device_Name` AS `Device_Name`,`d`.`Remarks` AS `Remarks`,count(`p`.`Serial_Number`) AS `Usage_Count` from (`device_record` `d` left join `passage_record` `p` on((`d`.`Device_ID` = `p`.`Gate_ID`))) group by `d`.`Device_ID`,`d`.`Device_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passagerecord`
--

/*!50001 DROP VIEW IF EXISTS `passagerecord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passagerecord` AS select `a`.`Serial_Number` AS `Serial_Number`,`a`.`Passage_Time` AS `Passage_Time`,`a`.`Gate_ID` AS `Gate_ID`,`b`.`License_Plate` AS `License_Plate`,`c`.`TicketName` AS `TicketName`,`b`.`Expiration_Date` AS `Expiration_Date` from ((`passage_record` `a` join `purchase_record` `b` on((`a`.`Purchase_ID` = `b`.`Order_ID`))) join `products` `c` on((`a`.`Ticket_ID` = `c`.`TicketID`))) order by `a`.`Serial_Number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `devicerecord`
--

/*!50001 DROP VIEW IF EXISTS `devicerecord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `devicerecord` AS select `device_record`.`Device_ID` AS `Device_ID`,`device_record`.`Device_Name` AS `Device_Name`,`device_record`.`Purchase_Time` AS `Purchase_Time`,`device_record`.`Purchase_Amount` AS `Purchase_Amount`,`device_record`.`Maintenance_Interval` AS `Maintenance_Interval`,`device_record`.`Remarks` AS `Remarks`,`device_record`.`state` AS `state` from `device_record` where ((`device_record`.`state` <> -(1)) or (`device_record`.`state` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-14 20:30:02
