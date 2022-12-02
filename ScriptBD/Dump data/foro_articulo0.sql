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
  `titulo` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `contenido` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fecha_articulo` date NOT NULL,
  `usuario_idUsuario` int unsigned NOT NULL,
  PRIMARY KEY (`idArticulo`),
  UNIQUE KEY `idArticulo_UNIQUE` (`idArticulo`),
  KEY `fk_articulo_usuario_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_articulo_usuario` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'Primer articulo','“La mente es como un paracaídas, únicamente sirve si lo tenemos abierto”. Físico alemán es considerado el científico más importante y popular del siglo XX. En 1905, siendo todavía un joven investigador desconocido, publicó su teoría de la relatividad espacial. Diez años más tarde, presentaría la teoría de la relatividad general, lo que reformuló por completo el concepto de gravedad.','2022-11-18',6),(2,'Primera frase','Si no lo puedes explicarlo de forma sencilla, es que no lo has entendido bien','2022-11-18',6),(3,'Primera frase','Siempre recordarás este día como el día en el que casi capturas a Jack Sparrow','2022-11-18',7),(4,'Segunda frase','Soy deshonesto, y siempre puedes confiar en que la persona deshonesta será deshonesta. Honestamente. Es a los honestos a los que tienes que vigilar de cerca, porque nunca puedes predecir cuando harán algo... absurdo','2022-11-18',7),(5,'Tercera frase','¿Una boda? ¡Me encantan las bodas! ¡Que corra el ron!','2022-11-18',7),(6,'4 frase','La locura y la genialidad son dos características que coinciden a menudo','2022-11-18',7),(7,'5 frase','Esto no puede ser un sueño, porque si lo fuera, habría ron','2022-11-18',7),(8,'6 frase','Debemos abrazar la más noble de las tradiciones piratas. Debemos luchar... y luego salir huyendo','2022-11-18',7),(9,'7 frase','No todos los tesoros son plata y oro, amigo','2022-11-18',7),(10,'8 frase','El problema no es el problema. El problema es tu actitud con el problema, entiendes?','2022-11-18',7),(11,'9 frase','Cierra los ojos e imagina que todo es una pesadilla. Así es como voy tirando','2022-11-18',7),(12,'10 frase','Mucho mejor no saber qué momento será el último. Cada partícula de tu ser queda expuesta al misterio infinito de la existencia','2022-11-18',7),(13,'11 frase','¿Habéis visto todos eso? Porque no voy a volverlo a hacer','2022-11-18',7),(14,'Segunda frase','El mayor misterio del mundo es que resulta comprensible','2022-11-18',6),(15,'Tercera frase','La imaginación es más importante que el conocimiento','2022-11-18',6),(16,'Cuarta frase','Todo debe simplificarse lo máximo posible, pero no más','2022-11-18',6),(17,'Quinta frase','El secreto de la creatividad es saber cómo esconder tus fuentes','2022-11-18',6),(18,'Sexta frase','Toda la ciencia no es más que un refinamiento del pensamiento cotidiano','2022-11-18',6),(19,'7 frase','La educación es lo que queda una vez que olvidamos todo lo que aprendió en la escuela','2022-11-18',6),(20,'8 frase','Lo importante es no dejar de hacerse preguntas','2022-11-18',6),(21,'Primera frase','Este famoso naturalista inglés fue quien postuló que todas las especies de seres vivos han evolucionado con el tiempo a partir de un antepasado común mediante un proceso denominado “selección natural”. Su teoría de la evolución forma la base de la síntesis evolutiva moderna y constituye una explicación lógica que unifica las observaciones sobre la diversidad de la vida y que es la base de la ciencia de la Biología.','2022-11-18',13),(22,'Primera frase','Se le considera por el mundo académico como el primer científico e investigador de todos los tiempos, cuya influencia ha perdurado durante dos mil años. Fue todo un erudito, un sabio, una eminencia en diferentes ámbitos de las ciencias y humanidades: político, filósofo, lógico y científico en la Antigua Grecia. Se le reconoce como el primer fundador de la lógica y la biología, y sus obras han sido utilizadas como la base del desarrollo científico durante siglos.','2022-11-18',14),(23,'Primera frase','Ambición, voluntad, valentía, inteligencia, soberbia, crueldad, grandeza...son apelativos que podrían describir perfectamente a este personaje de la historia. Menospreciado por unos, engrandecido por otros, enaltecido, vilipendiado, ánimos contradictorios los que se pueden leer y escuchar sobre él. Con su inteligencia militar fue capaz de conquistar Europa Oriental y Occidental llegando hasta el norte de África.','2022-11-18',15),(24,'Primera frase','Líder político y militar del gran Imperio Romano, dando lugar a ser el primer dirigente romano vivo cuyo rostro apareció en una moneda en circulación. A parte de su carrera política y militar, este personaje histórico destacó como orador y escritor sobre temas como la religión republicana romana, astronomía o latín.','2022-11-18',16),(25,'Primera frase','Junto a Sócrates y Aristóteles, es considerado uno de los filosóficos más influyentes en el pensamiento de la Europa moderna. A diferencia de Sócrates, Platón escribió y conservó todas sus obras, introduciendo un nuevo estilo novedoso para la época: el diálogo. La contraposición de distintos puntos de vista y la caracterización psicológica de los interlocutores, supuso una herramienta alternativa a la expresión poética u oracular.','2022-11-18',17),(26,'Primera frase','Poeta, dramaturgo y actor inglés, reconocido como el escritor más importante de la lengua inglesa y uno de los más ilustres autores de la literatura universal. Su reputación no alcanzó el éxito mundial hasta bien entrado el siglo XIX. Ya en el siglo XX, todas sus obras fueron adaptadas en multitud de ocasiones y en todo tipo de escenarios: cine, libros y teatro.','2022-11-18',18),(27,'Primera frase','Su mayor logro y éxito fue el descubrimiento de América por parte de Occidente un 12 de octubre del año 1492, al desembarcar en la Isla Guanahani, actualmente conocido como las Bahamas. Antes de esto, fue un navegante, cartógrafo, almirante, virrey y Gobernador General de las Indias Occidentales al servicio de la Corona de Castilla.','2022-11-18',19),(28,'Primera frase','Matemático, filósofo, alquimista, teólogo y físico inglés. Autor de “los Philosophiae Naturalis Principia Matemática”, más comúnmente conocido como Principia, donde describe la ley de gravitación universal y estableció las bases de la mecánica clásica mediante las leyes que llevan su nombre.','2022-11-18',20),(29,'Prueba','Estoy probando subir articulos','2022-11-18',2),(30,'Prueba','Estoy probando subir articulos','2022-11-18',2),(31,'Prueba','Estoy probando subir articulos','2022-11-18',2),(32,'Prueba','Estoy probando subir articulos','2022-11-18',2),(33,'Prueba','Estoy probando subir articulos','2022-11-18',2),(34,'Prueba','Estoy probando subir articulos','2022-11-18',2),(35,'Prueba','Estoy probando subir articulos','2022-11-18',2),(36,'Prueba','Estoy probando subir articulos','2022-11-18',2),(37,'Prueba desde web','HOla hoaslahaohaoh oalhlash oahalso','2022-11-18',2),(38,'asdf','asdfasdf','2022-11-19',4),(39,'asdf','asdfasdf','2022-11-19',2),(40,'asdf','asdf asdaasassa','2022-11-19',2),(41,'asdf2','asdf asdaasassa','2022-11-19',2),(42,'asdfasdf','asdfadsf','2022-11-19',2),(43,'asdfasdfprueba','asdfadsf','2022-11-19',2),(44,'asdf2','asdf asdaasassa','2022-11-19',2),(45,'asdf2sa','asdf asdaasassa','2022-11-19',2),(46,'asdfPRUEBAFINAL','asdf','2022-11-19',2),(47,'asdfasdfasdf','sadfasdfasdf','2022-11-25',2),(48,'asdf','adfsasdfasfdsadf','2022-11-28',2),(49,'adfasdfasdf','asdfasdfasdf','2022-11-28',2),(50,'asdfasdfd','asdfasdfasdf','2022-11-28',2),(51,'asdfasdfd','asdfasdfasdf','2022-11-28',2),(52,'asdjfasldfj','asdfasdf','2022-11-28',2),(53,'fdsgfsdfgsdfg','sdfgsdfgsdfg','2022-11-28',2),(54,'asdfasld;fjasdlfj;io','asdhfgpoashdpadsgf','2022-11-28',2);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02  1:46:00
