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
  `CNPJClientes` varchar(14) DEFAULT NULL,
  `NomeClientes` varchar(80) DEFAULT NULL,
  `CEPClientes` varchar(8) DEFAULT NULL,
  `RuaClientes` varchar(100) DEFAULT NULL,
  `BairroClientes` varchar(50) DEFAULT NULL,
  `CidadeClientes` varchar(50) DEFAULT NULL,
  `UFClientes` varchar(2) DEFAULT NULL,
  `LongitudeClientes` decimal(17,7) DEFAULT NULL,
  `LatitudeClientes` decimal(17,7) DEFAULT NULL,
  `CodIBGEClientes` varchar(10) DEFAULT NULL,
  `NomeFantasiaClientes` varchar(100) DEFAULT NULL,
  `SitCadastralClientes` varchar(30) DEFAULT NULL,
  `NumeroRuaClientes` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodigoClientes`),
  KEY `INDEX_NOME` (`NomeClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'19131243000197','OPEN KNOWLEDGE BRASIL','89010025','Rua Doutor Luiz de Freitas Melro','Centro','Blumenau','SC',-49.0629788,-26.9244749,'421870705','REDE PELO CONHECIMENTO LIVRE','Ativa',999),(2,'19131243000197','APEN KNOWLEDGE BRASIL','89010025','Rua Doutor Luiz de Freitas Melro','Centro','Blumenau','SC',-49.0629788,-26.9244749,'421870705','AEDE PELO CONHECIMENTO LIVRE','Ativa',10);
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

-- Dump completed on 2025-02-21 16:24:15
