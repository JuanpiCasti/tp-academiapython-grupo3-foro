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
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idComentario` int unsigned NOT NULL AUTO_INCREMENT,
  `contenido_comentario` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha_comentario` date NOT NULL,
  `articulo_idArticulo` int unsigned NOT NULL,
  `id_usuario` int unsigned NOT NULL DEFAULT (1),
  PRIMARY KEY (`idComentario`),
  UNIQUE KEY `idComentario_UNIQUE` (`idComentario`),
  KEY `fk_comentario_articulo1_idx` (`articulo_idArticulo`),
  KEY `comentario_ibfk_1` (`id_usuario`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE,
  CONSTRAINT `fk_comentario_articulo1` FOREIGN KEY (`articulo_idArticulo`) REFERENCES `articulo` (`idArticulo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Hola esto es una prueba','2022-11-23',1,1),(2,'Hola esto es una prueba','2022-11-23',1,1),(3,'Hola esto es una prueba','2022-11-23',1,1),(4,'Hola esto es una prueba','2022-11-23',1,1),(5,'Hola esto es una prueba','2022-11-23',1,1),(6,'al;dksja;sldf\r\n','2022-11-25',1,1),(7,'asdfasdfasdf','2022-11-25',1,1),(8,'prueba comentario','2022-11-28',54,1);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 17:43:03
