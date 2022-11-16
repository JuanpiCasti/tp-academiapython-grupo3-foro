CREATE DATABASE  IF NOT EXISTS `Foro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Foro`;

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `idArticulo` int unsigned NOT NULL AUTO_INCREMENT,
  `contenido` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `usuario_idUsuario` int unsigned NOT NULL,
  PRIMARY KEY (`idArticulo`),
  UNIQUE KEY `idArticulo_UNIQUE` (`idArticulo`),
  KEY `fk_articulo_usuario_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_articulo_usuario` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'“La mente es como un paracaídas, únicamente sirve si lo tenemos abierto”. Físico alemán es considerado el científico más importante y popular del siglo XX. En 1905, siendo todavía un joven investigador desconocido, publicó su teoría de la relatividad espacial. Diez años más tarde, presentaría la teoría de la relatividad general, lo que reformuló por completo el concepto de gravedad.',6),(2,'Si no lo puedes explicarlo de forma sencilla, es que no lo has entendido bien',6),(3,'Siempre recordarás este día como el día en el que casi capturas a Jack Sparrow',7),(4,'Soy deshonesto, y siempre puedes confiar en que la persona deshonesta será deshonesta. Honestamente. Es a los honestos a los que tienes que vigilar de cerca, porque nunca puedes predecir cuando harán algo... absurdo',7),(5,'¿Una boda? ¡Me encantan las bodas! ¡Que corra el ron!',7),(6,'La locura y la genialidad son dos características que coinciden a menudo',7),(7,'Esto no puede ser un sueño, porque si lo fuera, habría ron',7),(8,'Debemos abrazar la más noble de las tradiciones piratas. Debemos luchar... y luego salir huyendo',7),(9,'No todos los tesoros son plata y oro, amigo',7),(10,'El problema no es el problema. El problema es tu actitud con el problema, entiendes?',7),(11,'Cierra los ojos e imagina que todo es una pesadilla. Así es como voy tirando',7),(12,'Mucho mejor no saber qué momento será el último. Cada partícula de tu ser queda expuesta al misterio infinito de la existencia',7),(13,'¿Habéis visto todos eso? Porque no voy a volverlo a hacer',7),(14,'El mayor misterio del mundo es que resulta comprensible',6),(15,'La imaginación es más importante que el conocimiento',6),(16,'Todo debe simplificarse lo máximo posible, pero no más',6),(17,'El secreto de la creatividad es saber cómo esconder tus fuentes',6),(18,'Toda la ciencia no es más que un refinamiento del pensamiento cotidiano',6),(19,'La educación es lo que queda una vez que olvidamos todo lo que aprendió en la escuela',6),(20,'Lo importante es no dejar de hacerse preguntas',6),(21,'Este famoso naturalista inglés fue quien postuló que todas las especies de seres vivos han evolucionado con el tiempo a partir de un antepasado común mediante un proceso denominado “selección natural”. Su teoría de la evolución forma la base de la síntesis evolutiva moderna y constituye una explicación lógica que unifica las observaciones sobre la diversidad de la vida y que es la base de la ciencia de la Biología.',13),(22,'Se le considera por el mundo académico como el primer científico e investigador de todos los tiempos, cuya influencia ha perdurado durante dos mil años. Fue todo un erudito, un sabio, una eminencia en diferentes ámbitos de las ciencias y humanidades: político, filósofo, lógico y científico en la Antigua Grecia. Se le reconoce como el primer fundador de la lógica y la biología, y sus obras han sido utilizadas como la base del desarrollo científico durante siglos.',14),(23,'Ambición, voluntad, valentía, inteligencia, soberbia, crueldad, grandeza...son apelativos que podrían describir perfectamente a este personaje de la historia. Menospreciado por unos, engrandecido por otros, enaltecido, vilipendiado, ánimos contradictorios los que se pueden leer y escuchar sobre él. Con su inteligencia militar fue capaz de conquistar Europa Oriental y Occidental llegando hasta el norte de África.',15),(24,'Líder político y militar del gran Imperio Romano, dando lugar a ser el primer dirigente romano vivo cuyo rostro apareció en una moneda en circulación. A parte de su carrera política y militar, este personaje histórico destacó como orador y escritor sobre temas como la religión republicana romana, astronomía o latín.',16),(25,'Junto a Sócrates y Aristóteles, es considerado uno de los filosóficos más influyentes en el pensamiento de la Europa moderna. A diferencia de Sócrates, Platón escribió y conservó todas sus obras, introduciendo un nuevo estilo novedoso para la época: el diálogo. La contraposición de distintos puntos de vista y la caracterización psicológica de los interlocutores, supuso una herramienta alternativa a la expresión poética u oracular.',17),(26,'Poeta, dramaturgo y actor inglés, reconocido como el escritor más importante de la lengua inglesa y uno de los más ilustres autores de la literatura universal. Su reputación no alcanzó el éxito mundial hasta bien entrado el siglo XIX. Ya en el siglo XX, todas sus obras fueron adaptadas en multitud de ocasiones y en todo tipo de escenarios: cine, libros y teatro.',18),(27,'Su mayor logro y éxito fue el descubrimiento de América por parte de Occidente un 12 de octubre del año 1492, al desembarcar en la Isla Guanahani, actualmente conocido como las Bahamas. Antes de esto, fue un navegante, cartógrafo, almirante, virrey y Gobernador General de las Indias Occidentales al servicio de la Corona de Castilla.',19),(28,'Matemático, filósofo, alquimista, teólogo y físico inglés. Autor de “los Philosophiae Naturalis Principia Matemática”, más comúnmente conocido como Principia, donde describe la ley de gravitación universal y estableció las bases de la mecánica clásica mediante las leyes que llevan su nombre.',20);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `nombre_categoria_UNIQUE` (`nombre_categoria`),
  UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Entretenimiento'),(2,'Filosofia'),(3,'Historia');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idComentario` int unsigned NOT NULL AUTO_INCREMENT,
  `contenido_comentario` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `articulo_idArticulo` int unsigned NOT NULL,
  PRIMARY KEY (`idComentario`),
  UNIQUE KEY `idComentario_UNIQUE` (`idComentario`),
  KEY `fk_comentario_articulo1_idx` (`articulo_idArticulo`),
  CONSTRAINT `fk_comentario_articulo1` FOREIGN KEY (`articulo_idArticulo`) REFERENCES `articulo` (`idArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `contrasenia` varchar(16) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Colo281101','1234'),(2,'JuanpiCasti','5678'),(3,'JuanCruzReyAlvarez','1739'),(4,'Rodri','Rodri1234'),(5,'Gustavo','Bruce564'),(6,'Albert Einstein','e=mc2'),(7,'Jack Sparrow','Black_Pearl'),(8,'Anakin','Dark_Side'),(9,'Palpatine','Dark_Master'),(10,'Count Dooku','Lord_sith'),(11,'Will Turner','Elizabeth'),(12,'Aquiles','Greek_man'),(13,'Darwin','Ev0luti0n'),(14,'Aristoteles','Ancient_greek'),(15,'Napoleon','bajoFrances'),(16,'Julio Cesar','Divide_Conquer'),(17,'Platon','Pheilo'),(18,'Shakespeare','McBeth'),(19,'Colon','America'),(20,'Newton','EF=ma');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-16 17:43:16
