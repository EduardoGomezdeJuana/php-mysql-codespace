-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: publicaciones
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE publicaciones;
--
-- Table structure for table `clasicos`
--

DROP TABLE IF EXISTS `clasicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clasicos` (
  `autor` varchar(128) DEFAULT NULL,
  `titulo` varchar(128) NOT NULL,
  `tipo` varchar(16) NOT NULL,
  `licencias` tinyint(4) NOT NULL,
  `fecha` char(4) DEFAULT NULL,
  `isbn` char(13) NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `autor` (`autor`(20)),
  KEY `titulo` (`titulo`(20)),
  KEY `tipo` (`tipo`(6))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasicos`
--

LOCK TABLES `clasicos` WRITE;
/*!40000 ALTER TABLE `clasicos` DISABLE KEYS */;
INSERT INTO `clasicos` VALUES ('Benito Perez Galdos','Fortunata y Jacinta','Novela',1,'1887','9780099533474'),('Camilo Jose Cela','La colmena','Novela',2,'1951','9780517123201'),('Lope de Vega','Fuente Ovejuna','Teatro',1,'1618','9780582506206'),('Miguel de Cervantes','Don Quijote de la Mancha','Aventuras',2,'1605','9781598184891');
/*!40000 ALTER TABLE `clasicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `dni` varchar(10) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  KEY `isbn` (`isbn`),
  KEY `dni` (`dni`),
  KEY `dni_2` (`dni`),
  KEY `isbn_2` (`isbn`),
  CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `subscriptores` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`isbn`) REFERENCES `clasicos` (`isbn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES ('111111Y','9781598184891'),('111111Y','9780582506206'),('111111Y','9780517123201'),('222222X','9780582506206'),('222222X','9780517123201'),('222222X','9780099533474'),('333333M','9780582506206');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptores`
--

DROP TABLE IF EXISTS `subscriptores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptores` (
  `nombre` varchar(128) NOT NULL,
  `ciudad` varchar(128) DEFAULT NULL,
  `dni` varchar(16) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `nombre` (`nombre`(20)),
  KEY `ciudad` (`ciudad`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptores`
--

LOCK TABLES `subscriptores` WRITE;
/*!40000 ALTER TABLE `subscriptores` DISABLE KEYS */;
INSERT INTO `subscriptores` VALUES ('Alberto Lopez','Madrid','111111Y'),('Felipe Reyes','Fuenlabrada','222222X'),('Angel Gonzalez','Aravaca','333333M');
/*!40000 ALTER TABLE `subscriptores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-19  9:34:27
