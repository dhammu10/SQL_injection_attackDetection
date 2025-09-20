CREATE DATABASE  IF NOT EXISTS `cloudsqlinjdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cloudsqlinjdb`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: cloudsqlinjdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `appearedexamquestions`
--

DROP TABLE IF EXISTS `appearedexamquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appearedexamquestions` (
  `exQuesId` int NOT NULL,
  `examId` int DEFAULT NULL,
  `quesId` int DEFAULT NULL,
  `ques` varchar(9000) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `quesType` varchar(200) DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`exQuesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearedexamquestions`
--

LOCK TABLES `appearedexamquestions` WRITE;
/*!40000 ALTER TABLE `appearedexamquestions` DISABLE KEYS */;
INSERT INTO `appearedexamquestions` VALUES (1001,1003,1003,'Which are the types of joins?',2,'OneSentence','jaya'),(1002,1003,1004,'write down inner join query for users and userdetails table and perform join using userid',2,'OneSentence','jaya'),(1003,1003,1003,'Which are the types of joins?',2,'OneSentence','mahesh'),(1004,1003,1004,'write down inner join query for users and userdetails table and perform join using userid',2,'OneSentence','mahesh'),(1005,1003,1003,'Which are the types of joins?',2,'OneSentence','jagdeep'),(1006,1003,1004,'write down inner join query for users and userdetails table and perform join using userid',2,'OneSentence','jagdeep'),(1007,1004,1005,'what is table?',2,'OneSentence','rahul12'),(1008,1004,1006,'what is the use of stored procedure?',2,'OneSentence','rahul12');
/*!40000 ALTER TABLE `appearedexamquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appearedexams`
--

DROP TABLE IF EXISTS `appearedexams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appearedexams` (
  `aexId` int NOT NULL,
  `examId` int NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `dt` varchar(200) DEFAULT NULL,
  `tm` varchar(200) DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  `noQuestions` int DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL,
  `scheduledBy` varchar(200) DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `course` varchar(200) DEFAULT NULL,
  `subName` varchar(200) DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`aexId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearedexams`
--

LOCK TABLES `appearedexams` WRITE;
/*!40000 ALTER TABLE `appearedexams` DISABLE KEYS */;
INSERT INTO `appearedexams` VALUES (1001,1003,'Unit test Mysql Joins','2022-04-30','15:00',120,2,4,'appearing','shridhar','Computer',1,'BE','MYSQL',1003,'jaya'),(1002,1003,'Unit test Mysql Joins','2022-04-30','15:00',120,2,4,'appearing','shridhar','Computer',1,'BE','MYSQL',1003,'mahesh'),(1003,1003,'Unit test Mysql Joins','2022-04-30','15:00',120,2,4,'appearing','shridhar','Computer',1,'BE','MYSQL',1003,'jagdeep'),(1004,1004,'Unit test database','2022-04-30','18:00',60,2,4,'appearing','sachin23','Computer',1,'BE','Database',1004,'rahul12');
/*!40000 ALTER TABLE `appearedexams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branchid` int NOT NULL,
  `branchname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`branchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1001,'Computer'),(1002,'IT'),(1003,'Civil');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloudpayments`
--

DROP TABLE IF EXISTS `cloudpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloudpayments` (
  `id` int NOT NULL,
  `tenantid` varchar(200) NOT NULL,
  `paydt` varchar(200) DEFAULT NULL,
  `month` int unsigned DEFAULT NULL,
  `year` int unsigned DEFAULT NULL,
  `services` varchar(8000) NOT NULL,
  `rates` varchar(8000) NOT NULL,
  `susage` varchar(8000) NOT NULL,
  `rents` varchar(8000) NOT NULL,
  `total` float NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloudpayments`
--

LOCK TABLES `cloudpayments` WRITE;
/*!40000 ALTER TABLE `cloudpayments` DISABLE KEYS */;
INSERT INTO `cloudpayments` VALUES (1001,'pote','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','0,0,0','0.0,0.0,0.0',0,'pending'),(1002,'sipna','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','1,0,0','1.0,0.0,0.0',1,'pending'),(1003,'Raisoni','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','4,0,0','4.0,0.0,0.0',4,'pending'),(1004,'mauli','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1005,'ramMegheNew','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','3,1,0','3.0,1.0,0.0',4,'pending'),(1006,'Raisoni','NA',4,2022,'','1.0,1.0,0.0','4,0,0','4.0,0.0,0.0',4,'pending'),(1007,'pote','NA',4,2022,'','1.0,1.0,0.0','0,0,0','0.0,0.0,0.0',0,'pending'),(1008,'Raisoni','NA',4,2022,'','1.0,1.0,0.0','4,0,0','4.0,0.0,0.0',4,'pending'),(1009,'mauli','NA',4,2022,'','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1010,'mauli','NA',4,2022,'','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1011,'mauli','NA',4,2022,'','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1012,'mauli','NA',4,2022,'','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1013,'pote','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','0,0,0','0.0,0.0,0.0',0,'pending'),(1014,'Raisoni','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','4,0,0','4.0,0.0,0.0',4,'pending'),(1015,'mauli','NA',4,2022,'','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1016,'mauli','NA',4,2022,'','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1017,'mauli','NA',4,2022,'','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1018,'mauli','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1019,'ramMegheNew','NA',4,2022,'','1.0,1.0,0.0','3,1,0','3.0,1.0,0.0',4,'pending'),(1020,'pote','NA',4,2022,'','1.0,1.0,0.0','0,0,0','0.0,0.0,0.0',0,'pending'),(1021,'mauli','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending'),(1022,'ramMegheNew','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','3,1,0','3.0,1.0,0.0',4,'pending'),(1023,'sipna','NA',4,2022,'','1.0,1.0,0.0','1,0,0','1.0,0.0,0.0',1,'pending'),(1024,'ssgmc','NA',4,2022,'sqlattacks,email,login','1.0,1.0,0.0','0,1,0','0.0,1.0,0.0',1,'pending');
/*!40000 ALTER TABLE `cloudpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `userid` varchar(30) NOT NULL,
  `usernm` varchar(40) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  `collegeName` varchar(200) DEFAULT NULL,
  `mobileno` varchar(10) DEFAULT NULL,
  `emailid` varchar(30) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `userstatus` varchar(30) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `collegeId` varchar(200) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES ('mauli','Mauli College of Engg','college','Mauli College of Engg','9889876765','spiderprojects1@gmail.com','1990-12-12','Male','active','mauli.jpg','mauli',NULL),('pote','pote','college','Pote colg of engg','9889876765','spiderprojects1@gmail.com','1998-12-12','Male','active','pote.jpg','pote',NULL),('Raisoni','Rajendra Gode','college','Raisoni','9889876765','spiderprojects1@gmail.com','1998-12-12','Male','active','Raisoni.jpg','Raisoni',NULL),('ramMegheNew','Ram meghe new','college','Ram Meghe new','9889876765','prathmeshingle@outlook.com','1990-12-12','Male','active','ramMegheNew.jpg','ramMegheNew',NULL),('sipna','sipna','college','sipna engg college','9889876765','spiderprojects1@gmail.com','1998-12-12','Male','active','sipna.webp','sipna',NULL),('ssgmc','Sant gajanan Maharaj Enng','college','Sant gajanan Maharaj Enng','9889876765','prathmeshingle@outlook.com','1980-12-12','Male','active','ssgmc.jpg','ssgmc',NULL);
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `courseId` int NOT NULL,
  `courseName` varchar(200) DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `noOfSemesters` int DEFAULT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1001,'BE','Computer',8),(1002,'ME','Computer',4);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examanalysis`
--

DROP TABLE IF EXISTS `examanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examanalysis` (
  `analysisId` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(200) DEFAULT NULL,
  `examId` int DEFAULT NULL,
  `quesId` int DEFAULT NULL,
  `quesType` varchar(200) DEFAULT NULL,
  `reqTime` double DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL,
  `attempts` int DEFAULT NULL,
  PRIMARY KEY (`analysisId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examanalysis`
--

LOCK TABLES `examanalysis` WRITE;
/*!40000 ALTER TABLE `examanalysis` DISABLE KEYS */;
INSERT INTO `examanalysis` VALUES (33,'jasmin',1001,1002,'Answer',0,'WrongAnswer',1),(34,'jaya',1003,1003,'Answer',0,'WrongAnswer',1),(35,'jaya',1003,1004,'Answer',0,'WrongAnswer',1),(36,'jaya',1003,1003,'Answer',0,'WrongAnswer',2),(37,'jaya',1003,1004,'Answer',0,'WrongAnswer',2),(38,'mahesh',1003,1003,'Answer',0,'CorrectAnswer',1),(39,'mahesh',1003,1004,'Answer',0,'WrongAnswer',1),(40,'jagdeep',1003,1003,'Answer',0,'CorrectAnswer',7),(41,'jagdeep',1003,1004,'Answer',0,'WrongAnswer',1),(42,'rahul12',1004,1005,'Answer',0,'CorrectAnswer',2),(43,'rahul12',1004,1006,'Answer',0,'WrongAnswer',1);
/*!40000 ALTER TABLE `examanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestions`
--

DROP TABLE IF EXISTS `examquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examquestions` (
  `exQuesId` int NOT NULL,
  `examId` int DEFAULT NULL,
  `quesId` int DEFAULT NULL,
  `ques` varchar(9000) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `quesType` varchar(200) DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`exQuesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestions`
--

LOCK TABLES `examquestions` WRITE;
/*!40000 ALTER TABLE `examquestions` DISABLE KEYS */;
INSERT INTO `examquestions` VALUES (1001,1001,1001,'How to create table in mysql?',2,'OneSentence','nilesh'),(1002,1001,1002,'write down create table query for emp table',2,'OneSentence','nilesh'),(1003,1003,1003,'Which are the types of joins?',2,'OneSentence','shridhar'),(1004,1003,1004,'write down inner join query for users and userdetails table and perform join using userid',2,'OneSentence','shridhar'),(1005,1004,1005,'what is table?',2,'OneSentence','sachin23'),(1006,1004,1006,'what is the use of stored procedure?',2,'OneSentence','sachin23');
/*!40000 ALTER TABLE `examquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `examId` int NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `dt` varchar(200) DEFAULT NULL,
  `tm` varchar(200) DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  `noQuestions` int DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `course` varchar(200) DEFAULT NULL,
  `subName` varchar(200) DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `collegeid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`examId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (1001,'Unit test on mysql','2022-04-29','11:00',120,2,4,'scheduled','nilesh','Computer',1,'BE','MYSQL',1003,'sipna'),(1002,'Unit test','2022-04-30','14:48',120,0,4,'pending','shridhar','Computer',1,'BE','MYSQL',1003,'Raisoni'),(1003,'Unit test Mysql Joins','2022-04-30','15:00',120,2,4,'scheduled','shridhar','Computer',1,'BE','MYSQL',1003,'Raisoni'),(1004,'Unit test database','2022-04-30','18:00',60,2,4,'scheduled','sachin23','Computer',1,'BE','Database',1004,'ramMegheNew');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `getresult`
--

DROP TABLE IF EXISTS `getresult`;
/*!50001 DROP VIEW IF EXISTS `getresult`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `getresult` AS SELECT 
 1 AS `usernm`,
 1 AS `examId`,
 1 AS `userid`,
 1 AS `totalMarks`,
 1 AS `studMarks`,
 1 AS `percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gettotalmarks`
--

DROP TABLE IF EXISTS `gettotalmarks`;
/*!50001 DROP VIEW IF EXISTS `gettotalmarks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gettotalmarks` AS SELECT 
 1 AS `examId`,
 1 AS `userid`,
 1 AS `totalMarks`,
 1 AS `studMarks`,
 1 AS `percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loggedinusers`
--

DROP TABLE IF EXISTS `loggedinusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loggedinusers` (
  `id` int NOT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `utype` varchar(200) DEFAULT NULL,
  `dt` varchar(200) DEFAULT NULL,
  `tm` varchar(200) DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loggedinusers`
--

LOCK TABLES `loggedinusers` WRITE;
/*!40000 ALTER TABLE `loggedinusers` DISABLE KEYS */;
INSERT INTO `loggedinusers` VALUES (1001,'admin','admin','0:2','11/122021','loggedOut'),(1002,'admin','admin','0:4','11/122021','loggedOut'),(1003,'admin','admin','0:4','11/122021','loggedOut'),(1004,'admin','admin','0:5','11/122021','loggedOut'),(1005,'admin','admin','0:9','11/122021','loggedOut'),(1006,'admin','admin','0:10','11/122021','loggedOut'),(1007,'admin','admin','0:11','11/122021','loggedOut'),(1008,'admin','admin','0:11','11/122021','loggedOut'),(1009,'admin','admin','0:13','11/122021','loggedOut'),(1010,'admin','admin','0:14','11/122021','loggedOut'),(1011,'admin','admin','0:16','11/122021','loggedOut'),(1012,'admin','admin','0:16','11/122021','loggedOut'),(1013,'admin','admin','0:17','11/122021','loggedOut'),(1014,'admin','admin','0:18','11/122021','loggedOut'),(1015,'admin','admin','0:19','11/122021','loggedOut'),(1016,'admin','admin','0:20','11/122021','loggedOut'),(1017,'admin','admin','0:20','11/122021','loggedOut'),(1018,'admin','admin','0:20','11/122021','loggedOut'),(1019,'admin','admin','0:20','11/122021','loggedOut'),(1020,'admin','admin','14:53','11/122021','loggedOut'),(1021,'admin','admin','14:54','11/122021','loggedOut'),(1022,'admin','admin','14:55','11/122021','loggedOut'),(1023,'admin','admin','14:56','11/122021','loggedOut'),(1024,'admin','admin','14:56','11/122021','loggedOut'),(1025,'admin','admin','14:56','11/122021','loggedOut'),(1026,'admin','admin','14:57','11/122021','loggedOut'),(1027,'admin','admin','14:57','11/122021','loggedOut'),(1028,'admin','admin','14:59','11/122021','loggedOut'),(1029,'admin','admin','15:0','11/122021','loggedOut'),(1030,'admin','admin','15:0','11/122021','loggedOut'),(1031,'admin','admin','17:34','11/122021','loggedOut'),(1032,'admin','admin','17:38','11/122021','loggedOut'),(1033,'admin','admin','17:49','11/122021','loggedOut'),(1034,'nilesh','staff','18:0','11/122021','loggedOut'),(1035,'shamal','student','18:15','11/122021','loggedOut'),(1036,'admin','admin','17:39','12/122021','loggedOut'),(1037,'admin','admin','17:46','12/122021','loggedOut'),(1038,'admin','admin','17:47','12/122021','loggedOut'),(1039,'admin','admin','17:53','27/122021','loggedOut'),(1040,'admin','admin','17:58','27/122021','loggedOut'),(1041,'Harish','staff','17:59','27/122021','active'),(1042,'shamal','student','18:4','27/122021','active'),(1043,'admin','admin','18:18','27/122021','loggedOut'),(1044,'admin','admin','11:6','29/122021','loggedOut'),(1045,'nilesh','staff','11:7','29/122021','loggedOut'),(1046,'nilesh','staff','11:8','29/122021','loggedOut'),(1047,'nilesh','staff','11:10','29/122021','loggedOut'),(1048,'cloudadmin','cloudadmin','14:26','27/42022','loggedOut'),(1049,'cloudadmin','cloudadmin','14:30','27/42022','loggedOut'),(1050,'cloudadmin','cloudadmin','14:35','27/42022','loggedOut'),(1051,'sipna','college','14:50','27/42022','loggedOut'),(1052,'sipna','college','14:51','27/42022','loggedOut'),(1053,'sipna','college','14:52','27/42022','loggedOut'),(1054,'cloudadmin','cloudadmin','15:38','28/42022','loggedOut'),(1055,'admin','admin','22:2','28/42022','loggedOut'),(1056,'nilesh','staff','23:5','28/42022','loggedOut'),(1057,'admin','admin','23:6','28/42022','active'),(1058,'sipna','college','23:7','28/42022','loggedOut'),(1059,'nilesh','staff','23:10','28/42022','loggedOut'),(1060,'nilesh','staff','1:6','29/42022','loggedOut'),(1061,'nilesh','staff','10:4','29/42022','loggedOut'),(1062,'nilesh','staff','10:41','29/42022','loggedOut'),(1063,'jasmin123','student','11:15','29/42022','active'),(1064,'jasmin','student','11:54','29/42022','loggedOut'),(1065,'jasmin','student','12:6','29/42022','loggedOut'),(1066,'nilesh','staff','12:58','29/42022','loggedOut'),(1067,'cloudadmin','cloudadmin','13:0','29/42022','loggedOut'),(1068,'cloudadmin','cloudadmin','13:15','29/42022','loggedOut'),(1069,'nilesh','staff','13:32','29/42022','active'),(1070,'cloudadmin','cloudadmin','13:34','29/42022','loggedOut'),(1071,'sipna','college','13:38','29/42022','loggedOut'),(1072,'cloudadmin','cloudadmin','13:44','30/42022','loggedOut'),(1073,'cloudadmin','cloudadmin','14:14','30/42022','loggedOut'),(1074,'raisoni','college','14:22','30/42022','loggedOut'),(1075,'sipna','college','14:40','30/42022','active'),(1076,'shridhar','staff','14:42','30/42022','loggedOut'),(1077,'raisoni','college','15:8','30/42022','loggedOut'),(1078,'jaya','student','15:8','30/42022','loggedOut'),(1079,'jasmin','student','15:11','30/42022','active'),(1080,'jaya','student','15:12','30/42022','active'),(1081,'raisoni','college','15:35','30/42022','loggedOut'),(1082,'mahesh','student','15:35','30/42022','active'),(1083,'shridhar','staff','15:38','30/42022','active'),(1084,'raisoni','college','15:39','30/42022','active'),(1085,'jagdeep','student','15:40','30/42022','active'),(1086,'cloudadmin','cloudadmin','17:18','30/42022','loggedOut'),(1087,'ramMegheNew','college','17:22','30/42022','loggedOut'),(1088,'ramMegheNew','college','17:24','30/42022','active'),(1089,'sachin23','staff','17:30','30/42022','loggedOut'),(1090,'sachin23','staff','18:5','30/42022','loggedOut'),(1091,'rahul12','student','18:11','30/42022','active'),(1092,'cloudadmin','cloudadmin','18:20','30/42022','active'),(1093,'ssgmc','college','18:21','30/42022','active'),(1094,'sachin23','staff','18:53','30/42022','active');
/*!40000 ALTER TABLE `loggedinusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginlog`
--

DROP TABLE IF EXISTS `loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginlog` (
  `logid` int NOT NULL,
  `logindt` varchar(100) DEFAULT NULL,
  `loginmonth` int DEFAULT NULL,
  `loginyear` int DEFAULT NULL,
  `userid` varchar(80) DEFAULT NULL,
  `logintype` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginlog`
--

LOCK TABLES `loginlog` WRITE;
/*!40000 ALTER TABLE `loginlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qst`
--

DROP TABLE IF EXISTS `qst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qst` (
  `qstId` int NOT NULL,
  `qstType` varchar(200) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  PRIMARY KEY (`qstId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qst`
--

LOCK TABLES `qst` WRITE;
/*!40000 ALTER TABLE `qst` DISABLE KEYS */;
INSERT INTO `qst` VALUES (1003,'OneSentence',2),(1006,'YesNoType',1),(1007,'Objective',1);
/*!40000 ALTER TABLE `qst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quesbank`
--

DROP TABLE IF EXISTS `quesbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quesbank` (
  `quesId` int NOT NULL,
  `ques` varchar(9000) DEFAULT NULL,
  `unitId` int DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `marks` float DEFAULT NULL,
  `quesType` varchar(200) DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `answer` varchar(900) DEFAULT NULL,
  `option1` varchar(900) DEFAULT NULL,
  `option2` varchar(900) DEFAULT NULL,
  `option3` varchar(900) DEFAULT NULL,
  `option4` varchar(900) DEFAULT NULL,
  `collegeid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`quesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quesbank`
--

LOCK TABLES `quesbank` WRITE;
/*!40000 ALTER TABLE `quesbank` DISABLE KEYS */;
INSERT INTO `quesbank` VALUES (1001,'How to create table in mysql?',1003,1003,2,'OneSentence','nilesh','using create query','NA','NA','NA','NA','sipna'),(1002,'write down create table query for emp table',1003,1003,2,'OneSentence','nilesh','create table emp( empid integer,empname varchar(200));','NA','NA','NA','NA','sipna'),(1003,'Which are the types of joins?',1004,1003,2,'OneSentence','shridhar','inner join, outer join, self join, cross join etc','NA','NA','NA','NA','Raisoni'),(1004,'write down inner join query for users and userdetails table and perform join using userid',1004,1003,2,'OneSentence','shridhar','select u.* from users u inner join userdetails d on u.userid=d.userid','NA','NA','NA','NA','Raisoni'),(1005,'what is table?',1005,1004,2,'OneSentence','sachin23','table is a database object','NA','NA','NA','NA','ramMegheNew'),(1006,'what is the use of stored procedure?',1005,1004,2,'OneSentence','sachin23','it is used to execute more than one queries at the same time','NA','NA','NA','NA','ramMegheNew');
/*!40000 ALTER TABLE `quesbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizanalysis`
--

DROP TABLE IF EXISTS `quizanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizanalysis` (
  `id` int NOT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `ques` varchar(900) DEFAULT NULL,
  `ans` varchar(200) DEFAULT NULL,
  `dt` varchar(200) DEFAULT NULL,
  `tm` varchar(200) DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL,
  `qqid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizanalysis`
--

LOCK TABLES `quizanalysis` WRITE;
/*!40000 ALTER TABLE `quizanalysis` DISABLE KEYS */;
INSERT INTO `quizanalysis` VALUES (1,'jasmin','How to create table in mysql?','\' union select * from users','29/4/2022','11:54','WrongAnswer',1001),(2,'jasmin','How to create table in mysql?','\' union select * from users','29/4/2022','12:7','WrongAnswer',1001),(3,'jasmin','How to create table in mysql?','\' union select * from users','29/4/2022','12:15','WrongAnswer',1001),(4,'jasmin','How to create table in mysql?','\' union select * from users','29/4/2022','12:17','WrongAnswer',1001),(5,'jasmin','How to create table in mysql?','\' union select * from users','29/4/2022','12:18','WrongAnswer',1001),(6,'jasmin','How to create table in mysql?','\' union select * from users','29/4/2022','12:19','WrongAnswer',1001),(7,'jasmin','How to create table in mysql?','\' union select * from users','29/4/2022','12:20','WrongAnswer',1001),(8,'jasmin','How to create table in mysql?','using create table query','29/4/2022','12:26','WrongAnswer',1001),(9,'jasmin','How to create table in mysql?','using query','29/4/2022','12:31','WrongAnswer',1001),(10,'jasmin','How to create table in mysql?','select * from table','29/4/2022','12:36','WrongAnswer',1001),(11,'jasmin','How to create table in mysql?','using query','29/4/2022','12:38','WrongAnswer',1001),(12,'jasmin','How to create table in mysql?','using create table query','29/4/2022','12:42','WrongAnswer',1001),(13,'jasmin','How to create table in mysql?','using create table','29/4/2022','12:44','WrongAnswer',1001),(14,'jasmin','write down create table query for emp table','create table emp(empid integer,empname varchar(200);','29/4/2022','12:46','WrongAnswer',1001),(15,'jaya','Which are the types of joins?','inner join,outer join,self join,cross join','30/4/2022','15:12','WrongAnswer',1003),(16,'jaya','write down inner join query for users and userdetails table and perform join using userid','dont know','30/4/2022','15:18','WrongAnswer',1003),(17,'jaya','Which are the types of joins?','inner join,self join\r\n','30/4/2022','15:27','WrongAnswer',1003),(18,'jaya','write down inner join query for users and userdetails table and perform join using userid','sample','30/4/2022','15:32','WrongAnswer',1003),(19,'mahesh','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:36','CorrectAnswer',1003),(20,'mahesh','write down inner join query for users and userdetails table and perform join using userid','select u.* from users u inner join userdetails d on u.userid=d.userid;','30/4/2022','15:37','WrongAnswer',1003),(21,'jagdeep','Which are the types of joins?','\' drop table sample','30/4/2022','15:40','WrongAnswer',1003),(22,'jagdeep','Which are the types of joins?','\' union select * from users','30/4/2022','15:41','WrongAnswer',1003),(23,'jagdeep','Which are the types of joins?','\' drop table sample','30/4/2022','15:42','WrongAnswer',1003),(24,'jagdeep','Which are the types of joins?','\' delete from sample','30/4/2022','15:43','WrongAnswer',1003),(25,'jagdeep','Which are the types of joins?','\' 1=1-+','30/4/2022','15:44','WrongAnswer',1003),(26,'jagdeep','Which are the types of joins?','\' drop table sample','30/4/2022','15:49','WrongAnswer',1003),(27,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:49','CorrectAnswer',1003),(28,'jagdeep','write down inner join query for users and userdetails table and perform join using userid','dont now','30/4/2022','15:50','WrongAnswer',1003),(29,'rahul12','what is table?','\' union select * from users','30/4/2022','18:12','WrongAnswer',1004),(30,'rahul12','what is table?','table is a database object','30/4/2022','18:13','CorrectAnswer',1004),(31,'rahul12','what is the use of stored procedure?','it is view','30/4/2022','18:14','WrongAnswer',1004);
/*!40000 ALTER TABLE `quizanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizliveperformance`
--

DROP TABLE IF EXISTS `quizliveperformance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizliveperformance` (
  `id` int NOT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `ques` varchar(900) DEFAULT NULL,
  `ans` varchar(200) DEFAULT NULL,
  `dt` varchar(200) DEFAULT NULL,
  `tm` varchar(200) DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL,
  `csts` varchar(200) DEFAULT NULL,
  `color` varchar(200) DEFAULT NULL,
  `qqid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizliveperformance`
--

LOCK TABLES `quizliveperformance` WRITE;
/*!40000 ALTER TABLE `quizliveperformance` DISABLE KEYS */;
INSERT INTO `quizliveperformance` VALUES (1,'jasmin','How to create table in mysql?','using create query','29/4/2022','11:54','WrongAnswer','prevAttempt','btn-danger',1001),(2,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:7','WrongAnswer','prevAttempt','btn-danger',1001),(3,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:15','WrongAnswer','prevAttempt','btn-danger',1001),(4,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:17','WrongAnswer','prevAttempt','btn-danger',1001),(5,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:18','WrongAnswer','prevAttempt','btn-danger',1001),(6,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:19','WrongAnswer','prevAttempt','btn-danger',1001),(7,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:20','WrongAnswer','prevAttempt','btn-danger',1001),(8,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:26','WrongAnswer','prevAttempt','btn-danger',1001),(9,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:31','WrongAnswer','prevAttempt','btn-danger',1001),(10,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:36','WrongAnswer','prevAttempt','btn-danger',1001),(11,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:38','WrongAnswer','prevAttempt','btn-danger',1001),(12,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:42','WrongAnswer','prevAttempt','btn-danger',1001),(13,'jasmin','How to create table in mysql?','using create query','29/4/2022','12:44','WrongAnswer','current','btn-danger',1001),(14,'jasmin','write down create table query for emp table','create table emp( empid integer,empname varchar(200));','29/4/2022','12:46','WrongAnswer','current','btn-danger',1001),(15,'jaya','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:12','WrongAnswer','prevAttempt','btn-danger',1003),(16,'jaya','write down inner join query for users and userdetails table and perform join using userid','select u.* from users u inner join userdetails d on u.userid=d.userid','30/4/2022','15:18','WrongAnswer','prevAttempt','btn-danger',1003),(17,'jaya','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:27','WrongAnswer','current','btn-danger',1003),(18,'jaya','write down inner join query for users and userdetails table and perform join using userid','select u.* from users u inner join userdetails d on u.userid=d.userid','30/4/2022','15:32','WrongAnswer','current','btn-danger',1003),(19,'mahesh','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:36','CorrectAnswer','current','btn-success',1003),(20,'mahesh','write down inner join query for users and userdetails table and perform join using userid','select u.* from users u inner join userdetails d on u.userid=d.userid','30/4/2022','15:37','WrongAnswer','current','btn-danger',1003),(21,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:40','WrongAnswer','prevAttempt','btn-danger',1003),(22,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:41','WrongAnswer','prevAttempt','btn-danger',1003),(23,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:42','WrongAnswer','prevAttempt','btn-danger',1003),(24,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:43','WrongAnswer','prevAttempt','btn-danger',1003),(25,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:44','WrongAnswer','prevAttempt','btn-danger',1003),(26,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:49','WrongAnswer','prevAttempt','btn-danger',1003),(27,'jagdeep','Which are the types of joins?','inner join, outer join, self join, cross join etc','30/4/2022','15:49','CorrectAnswer','current','btn-success',1003),(28,'jagdeep','write down inner join query for users and userdetails table and perform join using userid','select u.* from users u inner join userdetails d on u.userid=d.userid','30/4/2022','15:50','WrongAnswer','current','btn-danger',1003),(29,'rahul12','what is table?','table is a database object','30/4/2022','18:12','WrongAnswer','prevAttempt','btn-danger',1004),(30,'rahul12','what is table?','table is a database object','30/4/2022','18:13','CorrectAnswer','current','btn-success',1004),(31,'rahul12','what is the use of stored procedure?','it is used to execute more than one queries at the same time','30/4/2022','18:14','WrongAnswer','current','btn-danger',1004);
/*!40000 ALTER TABLE `quizliveperformance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `resultId` bigint NOT NULL AUTO_INCREMENT,
  `examId` int DEFAULT NULL,
  `quesId` int DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `qmarks` double DEFAULT NULL,
  PRIMARY KEY (`resultId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (72,1001,1002,'jasmin',0,3,1),(73,1003,1003,'jaya',0,3,1),(74,1003,1003,'jaya',0,3,1),(75,1003,1004,'jaya',0,3,1),(76,1003,1004,'jaya',0,3,1),(77,1003,1003,'mahesh',1,0,1),(78,1003,1004,'mahesh',0,3,1),(79,1003,1003,'jagdeep',1,0,1),(80,1003,1004,'jagdeep',0,3,1),(81,1004,1005,'rahul12',1,0,1),(82,1004,1006,'rahul12',0,3,1);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savecurrentstate`
--

DROP TABLE IF EXISTS `savecurrentstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savecurrentstate` (
  `sid` bigint NOT NULL AUTO_INCREMENT,
  `userid` varchar(200) DEFAULT NULL,
  `examId` int DEFAULT NULL,
  `quesNo` int DEFAULT NULL,
  `enddt` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savecurrentstate`
--

LOCK TABLES `savecurrentstate` WRITE;
/*!40000 ALTER TABLE `savecurrentstate` DISABLE KEYS */;
INSERT INTO `savecurrentstate` VALUES (92,'jasmin',1001,1,'April 29, 2022 13:00:00'),(93,'jaya',1003,1,'April 30, 2022 17:00:00'),(95,'mahesh',1003,2,'April 30, 2022 17:00:00'),(97,'jagdeep',1003,2,'April 30, 2022 17:00:00'),(99,'rahul12',1004,2,'April 30, 2022 19:00:00');
/*!40000 ALTER TABLE `savecurrentstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceId` int NOT NULL,
  `service` varchar(200) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`serviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1002,'sqlattacks',1),(1004,'email',1),(1005,'login',0);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlkeywords`
--

DROP TABLE IF EXISTS `sqlkeywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sqlkeywords` (
  `sqlid` int NOT NULL,
  `keyw` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sqlid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlkeywords`
--

LOCK TABLES `sqlkeywords` WRITE;
/*!40000 ALTER TABLE `sqlkeywords` DISABLE KEYS */;
INSERT INTO `sqlkeywords` VALUES (1,'delete'),(2,'delete from'),(3,'select'),(4,'inner join'),(5,'outer join'),(6,'select * from'),(7,'insert into'),(8,'create table'),(9,'alter table'),(10,'drop table'),(11,'drop table'),(12,'drop view'),(13,'create storedprocedure'),(14,'create procedure'),(15,'create function'),(16,'create view'),(17,'drop view'),(18,'drop procedure'),(19,'drop function');
/*!40000 ALTER TABLE `sqlkeywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffpersonal`
--

DROP TABLE IF EXISTS `staffpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffpersonal` (
  `userid` varchar(30) NOT NULL,
  `usernm` varchar(40) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `mobileno` varchar(10) DEFAULT NULL,
  `emailid` varchar(30) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `userstatus` varchar(30) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `collegeid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffpersonal`
--

LOCK TABLES `staffpersonal` WRITE;
/*!40000 ALTER TABLE `staffpersonal` DISABLE KEYS */;
INSERT INTO `staffpersonal` VALUES ('Harish','Harish','staff','Computer','9889876765','spiderprojects1@gmail.com','1990-12-12','male','active','common.png','sipna'),('nilesh','Nilesh','staff','Computer','9878765654','spiderprojects1@gmail.com','1987-12-12','male','active','nilesh.png','sipna'),('sachin23','sachin','staff','Computer','9889876765','prathmeshingle@outlook.com','1990-12-12','male','active','common.png','ramMegheNew'),('shridhar','shridhar','staff','Computer','9889876765','spiderprojects1@gmail.com','1990-12-12','male','active','common.png','Raisoni');
/*!40000 ALTER TABLE `staffpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studanswers`
--

DROP TABLE IF EXISTS `studanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studanswers` (
  `studAnsId` int NOT NULL,
  `quesId` int DEFAULT NULL,
  `examId` int DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `ans` longblob,
  `ansType` varchar(200) DEFAULT NULL,
  `scoreFW` double DEFAULT NULL,
  `scoreCosine` double DEFAULT NULL,
  `amarks` double DEFAULT NULL,
  `qmarks` double DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`studAnsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studanswers`
--

LOCK TABLES `studanswers` WRITE;
/*!40000 ALTER TABLE `studanswers` DISABLE KEYS */;
INSERT INTO `studanswers` VALUES (1001,1001,1001,'jasmin',_binary 'using create table','Answer',0,0,0,2,'evaluated'),(1002,1002,1001,'jasmin',_binary 'create table emp(empid integer,empname varchar(200);','Answer',0,0,0,2,'evaluated'),(1003,1003,1003,'jaya',_binary 'inner join,self join','Answer',0,0,0,2,'evaluated'),(1004,1004,1003,'jaya',_binary 'sample','Answer',0,0,0,2,'evaluated'),(1005,1003,1003,'mahesh',_binary 'inner join, outer join, self join, cross join etc','Answer',0,0,2,2,'evaluated'),(1006,1004,1003,'mahesh',_binary 'select u.* from users u inner join userdetails d on u.userid=d.userid;','Answer',0,0,0,2,'evaluated'),(1007,1003,1003,'jagdeep',_binary 'inner join, outer join, self join, cross join etc','Answer',0,0,2,2,'evaluated'),(1008,1004,1003,'jagdeep',_binary 'dont now','Answer',0,0,0,2,'evaluated'),(1009,1005,1004,'rahul12',_binary 'table is a database object','Answer',0,0,2,2,'evaluated'),(1010,1006,1004,'rahul12',_binary 'it is view','Answer',0,0,0,2,'evaluated');
/*!40000 ALTER TABLE `studanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentpersonal`
--

DROP TABLE IF EXISTS `studentpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentpersonal` (
  `userid` varchar(30) NOT NULL,
  `usernm` varchar(40) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `semester` varchar(30) DEFAULT NULL,
  `mobileno` varchar(10) DEFAULT NULL,
  `emailid` varchar(30) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `userstatus` varchar(30) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `course` varchar(200) DEFAULT NULL,
  `collegeid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentpersonal`
--

LOCK TABLES `studentpersonal` WRITE;
/*!40000 ALTER TABLE `studentpersonal` DISABLE KEYS */;
INSERT INTO `studentpersonal` VALUES ('jagdeep','jagdeep','student','Computer','1','9889876765','spiderprojects1@gmail.com','1990-12-12','Male','active','jagdeep.jpg','BE','Raisoni'),('jasmin','jasmin','student','Computer','1','9889876765','spiderprojects1@gmail.com','2000-12-12','Female','active','jasmin.png','BE','sipna'),('jasmin123','jasmin','student','Computer','1','9889876765','spiderprojects1@gmail.com','1998-12-12','Female','active','jasmin123.webp','BE','sipna'),('jaya','jaya','student','Computer','1','9889876765','spiderprojects1@gmail.com','1990-12-12','Male','active','jaya.jpg','BE','Raisoni'),('mahesh','mahesh','student','Computer','1','9889876765','spiderprojects1@gmail.com','1990-12-29','Male','active','mahesh.jpg','BE','Raisoni'),('rahul12','Rahul','student','Computer','1','9889876765','prathmeshingle@outlook.com','1990-12-12','Male','active','rahul12.jpg','BE','ramMegheNew'),('shamal','Shamal','student','Computer','1','9878765654','spiderprojects1@gmail.com','1998-12-12','Female','active','shamal.png','BE','sipna');
/*!40000 ALTER TABLE `studentpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suballocation`
--

DROP TABLE IF EXISTS `suballocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suballocation` (
  `allocationId` int NOT NULL,
  `subId` int DEFAULT NULL,
  `subjectName` varchar(200) DEFAULT NULL,
  `staffUserid` varchar(200) DEFAULT NULL,
  `dt` varchar(200) DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `courseId` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  PRIMARY KEY (`allocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suballocation`
--

LOCK TABLES `suballocation` WRITE;
/*!40000 ALTER TABLE `suballocation` DISABLE KEYS */;
INSERT INTO `suballocation` VALUES (1001,1001,'Core Java','nilesh','11/12/2021','Computer',1001,1),(1002,1002,'PHP','Harish','27/12/2021','Computer',1001,1),(1003,1003,'MYSQL','shridhar','30/4/2022','Computer',1001,1),(1004,1004,'Database','sachin23','30/4/2022','Computer',1001,1);
/*!40000 ALTER TABLE `suballocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subId` int NOT NULL,
  `subName` varchar(200) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `course` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`subId`),
  UNIQUE KEY `subName` (`subName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1001,'Core Java',1,'Computer','BE'),(1002,'PHP',1,'Computer','BE'),(1003,'MYSQL',1,'Computer','BE'),(1004,'Database',1,'Computer','BE');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `unitId` int NOT NULL,
  `unitName` varchar(200) DEFAULT NULL,
  `subId` int DEFAULT NULL,
  `subjectName` varchar(200) DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`unitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1001,'Data Types',1001,'Core Java','nilesh'),(1002,'Unit1',1002,'PHP','Harish'),(1003,'Tables',1003,'MYSQL','nilesh'),(1004,'MySQL Joins',1003,'MYSQL','shridhar'),(1005,'DML Queries',1004,'Database','sachin23');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usagelog`
--

DROP TABLE IF EXISTS `usagelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usagelog` (
  `logid` int NOT NULL,
  `userid` varchar(80) DEFAULT NULL,
  `action` varchar(200) DEFAULT NULL,
  `actiondt` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usagelog`
--

LOCK TABLES `usagelog` WRITE;
/*!40000 ALTER TABLE `usagelog` DISABLE KEYS */;
INSERT INTO `usagelog` VALUES (1001,'sipna','sqlattacks','Fri Apr 29 13:34:06 IST 2022/4/2022'),(1002,'mauli','email','Sat Apr 30 14:21:30 IST 2022/4/2022'),(1003,'Raisoni','sqlattacks','Sat Apr 30 15:42:07 IST 2022/4/2022'),(1004,'Raisoni','sqlattacks','Sat Apr 30 15:48:52 IST 2022/4/2022'),(1005,'Raisoni','sqlattacks','Sat Apr 30 15:48:54 IST 2022/4/2022'),(1006,'Raisoni','sqlattacks','Sat Apr 30 15:49:32 IST 2022/4/2022'),(1007,'ramMegheNew','email','Sat Apr 30 17:18:49 IST 2022/4/2022'),(1008,'ramMegheNew','sqlattacks','Sat Apr 30 17:39:46 IST 2022/4/2022'),(1009,'ramMegheNew','sqlattacks','Sat Apr 30 18:12:48 IST 2022/4/2022'),(1010,'ssgmc','email','Sat Apr 30 18:21:05 IST 2022/4/2022'),(1011,'ramMegheNew','sqlattacks','Sat Apr 30 18:54:53 IST 2022/4/2022');
/*!40000 ALTER TABLE `usagelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` varchar(30) NOT NULL,
  `usernm` varchar(40) DEFAULT NULL,
  `pswd` varchar(30) DEFAULT NULL,
  `usertype` varchar(30) DEFAULT NULL,
  `userstatus` varchar(30) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `collegeid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('cloudadmin','cloud admin','cloud@123','cloudadmin','active','NA','NA'),('Harish','Harish','Test@123','staff','active','Computer','sipna'),('jagdeep','jagdeep','test','student','active','Computer','Raisoni'),('jasmin','jasmin','test','student','active','Computer','sipna'),('jasmin123','jasmin','test','student','active','Computer','sipna'),('jaya','jaya','test','student','active','Computer','Raisoni'),('mahesh','mahesh','test','student','active','Computer','Raisoni'),('mauli','Mauli College of Engg','test','college','active','NA','NA'),('nilesh','Nilesh','Test@123','staff','active','Computer','sipna'),('pote','pote','test','college','active','NA','pote'),('rahul12','Rahul','test','student','active','Computer','ramMegheNew'),('Raisoni','Rajendra Gode','test@123','college','active','NA','NA'),('ramMegheNew','Ram meghe new','ram','college','active','NA','NA'),('sachin23','sachin','test','staff','active','Computer','ramMegheNew'),('shamal','Shamal','Test@123','student','active','Computer','sipna'),('shridhar','shridhar','test','staff','active','Computer','Raisoni'),('sipna','sipna','sipna','college','active','NA','NA'),('ssgmc','Sant gajanan Maharaj Enng','test','college','active','NA','NA');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cloudsqlinjdb'
--

--
-- Dumping routines for database 'cloudsqlinjdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `changePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changePassword`(in userid1 varchar(200),in pass1 varchar(200))
BEGIN
update users set pswd=pass1 where userid=userid1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `chkPass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `chkPass`(in userid1 varchar(200),in pass1 varchar(200))
BEGIN
select * from users where userid=userid1 and pswd=pass1 and userstatus='active';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllottedSubjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllottedSubjects`(in branch1 varchar(200),in courseId1 integer,in semester1 integer,in userid1 varchar(200))
begin
declare courseNm varchar(200);
set courseNm=(select courseName from courses where courseId=courseId1);
 select s.* from subjects s inner join suballocation a on s.subId=a.subId and a.staffUserid=userid1  where s.course=courseNm  and s.branch=branch1 and s.semester=semester1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBranches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBranches`()
begin
 select * from branches;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCourses`(in branch1 varchar(200))
begin
 select * from courses where branch=branch1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExamConducted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamConducted`(in userid1 varchar(200))
begin
 select *,case when DATEDIFF(dt,DATE(NOW()))<0 then 'conducted' else 'scheduled' end currentSts from exams where userid=userid1 and DATEDIFF(dt,DATE(NOW()))<=0;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExamConductedStud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamConductedStud`(in userid1 varchar(200))
begin
 select *,case when DATEDIFF(dt,DATE(NOW()))<0 then 'conducted' else 'scheduled' end currentSts from  appearedexams where userid=userid1 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExamPending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamPending`(in userid1 varchar(200))
begin  
select *,(select count(*)  from examQuestions q where q.examId=e.examId) as quesNo
,(select ifnull(sum(marks),0)  from examQuestions q where q.examId=e.examId) as TotalMarksOFRegisteredQues from exams e where e.userid=userid1 and e.sts='pending' ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExamQues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamQues`(in examId1 integer)
begin
 select * from examquestions where examId=examId1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExamQuesStud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamQuesStud`(in examId1 integer,in userid1 varchar(200))
begin
select * from examquestions where examId=examId1 and quesId not in (select quesId from appearedExamQuestions where userid=userid1 and examId=examId1) order by exQuesId asc limit 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getExamScheduled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getExamScheduled`(in userid1 varchar(200))
begin
 select *,case when DATEDIFF(dt,DATE(NOW()))<0 then 'conducted' else 'scheduled' end currentSts from exams where userid=userid1 and DATEDIFF(dt,DATE(NOW()))>=0;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getlastSeen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getlastSeen`(in userid1 varchar(200))
begin
select dt,tm from loggedInUsers where userid=userid1 order by id desc limit 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMaxIdBranches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMaxIdBranches`()
begin
select ifnull(max(branchid),1000) as mxid from branches ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMaxIdQst` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMaxIdQst`()
begin
select ifnull(max(qstId),1000) as mxid from Qst ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOnlineUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOnlineUsers`()
begin
 select l.userid,l.utype,u.usernm as username from loggedInUsers l inner join users u on l.userid=u.userid and l.sts='active';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQMarks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQMarks`(in qtyp varchar(200))
begin
select marks from Qst where qstType=qtyp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuestions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuestions`(in unitId1 integer)
begin  
select * from quesbank where unitId=unitId1 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getQuesTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQuesTypes`()
begin
select qstType from Qst ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResult`(in userid1 varchar(200),in examId1 integer)
begin
 select r.examId,r.quesId,e.ques,e.marks,e.quesType,r.marks as examMarks,r.userid ,case when r.grade=3 then 'D'  when r.grade=0 then 'A'  when r.grade=1 then 'B'  when r.grade=2 then 'C' end as grade  from result r inner join examquestions e on r.examId=e.examId and r.quesId=e.quesId and r.userid=userid1 and r.examId=examId1;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getScheduledExamsStud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getScheduledExamsStud`(in branch1 varchar(200),in sem1 integer,in course1 varchar(200),in userid1 varchar(200),in colgid varchar(200))
begin  
select *,date_add(concat(dt,' ',tm),interval duration minute) as enddt  from exams where collegeid=colgid and course=course1 and sem=sem1 and branch=branch1 and dt=CURDATE() and TIMESTAMPDIFF(MINUTE,concat(dt,' ',tm),now())<(duration*60) and sts='scheduled' and examId not in (select examId from  appearedexams where userid=userid1);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getScore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getScore`(in userid1 varchar(200),in examId1 integer)
begin
 select quesId,attempts,case when sts='CorrectAnswer' then 1 else 0 end as marks from examanalysis where userid=userid1 and examId=examId1 order by quesId asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSemNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSemNo`(in courseId1 integer)
begin
 select noOfSemesters from courses where courseId=courseId1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSubjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubjects`(in branch1 varchar(200),in courseId1 integer,in semester1 integer)
begin
declare courseNm varchar(200);
set courseNm=(select courseName from courses where courseId=courseId1);
 select * from subjects where course=courseNm  and branch=branch1 and semester=semester1 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSubjectsAllottedStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubjectsAllottedStaff`(in userid1 varchar(200))
begin

select s.*,c.courseName from suballocation s inner join courses c on s.courseId=c.courseId where s.staffUserid=userid1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUnits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUnits`(in subId1 integer)
begin  
select * from units where subId=subId1 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertAExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAExam`(in examId1 integer,in userid1 varchar(200))
begin
declare mxid integer; 
if not (select exists(select * from appearedExams where examId=examId1 and userid=userid1)) then
set mxid=(select ifnull(max(aexId),1000) from appearedExams);
set mxid=mxid+1; 
insert into appearedExams select mxid,examId,title,dt,tm,duration,noQuestions,marks,'appearing',userid as scheduledBy,branch,sem,course,subName,subId,userid1 from exams where examId=examId1 ;  
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertAExamAnswers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAExamAnswers`(in examId1 integer,in quesid1 integer,in userid1 varchar(200),in ans1 longblob,in anstyp1 varchar(200),in qmarks1 double,in cosinesim1 double,in fwsim1 double,in amarks1 double,in attempts1 integer,in reqTime1 double)
begin
declare mxid integer;
declare mxid1 integer;
declare quesType1 varchar(200);
declare ques1 varchar(9000);
declare marks1 double;
if (select not exists(select * from appearedExamQuestions where examId=examId1 and quesId=quesid1 and userid=userid1))=1 then
	set mxid=(select ifnull(max(exQuesId),1000) from appearedExamQuestions);
	set mxid=mxid+1; 
	insert into appearedExamQuestions select mxid,examId,quesId,ques,marks,quesType,userid1 from examquestions where examId=examId1 and quesId=quesid1;  
end if;
if (select not exists(select * from studanswers where examId=examId1 and quesId=quesid1 and userid=userid1 and ansType=anstyp1 and ans=ans1))=1 then
	set mxid1=(select ifnull(max(studAnsId),1000) from studanswers);
	set mxid1=mxid1+1;
    set marks1=(select ifnull((select ifnull(marks,0) as marks  from quesbank where quesId=quesid1 and lower(answer) like concat('%',lower(ans1),'%')),0) as marks);
	insert into studanswers values(mxid1,quesid1,examId1,userid1,ans1,anstyp1,0,0,amarks1,qmarks1,'evaluated');  
    if amarks1>0 then
    insert into examanalysis(userid,examId,quesId,quesType,reqTime,sts,attempts) values(userid1,examId1,quesid1,anstyp1,reqTime1,'CorrectAnswer',attempts1);
    else
    insert into examanalysis(userid,examId,quesId,quesType,reqTime,sts,attempts) values(userid1,examId1,quesid1,anstyp1,reqTime1,'WrongAnswer',attempts1);
    end if;
    select mxid1 as ansId;
else
	select studAnsId as ansId from studanswers where examId=examId1 and quesId=quesid1 and userid=userid1 and ansType=anstyp1 and ans=ans1;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertAExamQuestions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertAExamQuestions`(in examId1 integer,in quesid1 integer,in userid1 varchar(200),in ans1 longblob,in anstyp1 varchar(200),in qmarks1 double)
begin
declare mxid integer;
declare mxid1 integer;
declare quesType1 varchar(200);
declare ques1 varchar(9000);
declare marks1 double;
if (select not exists(select * from appearedExamQuestions where examId=examId1 and quesId=quesid1 and userid=userid1))=1 then
	set mxid=(select ifnull(max(exQuesId),1000) from appearedExamQuestions);
	set mxid=mxid+1; 
	insert into appearedExamQuestions select mxid,examId,quesId,ques,marks,quesType,userid1 from examquestions where examId=examId1 and quesId=quesid1;  
end if;
if (select not exists(select * from studanswers where examId=examId1 and quesId=quesid1 and userid=userid1 and ansType=anstyp1 and ans=ans1))=1 then
	set mxid1=(select ifnull(max(studAnsId),1000) from studanswers);
	set mxid1=mxid1+1; 
	insert into studanswers values(mxid1,quesid1,examId1,userid1,ans1,anstyp1,0,0,0,qmarks1,'pending');  
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCourses`(in courseName1 varchar(200),in branch1 varchar(200),in semNo integer)
begin
declare mxid integer;
set mxid=(select ifnull(max(courseId),1000) from courses);
set mxid=mxid+1;
insert into courses values(mxid,courseName1,branch1,semNo);  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExam`(in title1 varchar(200),in dt1 varchar(200),in tm1 varchar(200),in duration1 bigint,in noques integer,in marks1 double,in userid1 varchar(200),in branch1 varchar(200),in sem1 integer,in courseId1 integer,in subId1 integer,in colgid varchar(200))
begin
declare mxid integer;
declare subnm varchar(200);
declare courseName1 varchar(200);
set mxid=(select ifnull(max(examId),1000) from exams);
set mxid=mxid+1;
set subnm=(select subName from subjects where subId=subId1);
set courseName1=(select courseName from courses where courseId=courseId1);
insert into exams values(mxid,title1,dt1,tm1,duration1,noques,marks1,'pending',userid1,branch1,sem1,courseName1,subnm,subId1,colgid);  
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertExamQuestions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertExamQuestions`(in examId1 integer,in quesid1 integer,in userid1 varchar(200))
begin
declare mxid integer;
declare quesType1 varchar(200);
declare ques1 varchar(9000);
declare marks1 double;
if (select not exists(select * from examQuestions where examId=examId1 and quesId=quesid1))=1 then
	set mxid=(select ifnull(max(exQuesId),1000) from examQuestions);
	set mxid=mxid+1;
	set ques1=(select ques from quesbank where quesId=quesid1);
	set quesType1=(select quesType from quesbank where quesId=quesid1);
	set marks1=(select marks from quesbank where quesId=quesid1);
	insert into examQuestions values(mxid,examId1,quesid1,ques1,marks1,quesType1,userid1);  
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLoginLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLoginLog`(in userid1 varchar(200),in utype1 varchar(200),in loginTime1 varchar(200), in loginDt1 varchar(200))
begin
declare mxid integer;
set mxid=(select ifnull(max(id),1000) from loggedInUsers);
set mxid=mxid+1;
insert into loggedInUsers values(mxid,userid1,utype1,loginDt1,loginTime1,'active'); 
update loggedInUsers set sts='loggedOut' where userid=userid1 and id<>mxid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertModelAns` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertModelAns`(in quesId1 integer,in userid1 varchar(200),in dt1 varchar(200),in ans1 longblob,in anstyp1 varchar(200))
begin
declare mxid integer;  
set mxid=(select ifnull(max(modelAnsId),1000) from modelans);
set mxid=mxid+1;
insert into modelans values(mxid,ans1,quesId1,dt1,userid1,anstyp1);  
select mxid as ansid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertQuesBank` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertQuesBank`(in subId1 integer,in unitId1 integer,in marks1 float,in userid1 varchar(200),in ques1 longblob,in questyp varchar(200)
,in ans varchar(200),in option11 varchar(900),in option22 varchar(900),in option33 varchar(900),in option44 varchar(900),in collegeid1 varchar(200))
begin
declare mxid integer;  
declare cnt integer;
set mxid=(select ifnull(max(quesId),1000) from quesbank);
set mxid=mxid+1;
set cnt=(select count(*) from quesbank where subId=subId1 and unitId=unitId1 and ques=ques1);
if cnt=0 then 
insert into quesbank values(mxid,ques1,unitId1,subId1,marks1,questyp,userid1,ans,option11,option22,option33,option44,collegeid1);  
end if;
select mxid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSubjectAllocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSubjectAllocation`(in subId1 integer,in userid varchar(200),in dt1 varchar(200),in courseId1 integer,in semester1 integer,in branch1 varchar(200))
begin
declare mxid integer;
declare cnt integer;
declare subNm varchar(200);
set subNm=(select subName from subjects where subId=subId1);
set mxid=(select ifnull(max(allocationId),1000) from suballocation);
set mxid=mxid+1;
set cnt=(select count(*) from suballocation where subId=subId1);
if cnt>0 then
	update suballocation set staffUserid=userid, dt=dt1 where subId=subId1;
else 
	insert into suballocation values(mxid,subId1,subNm,userid,dt1,branch1,courseId1,semester1);  
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSubjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSubjects`(in subName1 varchar(200),in branch1 varchar(200),in sem integer,in courseid1 integer)
begin
declare mxid integer;
declare courseNm varchar(200);
set courseNm=(select courseName from courses where courseId=courseid1);
set mxid=(select ifnull(max(subId),1000) from subjects);
set mxid=mxid+1;
insert into subjects values(mxid,subName1,sem,branch1,courseNm);  

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertUnits` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUnits`(in subId1 integer,in userid1 varchar(200),in unitName1 varchar(200))
begin
declare mxid integer;
declare subNm varchar(200);
declare cnt integer;
set subNm=(select subName from subjects where subId=subId1);
set mxid=(select ifnull(max(unitId),1000) from units);
set mxid=mxid+1;
set cnt=(select count(*) from units where subId=subId1 and unitName=unitName1);
if cnt=0 then 
	insert into units values(mxid,unitName1,subId1,subNm,userid1);  
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateLoginSts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLoginSts`(in userid1 varchar(200))
begin
 update loggedInUsers set sts='loggedOut' where userid=userid1 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `getresult`
--

/*!50001 DROP VIEW IF EXISTS `getresult`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getresult` AS select `s`.`usernm` AS `usernm`,`a`.`examId` AS `examId`,`a`.`userid` AS `userid`,`a`.`totalMarks` AS `totalMarks`,`a`.`studMarks` AS `studMarks`,`a`.`percent` AS `percent` from (`studentpersonal` `s` join `gettotalmarks` `a` on((`s`.`userid` = `a`.`userid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gettotalmarks`
--

/*!50001 DROP VIEW IF EXISTS `gettotalmarks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gettotalmarks` AS select `result`.`examId` AS `examId`,`result`.`userid` AS `userid`,sum(`result`.`qmarks`) AS `totalMarks`,sum(`result`.`marks`) AS `studMarks`,((sum(`result`.`marks`) * 100) / sum(`result`.`qmarks`)) AS `percent` from `result` group by `result`.`examId`,`result`.`userid` */;
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

-- Dump completed on 2022-04-30 19:00:38
