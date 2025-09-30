-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: prueba3APP
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `criterios`
--

DROP TABLE IF EXISTS `criterios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criterios` (
  `criterio_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `porcentaje` decimal(10,0) NOT NULL,
  `nivel_id` int unsigned NOT NULL,
  PRIMARY KEY (`criterio_id`),
  KEY `criterios_niveles_FK` (`nivel_id`),
  CONSTRAINT `criterios_niveles_FK` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criterios`
--

LOCK TABLES `criterios` WRITE;
/*!40000 ALTER TABLE `criterios` DISABLE KEYS */;
INSERT INTO `criterios` VALUES (1,'La presentación personal (corte de cabello es el adecuado para la ocasión, su vestuario de manera ordenada, limpia y de acuerdo con el proyecto; se dirige de forma adecuada y respetuosa).',10,1),(2,'Defiende su proyecto de forma coherente, creativa e innovadora.',20,1),(3,'El trabajo presentado está de acuerdo con el contenido programático del área de estudio.',30,1),(4,'En la defensa del proyecto presenta seguridad, fluidez y dominio del contenido.',30,1),(5,'La imágen del stand está de acuerdo con el tema desarrollado; su ambietación es agradable haciendo buen uso de los recursos.',10,1),(6,'La presentación personal (corte de cabello, el peinado es adecuado, usa vestuario de manera ordenada, limpia y de acuerdo al proyecto que se está exponiendo; se dirige de forma educada y respetuosa).',10,2),(7,'La exposición y defensa de la idea de negocio se hace de forma coherente, con creatividad, innovador y lo puede defender.',10,2),(8,'Explica de manera clara la descripción del negocio: nombre y ubicación del negocio.',5,2),(9,'Explica el organigrama de integrantes del equipo de manera clara y concisa.',5,2),(10,'Presenta un resúmen del proyecto: a qué se va a dedicar, cúales son sus productos principales, precio y proveedores.',10,2),(11,'Explica la ventana de oportunidad en el mercado (demanda insatisfecha) y socios clave del negocio.',10,2),(12,'Presenta el objetivo, la misión, visión, valores y principios de su idea de negocio.',10,2),(13,'El proyecto presentado, está enfocado de acuerdo al ámbito de desarrollo de las competencias del bachillerato técnico que estudia: Desarrollan ideas de negocioi implementando creatividad, trabajo en equipo y liderazgo.',10,2),(14,'Presenta informe impreso del emprendimiento.',10,2),(15,'Presenta seguridad, fluidez y dominio del proyecto, al explicar cada parte del contenido.',20,2),(16,'La imágen y la ambientación del stand es la apropiada para el proyecto mostrado, haciendo uso correcto de los recursos.',10,2),(17,'La presentación personal (corte de cabello adecuado, el peinado es adecuado, usa vestuario de manera ordenada, limpia y de acuerdo al proyecto que se está exponiendo; se dirige de forma adecuada y respetuosa).',10,3),(18,'La exposición y defensa de la idea de negocio se hace de forma coherente, con creatividad, innovador y puede defenderlo.',10,3),(19,'Explica de manera clara la descripción del negocio: identificación del negocio, resúmen del proyecto, socios, actividades claves, objetivo, misión, visión y valores de la empresariales.',5,3),(20,'Explica el plan de producción: base de proveedores, proceso de compra, proceso de producción, control de calidad.',10,3),(21,'Presenta un resúmen del plan de mercadeo: principales competidores, condiciones del mercado, lista de productos/servicios a ofrecer.',10,3),(22,'Presenta el plan de organización: organización y estructura de la gestión.',5,3),(23,'Presenta el plan financiero de su negocio: estimación de costos, cálculo del precio de venta y punto de equilibrio.',10,3),(24,'El proyecto presentado está enfocado de acuerdo al ámbito de desarrollo de las competencias del bachillerato técnico que estudia: Desarrollan ideas de negocio implementando creatividad, trabajo en equipo y liderazgo.',10,3),(25,'Presenta informe impreso del emprendimiento.',10,3),(26,'Presenta seguridad, fluidez, y dominio del proyecto, al explicar cada parte del contenido.',20,3),(27,'La imágen y la ambientación del stand es la apropiada para el proyecto mostrado, haciendo uso correcto de los recursos.',10,3),(28,'La presentación personal (corte de cabello, el peinado es adecuado, usa vestuario de manera ordenada, limpia y de acuedo al proyecto que se está exponiendo; se dirige de forma adecuada y respetuosa).',10,4),(29,'La exposición y defensa de la idea de negocio se hace de forma coherente, con creatividad, innovador y puede defenderlo.',10,4),(30,'Explica de manera clara la descripción del negocio: identificación del negocio, resúmen del proyecto, socios, actividades claves, objetivo, misión, visión y valores empresariales.',5,4),(31,'Explica el plan de producción: base de proveedores, proceso de compra, proceso de producción, control de calidad, distribución en planta.',10,4),(32,'Presenta un resúmen del plan de mercadeo: principales competidores, condiciones del mercado, lista de productos/servicios a ofrecer, propuesta de valor del producto, variables de mercado y proceso de venta.',10,4),(33,'Presenta plan de organización: cuadro de los integrantes del equipo, organización y estructura de la gestión.',5,4),(34,'Presenta el plan financiero de su negocio: Estimación de costos, cálculo de precio de venta y punto de equilibrio, proyección en ventas y plan de inversión.',10,4),(35,'Presenta modelo CANVAS.',10,4),(36,'El proyecto presentado está enfocado de acuerdo al ámbito de desarrollo de las competencias del bachillerato técnico que estudia: desarrolla ideas de negocio implementando creatividad, trabajo en equipo y liderazgo.',10,4),(37,'Presenta informe impreso del emprendimiento.',10,4),(38,'Presenta seguridad, fluidez y dominio del proyecto al explicar cada parte del contenido.',10,4),(39,'La imágen y la ambientación del stand es la apropiada para el proyecto mostrado, haciendo uso correcto de los recursos.',10,4);
/*!40000 ALTER TABLE `criterios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `estudiante_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(125) NOT NULL,
  `proyecto_id` int unsigned NOT NULL,
  `grado_id` int unsigned NOT NULL,
  `asistencia` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`estudiante_id`),
  KEY `estudiantes_proyectos_FK` (`proyecto_id`),
  KEY `estudiantes_grados_FK` (`grado_id`),
  CONSTRAINT `estudiantes_grados_FK` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`),
  CONSTRAINT `estudiantes_proyectos_FK` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'estudiante 1',1,1,0),(2,'estudiante 2',1,1,0),(3,'estudiante 3',1,1,0),(4,'estudiante 4',1,1,0),(5,'estudiante 5',2,2,0),(6,'estudiante 6',2,2,0),(7,'estudiante 7',2,2,0),(8,'estudiante 8',2,2,0),(9,'estudiante 9',3,3,1),(10,'estudiante 10',3,3,1),(11,'estudiante 11',3,3,1),(12,'estudiante 12',3,3,1),(13,'Estudiante 13',4,1,0),(14,'Estudiante 14',4,1,0),(15,'Estudiante 15',4,1,0),(16,'Estudiante 16',4,1,0),(17,'Estudiante 17',33,6,1),(18,'Estudiante 18',33,6,1),(19,'Estudiante 19',33,6,1),(20,'Estudiante 20',33,6,1),(21,'Estudiante 21',68,1,1),(22,'Estudiante 22',68,1,1),(23,'Estudiante 23',68,1,1),(24,'Estudiante 24',68,1,1),(25,'Estudiante 25',88,25,0),(26,'Estudiante 26',88,25,0),(27,'Estudiante 27',88,25,0),(28,'Estudiante 28',88,25,0),(29,'Estudiante 29',6,2,1),(30,'Estudiante 30',6,2,1),(31,'Estudiante 31',6,2,1),(32,'Estudiante 32',6,2,1),(33,'Estudiante 36',58,16,1),(34,'Estudiante 35',58,16,1),(35,'Estudiante 34',58,16,1),(36,'Estudiante 33',58,16,1);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion_criterios`
--

DROP TABLE IF EXISTS `evaluacion_criterios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion_criterios` (
  `id_evaluacion_criterio` int NOT NULL AUTO_INCREMENT,
  `criterio_id` int unsigned NOT NULL,
  `evaluacion_id` int unsigned DEFAULT NULL,
  `puntuacion` decimal(4,1) NOT NULL,
  PRIMARY KEY (`id_evaluacion_criterio`),
  KEY `evaluacion_criterios_criterios_FK` (`criterio_id`),
  KEY `evaluacion_criterios_evaluaciones_FK` (`evaluacion_id`),
  CONSTRAINT `evaluacion_criterios_criterios_FK` FOREIGN KEY (`criterio_id`) REFERENCES `criterios` (`criterio_id`),
  CONSTRAINT `evaluacion_criterios_evaluaciones_FK` FOREIGN KEY (`evaluacion_id`) REFERENCES `evaluaciones` (`evaluacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_criterios`
--

LOCK TABLES `evaluacion_criterios` WRITE;
/*!40000 ALTER TABLE `evaluacion_criterios` DISABLE KEYS */;
INSERT INTO `evaluacion_criterios` VALUES (1,1,1,0.8),(2,2,1,1.4),(3,3,1,3.0),(4,4,1,0.3),(5,5,1,0.5),(6,1,2,0.1),(7,2,2,1.8),(8,3,2,3.0),(9,4,2,2.6),(10,5,2,0.7),(11,1,3,1.0),(12,2,3,2.0),(13,3,3,3.0),(14,4,3,3.0),(15,5,3,0.8),(16,1,4,1.0),(17,2,4,2.0),(18,3,4,1.5),(19,4,4,0.8),(20,5,4,0.3),(21,1,5,0.1),(22,2,5,1.8),(23,3,5,1.7),(24,4,5,3.0),(25,5,5,0.6),(26,1,6,1.0),(27,2,6,1.0),(28,3,6,0.3),(29,4,6,0.3),(30,5,6,1.0),(31,1,7,0.9),(32,2,7,0.2),(33,3,7,3.0),(34,4,7,1.7),(35,5,7,0.6),(36,1,8,0.9),(37,2,8,2.0),(38,3,8,0.3),(39,4,8,2.6),(40,5,8,0.6),(41,17,9,10.0),(42,18,9,5.0),(43,19,9,10.0),(44,20,9,10.0),(45,21,9,10.0),(46,22,9,10.0),(47,23,9,10.0),(48,24,9,10.0),(49,25,9,10.0),(50,26,9,10.0),(51,27,9,10.0),(52,1,10,11.0),(53,2,10,10.0),(54,3,10,0.5),(55,4,10,8.0),(56,5,10,5.7),(57,1,11,10.0),(58,2,11,10.0),(59,3,11,8.0),(60,4,11,1.0),(61,5,11,6.3),(62,17,12,10.0),(63,18,12,8.0),(64,19,12,7.0),(65,20,12,9.0),(66,21,12,10.0),(67,22,12,1.0),(68,23,12,8.6),(69,24,12,5.0),(70,25,12,10.0),(71,26,12,10.0),(72,27,12,10.0),(73,17,13,10.0),(74,18,13,1.0),(75,19,13,10.0),(76,20,13,10.0),(77,21,13,10.0),(78,22,13,10.0),(79,23,13,10.0),(80,24,13,10.0),(81,25,13,10.0),(82,26,13,10.0),(83,27,13,10.0),(84,6,14,10.0),(85,7,14,10.0),(86,8,14,10.0),(87,9,14,10.0),(88,10,14,10.0),(89,11,14,10.0),(90,12,14,10.0),(91,13,14,10.0),(92,14,14,10.0),(93,15,14,10.0),(94,16,14,10.0),(95,28,15,10.0),(96,29,15,10.0),(97,30,15,10.0),(98,31,15,10.0),(99,32,15,10.0),(100,33,15,10.0),(101,34,15,10.0),(102,35,15,10.0),(103,36,15,10.0),(104,37,15,10.0),(105,38,15,10.0),(106,39,15,10.0),(107,28,16,10.0),(108,29,16,10.0),(109,30,16,10.0),(110,31,16,10.0),(111,32,16,10.0),(112,33,16,10.0),(113,34,16,10.0),(114,35,16,10.0),(115,36,16,10.0),(116,37,16,10.0),(117,38,16,10.0),(118,39,16,10.0),(119,1,17,10.0),(120,2,17,10.0),(121,3,17,1.0),(122,4,17,8.0),(123,5,17,8.5),(124,6,18,10.0),(125,7,18,10.0),(126,8,18,10.0),(127,9,18,8.0),(128,10,18,6.0),(129,11,18,6.0),(130,12,18,8.0),(131,13,18,7.0),(132,14,18,9.0),(133,15,18,5.0),(134,16,18,10.0);
/*!40000 ALTER TABLE `evaluacion_criterios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluaciones` (
  `evaluacion_id` int unsigned NOT NULL AUTO_INCREMENT,
  `evaluador_id` int unsigned NOT NULL,
  `proyecto_id` int unsigned NOT NULL,
  `fecha_evaluacion` datetime NOT NULL,
  `nota_evaluacion` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`evaluacion_id`),
  KEY `evaluaciones_evaluadores_FK` (`evaluador_id`),
  KEY `evaluaciones_proyectos_FK` (`proyecto_id`),
  CONSTRAINT `evaluaciones_evaluadores_FK` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`evaluador_id`),
  CONSTRAINT `evaluaciones_proyectos_FK` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES (1,30,2,'2025-09-17 01:05:42',6.0),(2,32,2,'2025-09-17 01:28:01',8.1),(3,33,2,'2025-09-17 01:29:10',9.8),(4,36,1,'2025-09-17 01:52:44',5.6),(5,37,1,'2025-09-17 15:40:12',7.2),(6,38,1,'2025-09-17 15:49:56',3.6),(7,40,3,'2025-09-17 16:46:20',6.3),(8,42,3,'2025-09-17 18:32:56',6.4),(9,56,68,'2025-09-21 21:46:22',10.0),(10,56,33,'2025-09-21 21:51:41',6.2),(11,56,33,'2025-09-21 21:56:41',6.3),(12,56,68,'2025-09-21 22:01:14',9.5),(13,57,68,'2025-09-21 22:03:33',10.0),(14,57,56,'2025-09-21 22:04:46',10.0),(15,58,81,'2025-09-21 22:11:40',10.0),(16,59,82,'2025-09-21 22:16:32',10.0),(17,60,6,'2025-09-22 17:58:39',6.5),(18,60,58,'2025-09-22 18:02:17',8.5);
/*!40000 ALTER TABLE `evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluadores`
--

DROP TABLE IF EXISTS `evaluadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluadores` (
  `evaluador_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) NOT NULL,
  `email` varchar(65) NOT NULL,
  PRIMARY KEY (`evaluador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluadores`
--

LOCK TABLES `evaluadores` WRITE;
/*!40000 ALTER TABLE `evaluadores` DISABLE KEYS */;
INSERT INTO `evaluadores` VALUES (1,'Anibal Martinez','aMartinez@gmail.com'),(2,'Pedro Hernandez','pedro.mined@gmail.com'),(3,'Pedro Hernandez','pedro.mined@gmail.com'),(4,'Pedro Hernandez','pedro.mined@gmail.com'),(5,'Pedro Hernandez','pedro.mined@gmail.com'),(6,'Pedro Hernandez','pedro.mined@gmail.com'),(7,'Pedro Hernandez','pedro.mined@gmail.com'),(8,'Pedro Hernandez','pedro.mined@gmail.com'),(9,'Pedro Hernandez','pedro.mined@gmail.com'),(10,'Pedro Hernandez','pedro.mined@gmail.com'),(11,'Pedro Hernandez','pedro.mined@gmail.com'),(12,'Pedro Hernandez','pedro.mined@gmail.com'),(13,'Pedro Hernandez','pedro.mined@gmail.com'),(14,'Pedro Hernandez','pedro.mined@gmail.com'),(15,'Pedro Hernandez','pedro.mined@gmail.com'),(16,'Pedro Hernandez','pedro.mined@gmail.com'),(17,'Pedro Hernandez','pedro.mined@gmail.com'),(18,'Pedro Hernandez','pedro.mined@gmail.com'),(19,'Pedro Hernandez','pedro.mined@gmail.com'),(20,'Pedro Hernandez','pedro.mined@gmail.com'),(21,'Pedro Hernandez','pedro.mined@gmail.com'),(22,'Pedro Hernandez','pedro.mined@gmail.com'),(23,'Pedro Hernandez','pedro.mined@gmail.com'),(24,'Pedro Hernandezz','pedro.mined@gmail.com'),(25,'Pedro Hernandezz','pedro.mined@gmail.com'),(26,'Pedro Hernandez','pedro.mined@gmail.com'),(27,'Pedro Hernandez','pedro.mined@gmail.com'),(28,'Pedro Hernandez','pedro.mined@gmail.com'),(29,'Pedro Hernandezz','pedro.mined@gmail.com'),(30,'Pedro Hernandez','pedro.mined@gmail.com'),(31,'Pedro Hernandezz','pedro.mined@gmail.com'),(32,'Pedro Hernandezzz','pedro.mined@gmail.com'),(33,'Anibal Martinezz','aMartinez@gmail.com'),(34,'Pedro Hernandezz','pedro.mined@gmail.com'),(35,'Pedro Hernandez','pedro.mined@gmail.com'),(36,'Pedro Hernandezzz','pedro.mined@gmail.com'),(37,'chepe guera','chepeeeeeee@gmail.com'),(38,'pedrito hernandez','pedro.mined@gmail.com'),(39,'Pedro Hernandez','pedro.mined@gmail.com'),(40,'gerson dinarte','gerdinarte@gmail.com'),(41,'Pedro Hernandez','pedro.mined@gmail.com'),(42,'Pedro Hernandez','pedro.mined@gmail.com'),(43,'Pedro Hernandez','pedro.mined@gmail.com'),(44,'Pedro Hernandez','pedro.mined@gmail.com'),(45,'Pedro Hernandezz','pedro.mined@gmail.com'),(46,'Pedro Hernandez','pedro.mined@gmail.com'),(47,'Pedro Hernandez','pedro.mined@gmail.com'),(48,'Pedro Hernandezzz','pedro.mined@gmail.com'),(49,'Pedro Hernandez','pedro.mined@gmail.com'),(50,'Pedro Hernandezzz','pedro.mined@gmail.com'),(51,'Pedro Hernandezz','pedro.mined@gmail.com'),(52,'Pedro Hernandezzz','pedro.mined@gmail.com'),(53,'Pedro Hernandez','pedro.mined@gmail.com'),(54,'Pedro Hernandez','pedro.mined@gmail.com'),(55,'Pedro Hernandez','pedro.mined@gmail.com'),(56,'Pedro Hernandezz','pedro.mined@gmail.com'),(57,'Anibal Martinez','aMartinez@gmail.com'),(58,'Pedro Hernandezzz','pedro.mined@gmail.com'),(59,'Pedro Hernandez','pedro.mined@gmail.com'),(60,'chepe guera','chepeeeeeee@gmail.com');
/*!40000 ALTER TABLE `evaluadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grados`
--

DROP TABLE IF EXISTS `grados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grados` (
  `grado_id` int unsigned NOT NULL AUTO_INCREMENT,
  `año` varchar(5) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `seccion` varchar(5) NOT NULL,
  PRIMARY KEY (`grado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grados`
--

LOCK TABLES `grados` WRITE;
/*!40000 ALTER TABLE `grados` DISABLE KEYS */;
INSERT INTO `grados` VALUES (1,'2','DS','A'),(2,'2','AC','A'),(3,'2','LyA','A'),(4,'1','APS','A'),(5,'2','SE','A'),(6,'1','G','A'),(7,'1','G','B'),(8,'1','G','C'),(9,'1','G','D'),(10,'1','G','E'),(11,'1','APS','B'),(12,'1','SE','A'),(13,'1','LyA','A'),(14,'1','AC','A'),(15,'1','DS','A'),(16,'1','DS','B'),(17,'1','DG','A'),(18,'2','G','A'),(19,'2','G','B'),(20,'2','G','C'),(21,'2','G','D'),(22,'2','DG','A'),(23,'2','APS','A'),(24,'2','APS','B'),(25,'3','DS','A'),(26,'3','AC','A'),(27,'3','LyA','A'),(28,'3','APS','A'),(29,'3','APS','B'),(30,'3','DG','A'),(31,'3','SE','A');
/*!40000 ALTER TABLE `grados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `nivel_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (1,'1','Criterios para evaluación de Expo de Logros'),(2,'2','Criterios para evaluación de Expotecnia para primeros años'),(3,'3','Criterios para evaluación de Expotecnia de segundos años'),(4,'4','Criterios de evaluación para Expotecnia de terceros años');
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `proyecto_id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `grado_id` int unsigned NOT NULL,
  `nota` float DEFAULT NULL,
  `nivel` int NOT NULL,
  `nivel_id` int unsigned NOT NULL,
  PRIMARY KEY (`proyecto_id`),
  KEY `proyectos_grados_FK` (`grado_id`),
  KEY `proyectos_niveles_FK` (`nivel_id`),
  CONSTRAINT `proyectos_grados_FK` FOREIGN KEY (`grado_id`) REFERENCES `grados` (`grado_id`),
  CONSTRAINT `proyectos_niveles_FK` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`nivel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'matematicas',1,5.46667,1,1),(2,'lenguaje',2,7.96667,1,1),(3,'sociales',3,NULL,1,1),(4,'globalsist',1,NULL,3,3),(5,'lenguaje',1,NULL,1,1),(6,'matematicas',2,NULL,1,1),(7,'matematicas',3,NULL,1,1),(8,'matematicas',4,NULL,1,1),(9,'matematicas',5,NULL,1,1),(10,'matematicas',6,NULL,1,1),(11,'matematicas',7,NULL,1,1),(12,'matematicas',8,NULL,1,1),(13,'matematicas',9,NULL,1,1),(14,'matematicas',10,NULL,1,1),(15,'matematicas',11,NULL,1,1),(16,'matematicas',12,NULL,1,1),(17,'matematicas',13,NULL,1,1),(18,'matematicas',14,NULL,1,1),(19,'matematicas',15,NULL,1,1),(20,'matematicas',16,NULL,1,1),(21,'matematicas',17,NULL,1,1),(22,'matematicas',18,NULL,1,1),(23,'matematicas',19,NULL,1,1),(24,'matematicas',20,NULL,1,1),(25,'matematicas',21,NULL,1,1),(26,'matematicas',22,NULL,1,1),(27,'matematicas',23,NULL,1,1),(28,'matematicas',24,NULL,1,1),(29,'sociales',1,NULL,1,1),(30,'sociales',2,NULL,1,1),(31,'sociales',4,NULL,1,1),(32,'sociales',5,NULL,1,1),(33,'sociales',6,NULL,1,1),(34,'sociales',7,NULL,1,1),(35,'sociales',8,NULL,1,1),(36,'sociales',9,NULL,1,1),(37,'sociales',10,NULL,1,1),(38,'sociales',11,NULL,1,1),(39,'sociales',12,NULL,1,1),(40,'sociales',13,NULL,1,1),(41,'sociales',14,NULL,1,1),(42,'sociales',15,NULL,1,1),(43,'sociales',16,NULL,1,1),(44,'sociales',17,NULL,1,1),(45,'sociales',18,NULL,1,1),(46,'sociales',19,NULL,1,1),(47,'sociales',20,NULL,1,1),(48,'sociales',21,NULL,1,1),(49,'sociales',22,NULL,1,1),(50,'sociales',23,NULL,1,1),(51,'sociales',24,NULL,1,1),(52,'tecnia 1',4,NULL,2,2),(53,'tecnia 2',11,NULL,2,2),(54,'tecnia 3',12,NULL,2,2),(55,'tecnia 4',13,NULL,2,2),(56,'tecnia 5',14,NULL,2,2),(57,'tecnia 6',15,NULL,2,2),(58,'tecnia 7',16,NULL,2,2),(59,'tecia 8',17,NULL,2,2),(60,'tecnia 9',4,NULL,2,2),(61,'tecnia 10',11,NULL,2,2),(62,'tecnia 11',12,NULL,2,2),(63,'tecnia 12',13,NULL,2,2),(64,'tecnia 13',14,NULL,2,2),(65,'tecnia 14',15,NULL,2,2),(66,'tecnia 15',16,NULL,2,2),(67,'tecnia 16',17,NULL,2,2),(68,'tecnia 17',1,9.83333,3,3),(69,'tecnia 18',2,NULL,3,3),(70,'tecnia 19',3,NULL,3,3),(71,'tecnia 20',5,NULL,3,3),(72,'tecnia 21',22,NULL,3,3),(73,'tecnia 22',23,NULL,3,3),(74,'tecnia 23',24,NULL,3,3),(75,'tecnia 24',2,NULL,3,3),(76,'tecnia 25',3,NULL,3,3),(77,'tecnia 26',5,NULL,3,3),(78,'tecnia 27',22,NULL,3,3),(79,'tecnia 28',23,NULL,3,3),(80,'tecnia 29',24,NULL,3,3),(81,'tecnia 30',25,NULL,4,4),(82,'tecnia 31',26,NULL,4,4),(83,'tecnia 32',27,NULL,4,4),(84,'tecnia 33',28,NULL,4,4),(85,'tecnia 34',29,NULL,4,4),(86,'tecnia 35',30,NULL,4,4),(87,'tecnia 36',31,NULL,4,4),(88,'tecnia 37',25,NULL,4,4),(89,'tecnia 38',26,NULL,4,4),(90,'tecnia 39',27,NULL,4,4),(91,'tecnia 40',28,NULL,4,4),(92,'tecnia 41',29,NULL,4,4),(93,'tecnia 42',30,NULL,4,4),(94,'tecnia 43',31,NULL,4,4);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24  2:42:23
