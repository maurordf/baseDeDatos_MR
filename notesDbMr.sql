-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: notas_db
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sol'),(2,'Mercurio'),(3,'Venus'),(4,'Tierra'),(5,'Marte'),(6,'Jupiter'),(7,'Saturno'),(8,'Urano'),(9,'Neptuno'),(10,'Pluton');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `createDate` date NOT NULL,
  `modifDate` date NOT NULL,
  `description` text NOT NULL,
  `deleteNote` tinyint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notas_FK` (`user_id`),
  CONSTRAINT `notas_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'QUEJA','2021-12-01','2021-12-02','lila es un fastidio, siempre quiere que trabajemos.',1,1),(2,'SUGERENCIA','2021-12-10','2021-12-11','muerde mi brillante trasero metalico',1,1),(3,'QUEJA','2021-12-10','2021-12-12','toma mi dinero!!!',1,3),(4,'MEJORA','2020-11-20','2020-11-24','eh creado el oloroscopio',0,6),(5,'SUGERENCIA','2020-11-20','2020-11-23','que, nunca vieron la salchica de un genio?',1,9),(6,'MEJORA','2016-09-15','2016-09-17','comence mi propia empresa con jeugos de azar y mujersuelas',1,1),(7,'QUEJA','2017-09-11','2017-09-17','zoidberg es un sucio animal de mar',1,7),(8,'QUEJA','2020-11-03','2017-09-19','amy es una pesada, quiere que la relacion se ponga seria',1,3),(9,'MEJORA','2020-11-05','2020-12-09','les presento a kubert mi sucesor',0,6),(10,'SUGERENCIA','2020-11-04','2017-09-21','te vas a comer esa basura?',1,5);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_categories`
--

DROP TABLE IF EXISTS `notes_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `note_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_categories_FK` (`category_id`),
  KEY `notes_categories_FK_1` (`note_id`),
  CONSTRAINT `notes_categories_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `notes_categories_FK_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_categories`
--

LOCK TABLES `notes_categories` WRITE;
/*!40000 ALTER TABLE `notes_categories` DISABLE KEYS */;
INSERT INTO `notes_categories` VALUES (1,2,1),(2,9,7),(3,3,2),(4,4,3),(5,5,4),(6,6,4),(7,7,5),(8,8,10),(9,9,9),(10,2,10);
/*!40000 ALTER TABLE `notes_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'bender','bender@planetexpress.com'),(2,'lila','lila@planetexpress.com'),(3,'fry','fry@planetexpress.com'),(4,'amy','amy@planetexpress.com'),(5,'zoidberg','zoidberg@planetexpress.com'),(6,'hubert','hubert@planetexpress.com'),(7,'hermes','hermes@planetexpress.com'),(8,'nibbler','nibbler@planetexpress.com'),(9,'kubert','kubert@planetexpress.com'),(10,'scruffy','scruffy@planetexpress.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'notas_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-03 21:30:59
