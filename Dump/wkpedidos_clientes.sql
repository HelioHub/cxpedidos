-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: wkpedidos
-- ------------------------------------------------------
-- Server version	5.7.44-log

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CodigoClientes` int(11) NOT NULL AUTO_INCREMENT,
  `NomeClientes` varchar(80) DEFAULT NULL,
  `CidadeClientes` varchar(50) DEFAULT NULL,
  `UFClientes` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CodigoClientes`),
  KEY `INDEX_NOME` (`NomeClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Helio Marques','Fortaleza','CE'),(2,'Paulo Souza','Fortaleza','CE'),(3,'Maria Joana','São Paulo','SP'),(4,'Pedro Davi','Paraná','PR'),(5,'Jose João','Minas Gerais','MG'),(6,'Davi Montes','Florianópolis','SC'),(7,'Andressa','Florianópolis','SC'),(8,'Felipe Paulo','Florianópolis','SC'),(9,'Ana','Florianópolis','SC'),(10,'Carlos','São Paulo','SP'),(11,'Artur','São Paulo','SP'),(12,'Pedro Paulo','São Paulo','SP'),(13,'Ana Maria','São Paulo','SP'),(14,'Henrique','São Paulo','SP'),(15,'Bastos','Fortaleza','CE'),(16,'Vagner','Fortaleza','CE'),(17,'Carlos Felipe','Fortaleza','CE'),(18,'Ana Bela','Fortaleza','CE'),(19,'Girleide','Paraná','PR'),(20,'Marques','Paraná','PR');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-06  8:03:56
