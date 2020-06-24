-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommta
-- ------------------------------------------------------
-- Server version	8.0.20

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
  `isdelete` int NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `roles` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiondetails`
--

DROP TABLE IF EXISTS `transactiondetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiondetails` (
  `id` int NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
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
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dobleh','dobleh@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-16 16:08:44','2020-06-16 16:08:44','2020-06-16 16:08:45'),(2,'gagu','gagu@gmail.com','38c33bd9b86f545d36e07661ac3db4a3df5e8b6378b905cfd05d72772a345bda',2,0,0,'2020-06-16 16:09:29','2020-06-16 16:09:29','2020-06-16 16:09:29'),(3,'asep','asep@gmail.com','d0b8f0f0e8ea797825f12673d2ad7209a1f1181728f9f73942ca2ec2f7b6917f',2,0,0,'2020-06-16 16:16:46','2020-06-16 16:16:46','2020-06-16 16:16:47'),(4,'sakura','sakura@gmail.com','c557ffcfe8cadf151f367ed70da7d9f94eb9a5c8d6a8d76ffd8dd73764d3576b',2,0,0,'2020-06-16 16:25:07','2020-06-16 16:25:07','2020-06-16 16:25:07'),(5,'fauzi','fauuzi3@gmail.com','81b41d736c6451e55dde2ffdc7341193e02297c28aa0ecfec47d4bdb6843aa05',2,0,0,'2020-06-17 14:10:13','2020-06-17 14:10:13','2020-06-17 14:10:14'),(6,'udin','aldoretardo03@gmail.com','5db5f4d090f9defeadbae2c4bbe20569f88208d2040f1f8d39b674342029e22c',2,0,0,'2020-06-17 14:20:42','2020-06-17 14:20:42','2020-06-17 14:20:42'),(7,'harun','harun.khairy@gmail.com','48026bd903eeccdc5951010af5a65b585bc849131799681e7d7745b7fbb04ede',2,0,0,'2020-06-17 14:23:00','2020-06-17 14:23:00','2020-06-17 14:23:01'),(12,'uji','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-20 22:32:25','2020-06-20 22:32:25','2020-06-20 22:32:26'),(13,'gon','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-20 22:52:58','2020-06-20 22:52:58','2020-06-20 22:52:59'),(14,'gonaw','fauuzi3@gmail.com','38c33bd9b86f545d36e07661ac3db4a3df5e8b6378b905cfd05d72772a345bda',2,0,0,'2020-06-20 22:53:56','2020-06-20 22:53:56','2020-06-20 22:53:57'),(15,'kilua','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-22 13:36:17','2020-06-22 13:36:17','2020-06-22 13:36:18'),(16,'bombom','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,1,'2020-06-22 14:00:04','2020-06-22 14:00:04','2020-06-22 14:00:05'),(17,'bimbim','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',1,0,1,'2020-06-22 14:48:20','2020-06-22 14:48:20','2020-06-22 14:48:21');
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

-- Dump completed on 2020-06-24 14:06:03
