CREATE DATABASE  IF NOT EXISTS `hackathon` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hackathon`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: hackathon
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `added_to`
--

DROP TABLE IF EXISTS `added_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `added_to` (
  `PRODUCT_ID` int(5) NOT NULL,
  `CART_ID` int(5) NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`CART_ID`),
  KEY `cart1_id` (`CART_ID`),
  CONSTRAINT `cart1_id` FOREIGN KEY (`CART_ID`) REFERENCES `cart` (`CART_ID`) ON UPDATE CASCADE,
  CONSTRAINT `pro1_id` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `added_to`
--

LOCK TABLES `added_to` WRITE;
/*!40000 ALTER TABLE `added_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `added_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `BRD_ID` int(5) NOT NULL,
  `BRD_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`BRD_ID`),
  UNIQUE KEY `BRD_NAME` (`BRD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'IKEA'),(2,'Improb'),(3,'Nilkamal');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `CUS_ID` int(5) DEFAULT NULL,
  `card_number` decimal(12,0) NOT NULL,
  `mm` decimal(2,0) DEFAULT NULL,
  `yy` decimal(4,0) DEFAULT NULL,
  `cvv` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`card_number`),
  KEY `f12` (`CUS_ID`),
  CONSTRAINT `f12` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUST_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `CART_ID` int(5) NOT NULL,
  `CUST_ID` int(5) NOT NULL,
  PRIMARY KEY (`CART_ID`,`CUST_ID`),
  KEY `cus_id` (`CUST_ID`),
  CONSTRAINT `cus_id` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `BRD_ID` int(5) NOT NULL,
  `category` varchar(20) NOT NULL,
  `cat_img` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`BRD_ID`,`category`),
  CONSTRAINT `bnd_id` FOREIGN KEY (`BRD_ID`) REFERENCES `brand` (`BRD_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'SOFA','E:/Category/Sofa.jpg'),(2,'SOFA','E:/Category/Sofa.jpg'),(3,'Bed','E:/Category/Bed.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUST_ID` int(5) NOT NULL,
  `FNAME` varchar(20) NOT NULL,
  `LNAME` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `PHONE` decimal(10,0) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `USER_NAME` varchar(25) NOT NULL,
  `PASSWORD` varchar(25) NOT NULL,
  PRIMARY KEY (`CUST_ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'abc','','abc@gmail.com',98765433,'Bangalore','abc','abc'),(2,'xyz','','xyz@gmail.com',9766541211,'Bangalore','xyz','xyz');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributor` (
  `Distributor_ID` int(5) DEFAULT NULL,
  `Product_ID` int(5) DEFAULT NULL,
  `BRD_ID` int(5) DEFAULT NULL,
  `Stocks_Available` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
INSERT INTO `distributor` VALUES (1,1,1,210),(2,2,2,500);
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor_list`
--

DROP TABLE IF EXISTS `distributor_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributor_list` (
  `Distributor_ID` int(5) DEFAULT NULL,
  `Product_ID` int(5) DEFAULT NULL,
  `BRD_ID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor_list`
--

LOCK TABLES `distributor_list` WRITE;
/*!40000 ALTER TABLE `distributor_list` DISABLE KEYS */;
INSERT INTO `distributor_list` VALUES (2,2,2),(1,1,1);
/*!40000 ALTER TABLE `distributor_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor_msg`
--

DROP TABLE IF EXISTS `distributor_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributor_msg` (
  `Distributor_ID` int(5) DEFAULT NULL,
  `Product_ID` int(5) DEFAULT NULL,
  `MSG` varchar(30) DEFAULT NULL,
  `Date_MSG` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor_msg`
--

LOCK TABLES `distributor_msg` WRITE;
/*!40000 ALTER TABLE `distributor_msg` DISABLE KEYS */;
INSERT INTO `distributor_msg` VALUES (1,1,'Ordered product successfully','2020-04-28');
/*!40000 ALTER TABLE `distributor_msg` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger s
after insert on Distributor_msg
for each row
begin
Declare stocks int(15);
Declare quan int(15);
select Stocks_Available into stocks from Distributor where Distributor_ID=new.Distributor_ID and Product_ID = new.PRODUCT_ID;
select QNTY into quan from Distributor_orders where Distributor_ID=new.Distributor_ID and Product_ID = new.PRODUCT_ID;
if quan<=stocks
then
insert into Distributor_msg_confirmation values(new.Distributor_ID,new.PRODUCT_ID,current_date(),"Delivered product successfully");
update Distributor set Stocks_Available=Stocks_Available-quan where Distributor_ID = new.Distributor_ID and PRODUCT_ID=new.PRODUCT_ID;
update product set quantity=quantity+quan where PRODUCT_ID=new.PRODUCT_ID;
delete from Distributor_orders where Distributor_ID=new.Distributor_ID and Product_ID = new.PRODUCT_ID;
else
insert  into Distributor_msg_confirmation values(new.Distributor_ID,new.PRODUCT_ID,"Ordered product successfully, delivering products in few after few days");
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `distributor_msg_confirmation`
--

DROP TABLE IF EXISTS `distributor_msg_confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributor_msg_confirmation` (
  `Distributor_ID` int(5) DEFAULT NULL,
  `Product_ID` int(5) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `MSG` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor_msg_confirmation`
--

LOCK TABLES `distributor_msg_confirmation` WRITE;
/*!40000 ALTER TABLE `distributor_msg_confirmation` DISABLE KEYS */;
INSERT INTO `distributor_msg_confirmation` VALUES (1,1,'2020-04-28','Delivered product successfully');
/*!40000 ALTER TABLE `distributor_msg_confirmation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Notification_T
after insert on Distributor_msg_confirmation
for each row 
begin 
insert into notification values(current_timestamp(),new.Distributor_ID,new.Product_ID,new.MSG);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `distributor_orders`
--

DROP TABLE IF EXISTS `distributor_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distributor_orders` (
  `Distributor_ID` int(5) DEFAULT NULL,
  `PRODUCT_ID` int(5) DEFAULT NULL,
  `QNTY` int(5) DEFAULT NULL,
  `DATE_OF_ORDER` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor_orders`
--

LOCK TABLES `distributor_orders` WRITE;
/*!40000 ALTER TABLE `distributor_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributor_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `INVOICE_ID` int(5) NOT NULL,
  `D_O_B` datetime DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `ORDER_ID` int(5) DEFAULT NULL,
  `CUST_ID` int(5) DEFAULT NULL,
  PRIMARY KEY (`INVOICE_ID`),
  KEY `O_id` (`ORDER_ID`),
  KEY `custom_id` (`CUST_ID`),
  CONSTRAINT `custom_id` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`) ON UPDATE CASCADE,
  CONSTRAINT `O_id` FOREIGN KEY (`ORDER_ID`) REFERENCES `s_order` (`ORDER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'2020-04-28 10:02:08',32000,2,1);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `DELIVERED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Distributor_ID` int(5) DEFAULT NULL,
  `Product_ID` int(5) DEFAULT NULL,
  `MSG` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('2020-04-28 04:24:14',1,1,'Delivered product successfully'),('2020-04-28 04:24:14',1,1,'Ordered product successfully'),('2020-04-28 04:32:07',1,1,'Delivered product successfully'),('2020-04-28 04:32:07',1,1,'Ordered product successfully');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order1`
--

DROP TABLE IF EXISTS `order1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order1` (
  `ORDER_ID` int(5) DEFAULT NULL,
  `CUST_ID` int(5) DEFAULT NULL,
  `ORDER_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order1`
--

LOCK TABLES `order1` WRITE;
/*!40000 ALTER TABLE `order1` DISABLE KEYS */;
/*!40000 ALTER TABLE `order1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_in_order`
--

DROP TABLE IF EXISTS `pro_in_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_in_order` (
  `PRODUCT_ID` int(5) NOT NULL,
  `ORDER_ID` int(5) NOT NULL,
  `quantity` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`,`ORDER_ID`),
  KEY `ord1_id` (`ORDER_ID`),
  CONSTRAINT `ord1_id` FOREIGN KEY (`ORDER_ID`) REFERENCES `s_order` (`ORDER_ID`) ON UPDATE CASCADE,
  CONSTRAINT `pro4_id` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_in_order`
--

LOCK TABLES `pro_in_order` WRITE;
/*!40000 ALTER TABLE `pro_in_order` DISABLE KEYS */;
INSERT INTO `pro_in_order` VALUES (1,2,1);
/*!40000 ALTER TABLE `pro_in_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger t
before insert on pro_in_order
for each row 
begin 
DECLARE CUR_STOCK int(5);
DECLARE ORDER_KEY int(3);
DECLARE ID int(3);
declare O_QNTY int(5);
declare MINI int(5);
declare BID int(5);
select minimum_value into MINI FROM QNTY_MINI; 
select order_quantity into O_QNTY FROM QNTY_MINI; 
SELECT QUANTITY INTO CUR_STOCK FROM PRODUCT WHERE PRODUCT_ID=NEW.PRODUCT_ID; 
SELECT BRD_ID INTO BID FROM PRODUCT WHERE PRODUCT_ID=NEW.PRODUCT_ID; 
select Distributor_ID into ID from distributor_list where PRODUCT_ID=New.PRODUCT_ID and BRD_ID = BID;
select count(*) into ORDER_KEY from Distributor_orders where Distributor_ID=ID and Product_ID=NEW.Product_ID;
IF CUR_STOCK<MINI and ORDER_KEY=0
THEN 
insert into Distributor_orders values(ID,NEW.PRODUCT_ID,O_QNTY,CURRENT_DATE);
insert into Distributor_msg values(ID,new.PRODUCT_ID,"Ordered product successfully",CURRENT_DATE);
insert into notification values(current_timestamp(),ID,new.Product_ID,"Ordered product successfully");
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `PRODUCT_ID` int(5) NOT NULL,
  `BRD_ID` int(5) DEFAULT NULL,
  `P_NAME` varchar(50) NOT NULL,
  `A_PRICE` int(7) DEFAULT NULL,
  `S_PRICE` int(7) NOT NULL,
  `DETALIS` varchar(100) DEFAULT NULL,
  `pro_img` varchar(100) DEFAULT NULL,
  `quantity` decimal(5,0) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `b_id` (`BRD_ID`),
  CONSTRAINT `b_id` FOREIGN KEY (`BRD_ID`) REFERENCES `brand` (`BRD_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'IKEA SOFA',34000,32000,'Comfortable Sofa','E:/Product/Ikea sofa.jpg',244,'SOFA'),(2,2,'Improb Sofa',39000,35000,'Comfoartable Sofa','E:/Product/Improb Sofa.jpg',100,'SOFA'),(3,3,'Nilkamal Bed',40000,39000,'Comfortable Bed','E:/Product/Nilkamal Bed.jpg',100,'Bed');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qnty_mini`
--

DROP TABLE IF EXISTS `qnty_mini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qnty_mini` (
  `minimum_value` int(5) DEFAULT NULL,
  `order_quantity` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qnty_mini`
--

LOCK TABLES `qnty_mini` WRITE;
/*!40000 ALTER TABLE `qnty_mini` DISABLE KEYS */;
INSERT INTO `qnty_mini` VALUES (100,145.264);
/*!40000 ALTER TABLE `qnty_mini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `CUST_ID` int(5) NOT NULL,
  `PRODUCT_ID` int(5) NOT NULL,
  `details` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`,`PRODUCT_ID`),
  KEY `pro2_id` (`PRODUCT_ID`),
  CONSTRAINT `cus3_id` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`) ON UPDATE CASCADE,
  CONSTRAINT `pro2_id` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_order`
--

DROP TABLE IF EXISTS `s_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_order` (
  `ORDER_ID` int(5) NOT NULL,
  `CUST_ID` int(5) DEFAULT NULL,
  `DATE_OF_ORDER` datetime DEFAULT NULL,
  `mode` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `c_id` (`CUST_ID`),
  CONSTRAINT `c_id` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_order`
--

LOCK TABLES `s_order` WRITE;
/*!40000 ALTER TABLE `s_order` DISABLE KEYS */;
INSERT INTO `s_order` VALUES (1,1,'2020-04-28 09:54:14','C O D'),(2,1,'2020-04-28 10:02:08','C O D');
/*!40000 ALTER TABLE `s_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hackathon'
--

--
-- Dumping routines for database 'hackathon'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-05 10:11:01
