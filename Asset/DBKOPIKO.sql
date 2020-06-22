-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommta
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `isdelete` varchar(45) NOT NULL DEFAULT '0',
  `createat` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `updateat` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `image` varchar(450) DEFAULT NULL,
  `stock` int NOT NULL,
  `categoryid` int NOT NULL,
  `price` int NOT NULL,
  `description` mediumtext NOT NULL,
  `isdeleted` int NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `metode` int DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `isdelete` int NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiondetails`
--

DROP TABLE IF EXISTS `transactiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiondetails` (
  `id` int NOT NULL,
  `transactionid` int NOT NULL,
  `productid` int NOT NULL,
  `qty` int NOT NULL,
  `isdelete` int NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiondetails`
--

LOCK TABLES `transactiondetails` WRITE;
/*!40000 ALTER TABLE `transactiondetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactiondetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` int NOT NULL DEFAULT '1',
  `isdeleted` int NOT NULL DEFAULT '0',
  `isverified` int NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'naruto','akubodoh@gmail.com','1970640134ca94edc36e7829b9c681e9598d8f026354abc1ece7f691f786d869',2,0,0,'2020-06-16 14:46:13','2020-06-16 14:46:13','2020-06-16 14:46:13'),(2,'fauzi Bowo','akubodoh@gmail.com','1970640134ca94edc36e7829b9c681e9598d8f026354abc1ece7f691f786d869',2,0,0,'2020-06-16 14:48:05','2020-06-16 14:48:05','2020-06-16 14:48:06'),(3,'asep','akubodoh@gmail.com','c899a6c6fa4421d8060f26f5d2e4845ba7c35cfae29c31a5fff9c93e027001da',2,0,0,'2020-06-16 16:15:15','2020-06-16 16:15:15','2020-06-16 16:15:15'),(4,'asepti','pencintahewanyangbukantumbuhan@gmail.com','0d5c42f85b55f9562ad7feceeb6a7ce3bf2c7bae752ac3aa33133331c2d699ec',2,0,0,'2020-06-16 16:22:09','2020-06-16 16:22:09','2020-06-16 16:22:10'),(5,'aaa','asd@asd.com','b7c71c628b4c3e904c043eb9d260d887f209ba865ab890496a17d66641d3f27b',2,0,0,'2020-06-17 13:20:03','2020-06-17 13:20:03','2020-06-17 13:20:04'),(6,'aaad','asd@asd.com','b7c71c628b4c3e904c043eb9d260d887f209ba865ab890496a17d66641d3f27b',2,0,0,'2020-06-17 13:24:30','2020-06-17 13:24:30','2020-06-17 13:24:30'),(7,'aaade','asd@asd.com','b7c71c628b4c3e904c043eb9d260d887f209ba865ab890496a17d66641d3f27b',2,0,0,'2020-06-17 13:43:19','2020-06-17 13:43:19','2020-06-17 13:43:19'),(8,'aaadef','asd@asd.com','b7c71c628b4c3e904c043eb9d260d887f209ba865ab890496a17d66641d3f27b',2,0,0,'2020-06-17 13:43:35','2020-06-17 13:43:35','2020-06-17 13:43:35'),(9,'aseptiblack','asd@asd.com','e1bcf5fa3615c32b0eb961f4daa964b377a8fe6904b7ad3485bafa615804e9d3',2,0,0,'2020-06-17 13:43:55','2020-06-17 13:43:55','2020-06-17 13:43:55'),(10,'aseptiblack2','asd@asd.com','e1bcf5fa3615c32b0eb961f4daa964b377a8fe6904b7ad3485bafa615804e9d3',2,0,0,'2020-06-17 13:44:43','2020-06-17 13:44:43','2020-06-17 13:44:44'),(13,'dobleh','aldoretardo03@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-22 13:58:56','2020-06-22 13:58:56','2020-06-22 13:58:56'),(14,'asdasd','aldoretardo03@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-22 14:09:13','2020-06-22 14:09:13','2020-06-22 14:09:13'),(15,'budi','aldoretardo03@gmail.com','2fb98ae2cf7d42c26ff1b3c24a80140e7d1ce05932454d3302216e8f7008f016',2,0,1,'2020-06-22 14:11:50','2020-06-22 14:11:50','2020-06-22 14:11:50');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22 15:00:53
