-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: database_kopi
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
  `isdelete` int NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Biji Kopi',0,'2020-06-24 15:08:24','2020-06-24 15:08:24'),(2,'Mesin Kopi',0,'2020-06-24 15:08:24','2020-06-24 15:08:24'),(3,'Merchandise',0,'2020-06-24 15:08:24','2020-06-24 15:08:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Heritage Tumblr','/product/PROD1593351259891.jpg',6,3,60000,'The Popular Heritage Tumbler.  The Coffee Bean &Tea leaf collectible with is commerative design.  For hot and cold beverages.  Stainless Stell.',0,'2020-06-25 14:11:50','2020-06-25 14:11:50'),(2,'Swig Vacuum Bottle','/product/PROD1593351496238.png',5,3,50000,'Say hello to your new sleek, modern water bottle. This durable stainless steel bottle keeps drinks cold for up to 16 hours and keeps drinks hot up to 8 hours.',0,'2020-06-28 20:29:42','2020-06-28 20:29:42'),(3,'Central Perk Dark Roast Coffee','/product/PROD1593351809561.jpg',3,1,67000,'It\'s Here!  The Coffee Bean & Tea Leaf has partnered with Warner Bros. to bring you the popular Central Perk coffee from the hit TV show Friends. Every kcup has a rich aroma with a cocoa flavor and a semi-sweet finish.',0,'2020-06-28 20:43:29','2020-06-28 20:43:29'),(4,'Kenya AA Coffee','/product/PROD1593351858594.jpg',11,1,120000,'Kenya has become the giant of African coffee production, ever since coffee made its way over the mountains from Ethiopia. Kenya AA is the largest bean grown in Kenya, and brews up a complex, fruity, light, and very bright cup. This is an exquisite coffee with an assertive, lively personality. Trust us, in coffee that’s a good thing.',0,'2020-06-28 20:44:18','2020-06-28 20:44:18'),(5,'Mexico Organic Coffee (2lb) - Ground','/product/PROD1593352409291.jpg',2,1,140000,'The beans for our Mexico Organic coffee come from a single estate located on the western slopes of the Sierra Madre range near Puerta Vallarta, Mexico. The area\'s 4,000-foot elevation and red clay-based soil make for near-ideal growing conditions. The Arabica burbon variety grown on the estate produces a delicate, yet refined flavor. The fully washed, fermented, and sundried beans are carefully processed with the latest ecological and processing technology available prior to export. Certified Organic by OCIA and USDA, we\'re proud to share our Mexico Organic coffee with you',0,'2020-06-28 20:50:33','2020-06-28 20:50:33'),(6,'CBTL Single Serve','/product/PROD1593352377392.jpg',2,2,1200000,'Your Coffee Bean & Tea Leaf favorites are a single button press away with this compact, easy-to-use beverage system. Our brewer is the simple, mess-free way to enjoy our handcrafted taste and quality of your Coffee Bean & Tea Leaf favorites at home. Innovative one-touch technology delivers perfection in every cup using the most advanced Italian brewer technologies perfected by the world-renowned Caffitaly system.\n\n\nEach capsule contains Coffee Bean & Tea Leaf hand-selected premium coffee or hand-plucked whole leaf teas. To lock in these delicate aroma and flavor characteristics, every serving freshness-sealed and features an internal two-filter system to ensure evenly balanced extraction.',0,'2020-06-28 20:52:57','2020-06-28 20:52:57'),(7,'Electric One-Touch Milk Frother','/product/PROD1593352503237.jpg',3,2,1000000,'The dual-function milk frother produces just the right amount of heated milk and froth, or simply heated milk to re-create your favorite specialty beverages – including latte, cappuccino, mocha and macchiato – like those enjoyed at The Coffee Bean & Tea Leaf stores.\n\nPERFECT MILK FROTH: Whisks milk into thick hot or cold foam with consistently small froth bubbles perfect your coffee or milk drink; also ideal for simply heating up milk without burning it\nSIMPLE ONE-BUTTON CONTROL: Simply press the On/Off button for heated frothing or heating and hold for cold frothing\nSILENT & CONVENIENT OPERATION: Uses magnetic stirring technology to operate silently without vibrations; no dangerous steam or annoying battery replacement issues common with other milk frothers\nSAFE & EASY TO CLEAN: The inside of the jug is made of food-grade stainless steel and ILAG non-stick coating, ensuring high build quality; the easily removable parts make cleaning a breeze;',0,'2020-06-28 20:55:03','2020-06-28 20:55:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiondetails`
--

LOCK TABLES `transactiondetails` WRITE;
/*!40000 ALTER TABLE `transactiondetails` DISABLE KEYS */;
INSERT INTO `transactiondetails` VALUES (1,1,1,1,0,'2020-06-26 16:11:21','2020-06-26 16:11:21'),(2,2,1,2,0,'2020-06-28 21:55:47','2020-06-28 21:55:47');
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
  `metode` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `isdelete` int NOT NULL DEFAULT '0',
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,17,'credit card','oncart',0,'2020-06-26 16:11:21','2020-06-26 16:11:21'),(2,18,'credit card','oncart',0,'2020-06-28 21:55:47','2020-06-28 21:55:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'dobleh','dobleh@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-16 16:08:44','2020-06-16 16:08:44','2020-06-16 16:08:45'),(2,'gagu','gagu@gmail.com','38c33bd9b86f545d36e07661ac3db4a3df5e8b6378b905cfd05d72772a345bda',2,0,0,'2020-06-16 16:09:29','2020-06-16 16:09:29','2020-06-16 16:09:29'),(3,'asep','asep@gmail.com','d0b8f0f0e8ea797825f12673d2ad7209a1f1181728f9f73942ca2ec2f7b6917f',2,0,0,'2020-06-16 16:16:46','2020-06-16 16:16:46','2020-06-16 16:16:47'),(4,'sakura','sakura@gmail.com','c557ffcfe8cadf151f367ed70da7d9f94eb9a5c8d6a8d76ffd8dd73764d3576b',2,0,0,'2020-06-16 16:25:07','2020-06-16 16:25:07','2020-06-16 16:25:07'),(5,'fauzi','fauuzi3@gmail.com','81b41d736c6451e55dde2ffdc7341193e02297c28aa0ecfec47d4bdb6843aa05',2,0,0,'2020-06-17 14:10:13','2020-06-17 14:10:13','2020-06-17 14:10:14'),(6,'udin','aldoretardo03@gmail.com','5db5f4d090f9defeadbae2c4bbe20569f88208d2040f1f8d39b674342029e22c',2,0,0,'2020-06-17 14:20:42','2020-06-17 14:20:42','2020-06-17 14:20:42'),(7,'harun','harun.khairy@gmail.com','48026bd903eeccdc5951010af5a65b585bc849131799681e7d7745b7fbb04ede',2,0,0,'2020-06-17 14:23:00','2020-06-17 14:23:00','2020-06-17 14:23:01'),(12,'uji','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-20 22:32:25','2020-06-20 22:32:25','2020-06-20 22:32:26'),(13,'gon','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-20 22:52:58','2020-06-20 22:52:58','2020-06-20 22:52:59'),(14,'gonaw','fauuzi3@gmail.com','38c33bd9b86f545d36e07661ac3db4a3df5e8b6378b905cfd05d72772a345bda',2,0,0,'2020-06-20 22:53:56','2020-06-20 22:53:56','2020-06-20 22:53:57'),(15,'kilua','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,0,'2020-06-22 13:36:17','2020-06-22 13:36:17','2020-06-22 13:36:18'),(16,'bombom','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',2,0,1,'2020-06-22 14:00:04','2020-06-22 14:00:04','2020-06-22 14:00:05'),(17,'bimbim','fauuzi3@gmail.com','cb8ff548fb0076a5222acf430ac31250d0e46b519669eb0dcbef25a11ef53d5c',1,0,1,'2020-06-22 14:48:20','2020-06-22 14:48:20','2020-06-22 14:48:21'),(18,'Kuda','tobingtubbies@gmail.com','18de894dfabb2a0843579aa1e1e53613245a6c7e084053e902bca123a9ac5f82',1,0,1,'2020-06-28 08:37:26','2020-06-28 08:37:26','2020-06-28 08:37:26'),(19,'bisa','tobingtubbies@gmail.com','18de894dfabb2a0843579aa1e1e53613245a6c7e084053e902bca123a9ac5f82',1,0,1,'2020-06-28 11:30:29','2020-06-28 11:30:29','2020-06-28 11:30:29');
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

-- Dump completed on 2020-06-29 10:45:17
