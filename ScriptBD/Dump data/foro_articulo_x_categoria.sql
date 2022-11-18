-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: foro
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `articulo_x_categoria`
--

DROP TABLE IF EXISTS `articulo_x_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo_x_categoria` (
  `idArticulo_x_Categoria` int unsigned NOT NULL AUTO_INCREMENT,
  `articulo_idArticulo` int unsigned NOT NULL,
  `categoria_idCategoria` int unsigned NOT NULL,
  PRIMARY KEY (`idArticulo_x_Categoria`),
  UNIQUE KEY `idArticulo_x_Categoria_UNIQUE` (`idArticulo_x_Categoria`),
  KEY `fk_articulo_x_categoria_articulo1_idx` (`articulo_idArticulo`),
  KEY `fk_articulo_x_categoria_categoria1_idx` (`categoria_idCategoria`),
  CONSTRAINT `fk_articulo_x_categoria_articulo1` FOREIGN KEY (`articulo_idArticulo`) REFERENCES `articulo` (`idArticulo`),
  CONSTRAINT `fk_articulo_x_categoria_categoria1` FOREIGN KEY (`categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo_x_categoria`
--

LOCK TABLES `articulo_x_categoria` WRITE;
/*!40000 ALTER TABLE `articulo_x_categoria` DISABLE KEYS */;
INSERT INTO `articulo_x_categoria` VALUES (1,1,3),(2,2,3),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,3),(15,15,3),(16,16,3),(17,17,3),(18,18,3),(19,19,3),(20,20,3),(21,21,3),(22,22,3),(23,23,3),(24,24,3),(25,25,3),(26,26,3),(27,27,3),(28,28,3);
/*!40000 ALTER TABLE `articulo_x_categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18 15:13:31
