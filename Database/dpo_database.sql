-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: dpo
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `numCharacters` int DEFAULT NULL,
  `numImpostors` int DEFAULT NULL,
  `isFinished` tinyint(1) DEFAULT NULL,
  `pauseTime` int DEFAULT NULL,
  `userColorIndex` int DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`,`user`),
  KEY `user` (`user`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES ('test','hola',10,1,0,48,5,'The Skeld'),('test2','hola',10,2,1,41,2,'The Skeld'),('test3','hola',4,1,1,75,0,'The Skeld'),('test4','hola',4,1,1,21,1,'The Skeld'),('test5','hola',4,1,1,50,0,'The Skeld');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph`
--

DROP TABLE IF EXISTS `graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graph` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userWon` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userName` (`userName`),
  CONSTRAINT `graph_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph`
--

LOCK TABLES `graph` WRITE;
/*!40000 ALTER TABLE `graph` DISABLE KEYS */;
INSERT INTO `graph` VALUES (1,'hola',0),(2,'hola',0),(3,'hola',1),(4,'hola',0);
/*!40000 ALTER TABLE `graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `colorIndex` int NOT NULL,
  `time` int NOT NULL,
  `gameName` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`colorIndex`,`time`,`gameName`,`user`),
  KEY `gameName` (`gameName`),
  KEY `user` (`user`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`gameName`) REFERENCES `game` (`name`),
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (2,56,'test3','hola','Security'),(3,46,'test2','hola','Security'),(5,34,'test2','hola','O2'),(7,33,'test2','hola','O2'),(8,13,'test3','hola','O2'),(10,42,'test2','hola','O2'),(11,7,'test5','hola','O2'),(11,37,'test2','hola','O2');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `colorIndex` int NOT NULL,
  `gameName` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `lastRoom` varchar(255) DEFAULT NULL,
  `currentRoom` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `isAlive` tinyint(1) DEFAULT NULL,
  `isUser` tinyint(1) DEFAULT NULL,
  `isCooldown` tinyint(1) DEFAULT NULL,
  `isImpostor` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`colorIndex`,`gameName`,`user`),
  KEY `gameName` (`gameName`),
  KEY `user` (`user`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`gameName`) REFERENCES `game` (`name`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`user`) REFERENCES `game` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (0,'test2','hola','O2','O2','Unknown',1,0,0,0),(0,'test3','hola','O2','O2','Unknown',1,1,0,0),(0,'test5','hola','O2','O2','Unknown',1,1,0,0),(1,'test2','hola','O2','O2','Unknown',1,0,0,0),(1,'test4','hola','O2','O2','Unknown',1,1,0,0),(2,'test2','hola','O2','O2','Unknown',1,1,0,0),(2,'test3','hola','O2','O2','Unknown',1,0,0,0),(3,'test2','hola','O2','O2','Unknown',1,0,0,0),(3,'test5','hola','O2','O2','Unknown',1,0,0,0),(5,'test2','hola','O2','O2','Unknown',1,0,0,0),(5,'test4','hola','O2','O2','Unknown',1,0,0,0),(6,'test4','hola','O2','O2','Unknown',1,0,0,1),(6,'test5','hola','O2','O2','Unknown',1,0,0,0),(7,'test2','hola','O2','O2','Unknown',1,0,0,1),(7,'test4','hola','O2','O2','Unknown',1,0,0,0),(8,'test2','hola','O2','O2','Unknown',1,0,0,0),(8,'test3','hola','O2','O2','Unknown',1,0,0,1),(9,'test2','hola','O2','O2','Unknown',1,0,0,0),(9,'test3','hola','O2','O2','Unknown',1,0,0,0),(10,'test2','hola','O2','O2','Unknown',1,0,0,1),(11,'test2','hola','O2','O2','Unknown',1,0,0,0),(11,'test5','hola','O2','O2','Unknown',1,0,0,1);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `totalWins` int DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('hola','h.h@gmail.com','HolaHola1',0);
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

-- Dump completed on 2021-05-23 11:55:28
