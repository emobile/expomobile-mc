-- MySQL dump 10.13  Distrib 5.5.35, for Linux (x86_64)
--
-- Host: localhost    Database: expomobi_mc
-- ------------------------------------------------------
-- Server version	5.5.35-cll

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `place` varchar(255) NOT NULL,
  `observations` text,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_event_id_fk` (`event_id`),
  CONSTRAINT `activities_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Juego de Golf ANADIC','2013-11-24 07:00:00','2013-11-24 14:00:00','Campo de Golf de Moon Palace','',1,'2013-11-15 17:40:40','2013-11-15 17:40:40'),(2,'Fotografía de Grupo','2013-11-25 15:00:00','2013-11-25 15:30:00','Explanada Junto a la Alberca','',1,'2013-11-15 17:42:15','2013-11-15 17:42:15'),(3,'Cena Temática','2013-11-25 21:00:00','2013-11-25 23:00:00','Salón Star 5,6,7,8','',1,'2013-11-15 17:43:55','2013-11-15 17:43:55'),(4,'Disco Night 80´s','2013-11-25 23:00:00','2013-11-26 02:00:00','Discoteque del Moon Palace','',2,'2013-11-15 17:45:44','2013-11-15 17:45:44'),(5,'Comida y Tarde Libre','2013-11-26 16:00:00','2013-11-26 19:30:00','Restaurantes del Hotel Moon Palace, Alberca, Playa del Hotel','',2,'2013-11-15 17:47:35','2013-11-15 17:47:35'),(6,'Cena de Clausura Show','2013-11-26 21:00:00','2013-11-27 02:00:00','Salón Star 5,6,7,8','',2,'2013-11-15 18:01:13','2013-11-15 18:01:13'),(7,'actividad','2014-02-12 11:42:00','2014-02-12 11:42:00','Sala Principal','observacion',3,'2014-02-12 18:43:05','2014-02-12 18:43:05');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendee_expositions`
--

DROP TABLE IF EXISTS `attendee_expositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendee_expositions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendee_id` int(11) NOT NULL,
  `exhibitor_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendee_expositions_attendee_id_fk` (`attendee_id`),
  KEY `attendee_expositions_exhibitor_id` (`exhibitor_id`),
  KEY `attendee_expositions_event_id_fk` (`event_id`),
  CONSTRAINT `attendee_expositions_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `attendee_expositions_attendee_id_fk` FOREIGN KEY (`attendee_id`) REFERENCES `attendees` (`id`),
  CONSTRAINT `attendee_expositions_exhibitor_id` FOREIGN KEY (`exhibitor_id`) REFERENCES `exhibitors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee_expositions`
--

LOCK TABLES `attendee_expositions` WRITE;
/*!40000 ALTER TABLE `attendee_expositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendee_expositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendee_workshops`
--

DROP TABLE IF EXISTS `attendee_workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendee_workshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendee_id` int(11) NOT NULL,
  `workshop_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendee_workshops_attendee_id_fk` (`attendee_id`),
  KEY `attendee_workshops_workshop_id_fk` (`workshop_id`),
  KEY `attendee_workshops_event_id_fk` (`event_id`),
  CONSTRAINT `attendee_workshops_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `attendee_workshops_attendee_id_fk` FOREIGN KEY (`attendee_id`) REFERENCES `attendees` (`id`),
  CONSTRAINT `attendee_workshops_workshop_id_fk` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee_workshops`
--

LOCK TABLES `attendee_workshops` WRITE;
/*!40000 ALTER TABLE `attendee_workshops` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendee_workshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendee_id` varchar(255) NOT NULL,
  `e_name` varchar(255) NOT NULL,
  `e_tradename` varchar(255) DEFAULT NULL,
  `e_street` varchar(255) NOT NULL,
  `e_ext_number` int(11) NOT NULL,
  `e_int_number` varchar(255) DEFAULT NULL,
  `e_colony` varchar(255) NOT NULL,
  `e_municipality` varchar(255) NOT NULL,
  `e_city` varchar(255) NOT NULL,
  `e_state` varchar(255) NOT NULL,
  `e_zip_code` int(11) NOT NULL,
  `e_rfc` varchar(255) DEFAULT NULL,
  `e_lada` int(11) NOT NULL,
  `e_phone` varchar(255) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `a_email` varchar(255) NOT NULL,
  `a_chat` varchar(255) DEFAULT NULL,
  `a_cellphone` varchar(255) DEFAULT NULL,
  `a_tel_nextel` varchar(255) DEFAULT NULL,
  `a_radio_nextel` varchar(255) DEFAULT NULL,
  `a_is_director` tinyint(1) DEFAULT NULL,
  `a_platform` varchar(255) DEFAULT NULL,
  `e_main_line` varchar(255) DEFAULT NULL,
  `a_sec_line` varchar(255) DEFAULT NULL,
  `a_num_employees` int(11) DEFAULT NULL,
  `a_other_line` varchar(255) DEFAULT NULL,
  `a_web` varchar(255) DEFAULT NULL,
  `a_market_segment` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `confirmation_token` varchar(255) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `a_sector` int(11) NOT NULL,
  `a_want_email` tinyint(1) NOT NULL DEFAULT '0',
  `a_job` varchar(255) NOT NULL,
  `attended` tinyint(1) NOT NULL DEFAULT '0',
  `attended_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendees_subgroup_id_fk` (`subgroup_id`),
  KEY `attendees_event_id_fk` (`event_id`),
  CONSTRAINT `attendees_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `attendees_subgroup_id_fk` FOREIGN KEY (`subgroup_id`) REFERENCES `subgroups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendees`
--

LOCK TABLES `attendees` WRITE;
/*!40000 ALTER TABLE `attendees` DISABLE KEYS */;
INSERT INTO `attendees` VALUES (1,'AN0001','INNOVACIÓN Y CONSULTORÍA MÓVIL S.C','eMobile','AVENIDA HEROICO COLEGIO MILITAR',123,'','NOMBRE DE DIOS','CHIHUAHUA','CHIHUAHUA','CHIHUAHUA',33333,'qwe',614,'6141111111','JORGE ALBERTO LUNA QUINTANILLA','seguidor777@gmail.com','','6141111111','','',0,'Blackberry;','APLICACIONES WEB','DISEÑO WEB',10,'DESARROLLO WEB','','Gobierno;PyMEs;Web;',1,'sdg34dfgd3',3,2,1,1,'Ventas',0,NULL,'2013-11-20 23:56:54','2013-11-20 23:56:54'),(2,'EP0001','a','a','a',5,'1','col','d','c','CHIHUAHUA',12343,'rfc',614,'123','Raúl Maese','rmaese@emobile.com.mx','','5','','',0,'IPhone;','CABLEADO ESTRUCTURADO','AULAS EDUCATIVAS / LABORATORIOS',2,'g','','Gobierno;',1,'sdg34dfgd3',6,1,1,1,'Ventas',0,NULL,'2013-11-21 00:34:34','2013-11-21 00:34:34'),(3,'AN0002','INNOVACIÓN Y CONSULTORÍA MÓVIL S.C','Innovacion y Consultoria','Calle Syndey',331,'A','Colonia Mirador','Manzanos','Cuauhtemoc','CHIHUAHUA',24531,'NFHLJ941',531,'6149902182','Osiel Bonilla','obonilla@emobile.com.mx','','43','','',0,'Android','CONMUTADORES','CAPACITACION',3,'gir','','Corporativo',1,'sdg34dfgd3',3,2,1,1,'Ventas',0,NULL,'2013-11-21 00:36:33','2014-01-30 22:49:56'),(4,'AN0003','d','d','d',23,'d','f','f','r','COLIMA',43524,'df',614,'544524','Dianita Chacón','dchacon@emobile.com.mx','','3434','','',1,'Android;','CABLEADO ESTRUCTURADO','DESARROLLO APL. MOVILES',3,'v','','PyMEs;',1,'sdg34dfgd3',3,2,1,1,'Ventas',1,'2014-02-12 12:56:42','2013-11-21 00:40:58','2014-02-12 19:56:42'),(5,'TC0004','Innovación y Consultoría Móvil','Innovación y Consultoría Móvil','Ave Americas',533,'A','Centro','Chihuahua','Chihuahua','CHIHUAHUA',95013,'',614,'412 49 20','Raul Maese','rmaese@emobile.com.mx','','','','',1,'Android','CONMUTADORES','AULAS EDUCATIVAS / LABORATORIOS',1,'','','Gobierno',0,'7awppkjgoh',27,3,1,1,'Desarrollador',1,'2014-02-12 16:59:57','2014-02-04 22:00:33','2014-02-12 22:59:57'),(6,'TC0005','INNOVACIÓN Y CONSULTORÍA MÓVIL S.C','Innovacion y Consultoria Movil S C','Ave Heroico Militar',3917,'','Col. Nombre de Dios','CHIHUAHUA','Chihuahua','CHIHUAHUA',32441,'FLAJ4029',614,'4191895','Juan Torres','jtorres@emobile.com.mx','','','','',0,'','CAPACITACION','DESARROLLO APL. MOVILES',2,'','','PyMEs;',0,'hy01eyyj7r',26,3,2,0,'CEO',1,'2014-02-12 16:59:56','2014-02-05 00:35:25','2014-02-12 22:59:56'),(7,'TC0006','Siete Computación','Siete Computación','Calle Julian Carrillo',150,'','Col. Casa Blanca','Chihuahua','Chihuahua','CHIHUAHUA',37170,'JFL8402',477,'21406000','Julio Rodriguez Blanco','julio.rodriguez@siete.com.mx','','','','',0,'','CABLEADO ESTRUCTURADO','REDES',5,'','','Corporativo;',0,'5ido65o4ff',26,3,2,0,'Director Ejecutivo',1,'2014-02-12 16:59:55','2014-02-05 00:39:52','2014-02-12 22:59:55');
/*!40000 ALTER TABLE `attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferences`
--

DROP TABLE IF EXISTS `conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `conferencist` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `place` varchar(255) NOT NULL,
  `observations` text,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_file_size` int(11) DEFAULT NULL,
  `photo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conferences_event_id_fk` (`event_id`),
  CONSTRAINT `conferences_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferences`
--

LOCK TABLES `conferences` WRITE;
/*!40000 ALTER TABLE `conferences` DISABLE KEYS */;
INSERT INTO `conferences` VALUES (1,'Bienvenida','Ing. Héctor Cárdenas Treviño Vicepresidente ANADIC Nacional','2013-11-24 16:30:00','2013-11-24 17:00:00','Salón Star 1,2,3,4','',1,'2013-11-15 17:20:37','2013-11-15 17:21:50',NULL,NULL,NULL,NULL),(2,'Conferencia Magna Empresarial','N/A','2013-11-24 17:00:00','2013-11-24 18:00:00','Salón Star 1,2,3,4','',1,'2013-11-15 17:24:00','2013-11-15 17:24:00',NULL,NULL,NULL,NULL),(3,'Panel de Innovación','N/A','2013-11-24 18:00:00','2013-11-24 19:00:00','Salón Star 1,2,3,4','',1,'2013-11-15 17:25:13','2013-11-15 17:25:13',NULL,NULL,NULL,NULL),(4,'Conferencia Magna Empresarial \"Nuestra Industria\"','Ing. Juan Luis Tron Melo Director General de Tripp Lite México','2013-11-25 17:30:00','2013-11-25 18:30:00','Salón Star 1,2,3,4','',2,'2013-11-15 17:27:51','2014-01-30 19:22:38','speaker2.jpg','image/jpeg',7337,'2014-01-30 19:22:38'),(5,'Conferencia Magna Empresarial \"2013, Año de Definiciones\"','Ing. Macario Schettino Analista Económico','2013-11-25 18:30:00','2013-11-25 19:30:00','Salón Star 1,2,3,4','',2,'2013-11-15 17:30:32','2014-01-30 19:22:13','speaker1.jpg','image/jpeg',10192,'2014-01-30 19:22:12'),(6,'Conferencia Magna de Gobierno','Ing. María A Villarreal Sánchez Directora General de Tecnologías de la Información y Comunicaciones de la Secretaría de Desarrollo Social del Gobierno Federal (SEDESOL)','2013-11-26 15:00:00','2013-11-26 16:00:00','Salón Star 1,2,3,4','',2,'2013-11-15 17:33:33','2014-01-30 19:23:06','public-speaking-woman-resized-600.jpg','image/jpeg',192058,'2014-01-30 19:23:06'),(7,'LAS TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIONES EN EL SECTOR FINANCIERO','Rafael Fernández Corro','2014-02-08 15:00:00','2014-02-09 15:00:00','Sala C','',3,'2014-02-04 21:08:54','2014-02-06 21:07:47','conf_rafael-fernandez-corro.jpg','image/jpeg',6397,'2014-02-06 21:07:46'),(8,'TICs E INNOVACION EN EL SECTOR FINANCIERO, LA PERSPECTIVA DEL CEO','Manuel Somoza Alonso','2014-02-04 20:00:00','2014-02-04 21:00:00','Sala D','',3,'2014-02-04 21:10:58','2014-02-06 21:08:11','conf_Manuel-Somoza-2.png','image/png',13090,'2014-02-06 21:08:10'),(9,'RETOS Y TENDENCIAS DE HOY BANCA Y LAS TIC','Samuel Baldwin','2014-02-04 17:00:00','2014-02-04 18:00:00','Sala C','',3,'2014-02-04 21:12:15','2014-02-06 21:08:28','conf_Samuel-Baldwin-Ayestaran.png','image/png',14098,'2014-02-06 21:08:27'),(10,'LA ERRADICACIÓN DE LA EXCLUSIÓN FINANCIERA, EL ROL DE LAS TICS','Mauricio Braverman','2014-02-04 18:00:00','2014-02-04 19:00:00','Sala B','',3,'2014-02-04 21:43:59','2014-02-06 21:08:46','conf_Mauricio-Braverman.png','image/png',12309,'2014-02-06 21:08:45'),(11,'¿EL FIN DE LAS CONTRASEÑAS? DESAFÍOS EN LA AUTENTIFICACIÓN DE USUARIOS','Fernando Catoira','2014-02-04 19:00:00','2014-02-04 20:00:00','Sala D','Security Analyst de ESET Latinoamérica',3,'2014-02-04 21:49:47','2014-02-06 21:10:12','conf_federico-hernandez-compartamos.png','image/png',12952,'2014-02-06 21:10:12');
/*!40000 ALTER TABLE `conferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diaries`
--

DROP TABLE IF EXISTS `diaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diaries_event_id_fk` (`event_id`),
  CONSTRAINT `diaries_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diaries`
--

LOCK TABLES `diaries` WRITE;
/*!40000 ALTER TABLE `diaries` DISABLE KEYS */;
INSERT INTO `diaries` VALUES (1,'2013-11-24 07:00:00','2013-11-24 14:00:00','Actividad extra','Juego de Golf ANADIC','Campo de Golf de Moon Palace',1,'2013-11-14 16:46:10','2013-11-14 16:46:10'),(2,'2013-11-24 11:00:00','2013-11-24 15:30:00','Registro','Registro de Participantes','Registro especial segundo piso recepción',1,'2013-11-14 16:50:33','2013-11-14 16:50:33'),(3,'2013-11-24 14:00:00','2013-11-24 16:00:00','Comida','Comida','Restaurantes del Hotel Moon Palace',1,'2013-11-14 16:54:17','2013-11-14 16:54:17'),(4,'2013-11-24 16:30:00','2013-11-24 17:00:00','Bienvenida','Bienvenida por el Ing. Héctor Cárdenas Treviño Vicepresidente Nacional ANADIC','Salón Star 1,2,3,4',1,'2013-11-14 16:59:45','2013-11-14 16:59:45'),(5,'2013-11-24 17:00:00','2013-11-24 18:00:00','Conferencia','Conferencia Magna de Innovación','Salón Star 1,2,3,4',1,'2013-11-14 17:02:22','2013-11-14 17:02:22'),(6,'2013-11-24 18:00:00','2013-11-24 19:00:00','Actividad extra','Panel de innovación','Salón Star 1,2,3,4',1,'2013-11-14 17:33:45','2013-11-14 17:33:45'),(7,'2013-11-24 20:30:00','2013-11-24 21:00:00','Inauguración','Inauguración por el Ing. Luis Arturo Obregón Cervantes Presidente Nacional de ANADIC','Salón Star 5,6,7,8',1,'2013-11-14 17:38:04','2013-11-14 17:45:06'),(8,'2013-11-24 21:00:00','2013-11-25 00:00:00','Cena','Cena de Bienvenida','Salón Star 5,6,7,8',1,'2013-11-14 17:44:32','2013-11-14 17:44:32'),(9,'2013-11-25 07:00:00','2013-11-25 08:45:00','Desayuno','Desayuno','Restaurantes de Moon Palace',1,'2013-11-14 18:06:37','2013-11-14 18:06:37'),(10,'2013-11-25 09:00:00','2013-11-25 15:00:00','Exposición','Exposición','Salón Galactic',1,'2013-11-14 18:08:06','2013-11-14 18:08:06'),(11,'2013-11-25 08:00:00','2013-11-25 15:00:00','Reunion','Reuniones en salones','Salones Jupiter, Saturn, Mars',1,'2013-11-14 18:20:09','2013-11-14 18:20:09'),(12,'2013-11-25 11:00:00','2013-11-25 13:00:00','Actividad extra','Face To Face','Sky Bar segundo piso área del congreso',1,'2013-11-14 18:28:09','2013-11-14 18:28:09'),(13,'2013-11-25 15:00:00','2013-11-25 15:30:00','Actividad extra','Fotografía Grupal','Explanada Junto a la alberca',1,'2013-11-14 18:29:46','2013-11-14 18:29:46'),(14,'2013-11-25 15:30:00','2013-11-25 17:00:00','Comida','Comida','Restaurantes del Hotel Moon Palace',1,'2013-11-14 18:30:55','2013-11-20 23:17:58'),(15,'2013-11-25 17:30:00','2013-11-25 18:30:00','Conferencia','Conferencia Magna Empresarial \"Nuestra Industria\" Impartida por el Ing. Juan Luis Tron Melo Director General de Tripp Lite México','Salón Star 1,2,3,4',1,'2013-11-14 18:37:45','2013-11-14 18:37:45'),(16,'2013-11-25 18:30:00','2013-11-25 19:30:00','Conferencia','Conferencia Magna Empresarial \"2013, Año de definiciones\" impartida por el Ing. Macario Schettino Analista Económico','Salón Star 1,2,3,4',2,'2013-11-14 18:41:32','2013-11-14 18:41:32'),(17,'2013-11-25 19:30:00','2013-11-25 20:45:00','Libre','Libre','Opcional para cambio de vestimenta',2,'2013-11-14 18:43:58','2013-11-14 18:43:58'),(18,'2013-11-25 21:00:00','2013-11-25 23:00:00','Cena','Cena Temática','Salón Star 5,6,7,8',2,'2013-11-14 18:45:57','2013-11-14 18:45:57'),(19,'2013-11-25 23:00:00','2013-11-26 02:00:00','Actividad extra','Disco Night 80´s ','Discoteque del Moon Palace',2,'2013-11-14 18:48:41','2013-11-14 18:48:41'),(20,'2013-11-26 07:00:00','2013-11-26 08:45:00','Desayuno','Desayuno','Restaurantes del Moon Palace',2,'2013-11-14 18:51:05','2013-11-20 21:23:02'),(21,'2013-11-26 09:00:00','2013-11-26 15:00:00','Exposición','Exposición','Salón Galactic',2,'2013-11-14 18:52:18','2013-11-14 18:52:18'),(22,'2013-11-26 08:00:00','2013-11-26 15:00:00','Reunion','Reuniones en salones','Salones Jupiter, Saturn, Mars',2,'2013-11-14 18:54:16','2013-11-14 18:54:16'),(23,'2013-11-26 11:00:00','2013-11-26 13:00:00','Actividad extra','Face To Face','Sky Bar segundo piso área del congreso',2,'2013-11-14 18:55:49','2013-11-14 18:55:49'),(24,'2013-11-26 15:00:00','2013-11-26 16:00:00','Conferencia','Conferencia Magna Gobierno Impartida por Ing. María A. Villarreal Sánchez Villela Directora General de Tecnologías de la Información y Comunicaciones de la Secretaría de Desarrollo Social del Gobierno Federal (SEDESOL)','Salón Star 1,2,3,4',2,'2013-11-14 18:59:12','2013-11-14 18:59:12'),(25,'2013-11-26 16:00:00','2013-11-26 19:30:00','Comida y Tarde Libre','Comida y Tarde Libre','Restaurantes del Hotel Moon Palace - Alberca, Playa del Hotel',2,'2013-11-14 19:04:00','2013-11-14 19:04:00'),(26,'2013-11-26 16:00:00','2013-11-26 17:30:00','Comida','Comida Reunion CAS ANADIC','Salones Júpiter 1,2,3,4',2,'2013-11-14 19:06:19','2013-11-14 19:06:19'),(27,'2013-11-26 21:00:00','2013-11-27 02:00:00','Cena','Cena de Clausura Show','Salón Star 5,6,7,8',2,'2013-11-14 19:07:49','2013-11-14 19:07:49'),(28,'2013-11-27 08:00:00','2013-11-27 10:00:00','Desayuno','Desayuno','Restaurantes de Moon Palace',2,'2013-11-14 19:08:43','2013-11-14 19:08:43'),(29,'2013-11-27 10:00:00','2013-11-27 12:00:00','Junta','Junta de Presidentes','Salón Ejecutivo',2,'2013-11-14 19:09:52','2013-11-14 19:09:52'),(30,'2013-11-27 10:00:00','2013-11-27 12:00:00','Actividad extra','Mañana Libre','Libre',2,'2013-11-14 19:11:09','2013-11-14 19:11:09'),(31,'2013-11-27 12:00:00','2013-11-27 12:00:00','Check Out','Check out','Looby del Hotel',2,'2013-11-14 19:12:02','2013-11-14 19:12:02'),(32,'2014-02-04 09:00:00','2014-02-04 09:30:00','Introducción','Entrega de Gafetes','Sala Principal',3,'2014-02-04 19:13:53','2014-02-04 21:45:17'),(33,'2014-02-04 09:30:00','2014-02-04 14:00:00','Expo','Inicio de Exposiciones','Sala Principal',3,'2014-02-04 19:16:00','2014-02-04 19:16:00'),(34,'2014-02-04 14:00:00','2014-02-04 15:00:00','Recreativo','Comida','Stands 040 al 050',3,'2014-02-04 19:18:05','2014-02-04 19:18:05'),(35,'2014-02-04 15:00:00','2014-02-04 19:00:00','Educativo','Inicio de las Conferencias','Sala B, C y G',3,'2014-02-04 19:22:16','2014-02-04 19:22:16');
/*!40000 ALTER TABLE `diaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `r_name` varchar(255) NOT NULL,
  `r_enterprise` varchar(255) NOT NULL,
  `r_social_reason` varchar(255) NOT NULL,
  `r_phone` varchar(255) DEFAULT NULL,
  `r_email` varchar(255) NOT NULL,
  `r_job` varchar(255) DEFAULT NULL,
  `r_work_street` varchar(255) DEFAULT NULL,
  `r_work_street_number` varchar(255) DEFAULT NULL,
  `r_work_colony` varchar(255) DEFAULT NULL,
  `r_work_zip` varchar(255) DEFAULT NULL,
  `r_city` varchar(255) DEFAULT NULL,
  `r_state` varchar(255) DEFAULT NULL,
  `r_country` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `workshop_tolerance` int(11) DEFAULT NULL,
  `has_activity` tinyint(1) DEFAULT NULL,
  `has_conference` tinyint(1) DEFAULT NULL,
  `has_facetoface` tinyint(1) DEFAULT NULL,
  `has_offert` tinyint(1) DEFAULT NULL,
  `has_workshop` tinyint(1) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT '1',
  `place` varchar(255) NOT NULL,
  `e_work_street` varchar(255) DEFAULT NULL,
  `e_work_street_number` varchar(255) DEFAULT NULL,
  `e_work_colony` varchar(255) DEFAULT NULL,
  `e_work_zip` varchar(255) DEFAULT NULL,
  `e_city` varchar(255) DEFAULT NULL,
  `e_state` varchar(255) DEFAULT NULL,
  `e_country` varchar(255) DEFAULT NULL,
  `token_for_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `banner_file_name` varchar(255) DEFAULT NULL,
  `banner_content_type` varchar(255) DEFAULT NULL,
  `banner_file_size` int(11) DEFAULT NULL,
  `banner_updated_at` datetime DEFAULT NULL,
  `logo_bellow_file_name` varchar(255) DEFAULT NULL,
  `logo_bellow_content_type` varchar(255) DEFAULT NULL,
  `logo_bellow_file_size` int(11) DEFAULT NULL,
  `logo_bellow_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Evento de prueba','Jorge Alberto Luna Quintanilla','Prueba','Innovación y consultoria móvil S.C.','6141111111','contacto@prueba.com.mx','Representante','Heróico colegio militar','123','Nombre de Dios','33333','Chihuahua','Chihuahua','México','es','Chihuahua',15,0,0,0,0,0,'2013-12-10 01:28:40','2014-12-10 01:28:40',1,'Centro de convenciones',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EP','2014-01-30 00:52:25','2014-01-30 00:52:25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Anadic','Jorge Alberto Luna Quintanilla','Anadic','Innovación y consultoria móvil S.C.','6141111111','contacto@anadic.com.mx','Representante','Heróico colegio militar','123','Nombre de Dios','33333','Chihuahua','Chihuahua','México','es','Chihuahua',15,1,1,1,1,1,'2014-02-04 09:00:00','2014-02-04 21:00:00',1,'Centro de Convenciones','Tecnologico ','#2210','','33201','Chihuahua','Chihuahua','México','AN','2014-01-30 00:52:25','2014-02-04 17:46:49','anadic.png','image/png',16156,'2013-11-14 01:28:41','congreso.png','image/png',21147,'2013-11-14 01:28:41',NULL,NULL,NULL,NULL),(3,'TIC Finanzas','Raúl Maese','Emobile','RS','614 233 54 81','raulmaese@gmail.com','','Americas','#2001','Panamericana','30140','Chihuahua','Chihuahua','México','es','Mexico City',15,1,1,1,1,1,'2014-02-04 09:00:00','2014-02-04 19:00:00',1,'Centro de Convenciones','Tecnologico','#2210','','33201','Chihuahua','Chihuahua','México','TC','2014-02-04 17:57:42','2014-02-07 19:54:05','educaccioncentrado.jpg','image/jpeg',590200,'2014-02-06 16:25:29','clouds.jpg','image/jpeg',648659,'2014-02-06 16:25:30','vinculotic.png','image/png',11217,'2014-02-07 19:25:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibitors`
--

DROP TABLE IF EXISTS `exhibitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `exposition_key` varchar(255) NOT NULL,
  `social_reason` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `stand_location` varchar(255) DEFAULT NULL,
  `stand_size` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `work_street` varchar(255) DEFAULT NULL,
  `work_street_number` varchar(255) DEFAULT NULL,
  `work_colony` varchar(255) DEFAULT NULL,
  `work_zip` int(11) DEFAULT NULL,
  `web_page` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhibitors_event_id_fk` (`event_id`),
  CONSTRAINT `exhibitors_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibitors`
--

LOCK TABLES `exhibitors` WRITE;
/*!40000 ALTER TABLE `exhibitors` DISABLE KEYS */;
INSERT INTO `exhibitors` VALUES (1,'CISCO','p1m','CISCO SYSTEMS DE MEXICO S.A. DE C.V','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 20:25:25','2013-11-15 20:25:25','cisco.jpg','image/jpeg',165324,'2013-11-15 20:25:24'),(2,'D-LINK','7y0','D-LINK MEXICANA, S.A. DE C.V.','N/A','Expositor','N/A','9 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 20:26:48','2013-11-15 20:26:48','logo_pagina.jpg','image/jpeg',19278,'2013-11-15 20:26:48'),(3,'HUAWEI','4fy','HUAWEI TECHNOLOGIES DE MEXICO S.A. DE C.V.','Alejandro Garza','Expositor','N/A','6 X 6','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 20:28:43','2013-11-21 18:35:45','huawei.jpg','image/jpeg',7574,'2013-11-15 20:28:42'),(4,'MICROSOFT','f96','MICROSOFT MEXICO, S.A. DE C.V.','Salvador Cors','Expositor','N/A','9 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 20:29:40','2013-11-21 18:25:23','microsoft.jpg','image/jpeg',5619,'2013-11-15 20:29:40'),(5,'SYSCOM','eve','SISTEMAS Y SERVICIOS DE COMUNICACION S.A. DE C.V. ','Jorge Saad','Expositor','N/A','9 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 20:30:32','2013-11-21 18:28:50','syscom.jpg','image/jpeg',5867,'2013-11-15 20:30:31'),(6,'TECHDATA','zpg','TECHDATA DE MEXICO S. DE R.L. DE C.V.','Alberto Monroy','Expositor','N/A','6 x 6','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 20:33:10','2013-11-21 18:29:38','Tech-Data-RGB.jpg','image/jpeg',31235,'2013-11-15 20:33:10'),(7,'TOSHIBA','7k2','TOSHIBA DE MEXICO S.A. DE C.V.','Carlos Canales','Expositor','N/A','6 X 6','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 21:03:01','2013-11-21 18:31:11','toshiba.jpg','image/jpeg',7385,'2013-11-15 21:03:01'),(8,'ANADIC','3sd','ANADIC','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 21:03:49','2013-11-21 18:24:07','anadiclogo.jpg','image/jpeg',29705,'2013-11-15 21:03:49'),(9,'BENQ','u3f','BENQ MEXICO, S. DE R.L. DE C.V.','Israel Bedolla','Expositor','N/A','9 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 21:05:34','2013-11-21 18:34:12','benq.jpg','image/jpeg',4732,'2013-11-15 21:05:34'),(10,'BOXLIGHT','z3c','BOXLIGHT LATINOAMERICA, SA de CV','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 21:07:02','2013-11-15 21:07:02','box.jpg','image/jpeg',4966,'2013-11-15 21:07:01'),(11,'COMERCIALIZADORA DE VALOR AGREGADO','9en','COMERCIALIZADORA DE VALOR AGREGADO, S.A. DE C.V.','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 21:08:18','2013-11-15 21:08:18',NULL,NULL,NULL,NULL),(12,'CT','9gw','CT INTERNACIONAL DEL NOROESTE S.A. DE C.V.','N/A','Expositor','N/A','9 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 21:12:34','2013-11-15 21:12:34','ctlogo.PNG','image/png',7283,'2013-11-15 21:12:34'),(13,'EDUVISION','szf','EDUVISION','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-11-15 21:14:16','2013-11-15 21:14:16',NULL,NULL,NULL,NULL),(14,'GRUPO LOMA DEL NORTE','nh5','GRUPO LOMA DEL NORTE S.A. DE C.V.','Fernando Gonzalez','Expositor','N/A','3 X 3','614 - 238 - 23 - 11','fgonzalez@gloma.com.mx','Quintas del Rio','3211','Nombre de Dios',48104,'gloma.com.mx','@gloma',2,'2013-11-15 21:15:50','2014-01-30 22:41:17','logo2-1.png','image/png',27178,'2014-01-30 22:41:16'),(15,'IMAGEN TI','ja8','IMAGEN TI, S.A. DE C.V.','Luis Díaz','Expositor','N/A','6 x 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:18:53','2013-11-21 18:35:10',NULL,NULL,NULL,NULL),(16,'INTCOMEX','pe4','INTCOMEX','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:21:25','2013-11-21 18:23:14',NULL,NULL,NULL,NULL),(17,'KEEP MOVING','jcc','KEEP MOVING','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:22:55','2013-11-15 21:22:55',NULL,NULL,NULL,NULL),(18,'MY BUSINESS POS','7rm','MY BUSINESS POS','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:23:30','2013-11-15 21:23:30',NULL,NULL,NULL,NULL),(19,'OKIDATA','b8v','OKIDATA DE MEXICO, S.A. DE C.V.','N/A','Expositor','N/A','6 x 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:24:20','2013-11-15 21:24:20',NULL,NULL,NULL,NULL),(20,'RIZZO COMERCIAL','sfp','RIZZO COMERCIAL, S.A.DE C.V.','N/A','Expositor','N/A','6 x 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:25:07','2013-11-15 21:25:07',NULL,NULL,NULL,NULL),(21,' SWAN','0g0','SERVICIOS INTEGRALES HERES, SA de CV','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:28:13','2013-11-15 21:28:13',NULL,NULL,NULL,NULL),(22,'SIAC','c0c','SIAC','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:30:59','2013-11-15 21:30:59',NULL,NULL,NULL,NULL),(23,'SMPG','u0j','SMPG','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:32:23','2013-11-15 21:32:23',NULL,NULL,NULL,NULL),(24,'VORAGO','h0t','VORAGO','N/A','Expositor','N/A','3 X 3','N/A','N/A',NULL,NULL,NULL,NULL,NULL,NULL,2,'2013-11-15 21:32:58','2013-11-15 21:32:58',NULL,NULL,NULL,NULL),(25,'EMOBILE','ask','INNOVACIÓN Y CONSULTORIA MÓVIL S.C,','Juan Torres','Expositor','N/A','3 X 3','N/A','jtorres@emobile.com.mx','','','',0,'','',2,'2013-11-15 23:44:58','2014-02-12 17:56:10','emobile-logo.png','image/png',3429,'2014-02-12 17:56:09'),(26,'KINGSTON','m4l','KINGSTON','Oscar Martínez','N/A','N/A','N/A','N/A','soporte@kingston.com','','','',41342,'','',2,'2013-11-21 18:38:12','2014-02-12 17:55:36','Kingston-Logo.jpg','image/jpeg',21015,'2014-02-12 17:55:34'),(27,'Alfa Centauro','3pj','Alfa Centauro','Roberto Gonzalez','Expositor','','','614 241 44 05','rgonzalez@alfa.com.mx','Acueducto','914','Gustavo A Madero',32144,'alfa.com.mx','@alfacentauro',3,'2014-02-04 18:22:46','2014-02-07 18:26:47','logo_alfacentauro.jpeg','image/jpeg',4393,'2014-02-07 18:26:46'),(28,'Amero Forex','ctm','Amero Forex','Saul Gamboa','Expositor','','','614 948 34 01','sgamboa@amero.com.mx','Lesina ','119','Lomas de la Estrella',44215,'ameroforex.com.mx','@amerofx',3,'2014-02-04 18:25:43','2014-02-07 18:23:15','logo_amero.jpeg','image/jpeg',5185,'2014-02-07 18:23:15'),(29,'Asesores Financieros Especializados','s5q','Asesores Financieros Especializados','Jorge Nevarez','Director Ejecutivo','','','421 553 40 14','jnevares@asef.com','Calzada de Tlalpan','5821','Huipulco',14240,'asef.com','@asef',3,'2014-02-04 18:28:03','2014-02-07 18:22:48','logo_asesores.jpeg','image/jpeg',6080,'2014-02-07 18:22:48'),(30,'Asofin','ckl','Asofin','Amanda Velasquez','Agente de Ventas','','','555 942 20 14','avelasquez@asofin.com','Benjamin Franklin','47','Condesa',41004,'asofin.com','@asofin',3,'2014-02-04 18:32:42','2014-02-07 18:22:21','logo_asofin.jpeg','image/jpeg',6753,'2014-02-07 18:22:20'),(31,'BanPro','jh1','BanPro','Alberto Perez','Agente de Ventas','','','614 029 48 21','aperez@banpro.com.mx','Dolores ','38','Cuauhtemoc',48140,'banpro.com.mx','@banpro',3,'2014-02-04 18:35:08','2014-02-07 18:21:35','logo_banpro.jpeg','image/jpeg',4852,'2014-02-07 18:21:34'),(32,'Finanzas para todos','t3d','Finanzas para todos','Fernando Lerma','C E O','','','442 749 01 88','flerma@ftodos.com','Ave. Vallarta','949','Burocrata',40031,'ftodos.com.mx','@ftodos',3,'2014-02-04 18:37:49','2014-02-07 18:21:10','logo_finanazas_para_todos.jpeg','image/jpeg',3994,'2014-02-07 18:21:09'),(33,'Finco ','qbm','Finco','Ramon Fernandez','Expositor','','','614 910 88 28','rfernandez@finco.com','Calle Guadalupe Victoria','481','Benito Juarez',10399,'finco.com','@finco',3,'2014-02-04 18:52:50','2014-02-07 18:20:39','logo_finco.jpeg','image/jpeg',9686,'2014-02-07 18:20:39'),(34,'Ministerio de Finanzas','r94','Ministerio de Finanzas','Mario Ramirez','Expositor','','','555 012 88 41','mramirez@mfinanzas.com.mx','Calle Arenal','36','Alvaro Obregon',49303,'mfinanzas.com.mx','@mfinanza',3,'2014-02-04 18:55:26','2014-02-07 18:20:14','logo_ministerio_de_finanzas.jpeg','image/jpeg',3477,'2014-02-07 18:20:13'),(35,'PROFECO','g0e','Procuradoria Federal del Consumidor','Ana Garcia','Expositor','','','555 890 01 74','agarcia@profeco.com.mx','Calle Orizaba','402','Roma Norte',42012,'profeco.com.mx','@profeco',3,'2014-02-04 18:58:40','2014-02-07 18:19:36','logo_profeco.jpeg','image/jpeg',6541,'2014-02-07 18:19:36'),(36,'Secretaría de Finanzas y Administración','yg4','Secretaría de Finanzas y Administración','Cesar Palma','Expositor','','','614 991 84 12','licpalma@secfinadm.com','Calle Puebla','322','Roma',49100,'secfinadm.com','@secfinadm',3,'2014-02-04 19:01:11','2014-02-07 18:18:33','logo_secretaria_de_finanzas.jpeg','image/jpeg',7883,'2014-02-07 18:18:32'),(37,'Solar','9fw','Solar Ahorro y Finanzas','Francisco Meraz','Director','','','321 441 03 19','fmeraz@solar.com.mx','Ave Abraham Gonzalez','140','Centro',49921,'solar.com','@solar',3,'2014-02-04 19:03:54','2014-02-07 18:17:56','logo_solar_ahorros.jpeg','image/jpeg',4058,'2014-02-07 18:17:55');
/*!40000 ALTER TABLE `exhibitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expositions`
--

DROP TABLE IF EXISTS `expositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expositions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `observations` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expositions_event_id_fk` (`event_id`),
  CONSTRAINT `expositions_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expositions`
--

LOCK TABLES `expositions` WRITE;
/*!40000 ALTER TABLE `expositions` DISABLE KEYS */;
INSERT INTO `expositions` VALUES (1,'Exposición General','Salón Galactic','Para TODOS los grupos','2013-11-25 09:00:00','2013-11-25 15:00:00',1,'2013-11-15 01:04:18','2013-11-15 01:05:50'),(2,'Exposición General','Salón Galactic','Para TODOS los grupos','2013-11-26 09:00:00','2013-11-26 15:00:00',2,'2013-11-15 01:05:28','2013-11-15 01:05:28'),(3,'Exposición Principal','Sala Principal','Más de 50 expositores de todo el país','2014-02-04 09:30:00','2014-02-04 14:00:00',3,'2014-02-04 18:10:39','2014-02-04 18:10:39');
/*!40000 ALTER TABLE `expositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `face_to_faces`
--

DROP TABLE IF EXISTS `face_to_faces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `face_to_faces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendee_id` int(11) NOT NULL,
  `int_contact` varchar(255) NOT NULL,
  `int_job` varchar(255) NOT NULL,
  `int_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `face_to_faces_attendee_id_fk` (`attendee_id`),
  KEY `face_to_faces_event_id_fk` (`event_id`),
  CONSTRAINT `face_to_faces_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `face_to_faces_attendee_id_fk` FOREIGN KEY (`attendee_id`) REFERENCES `attendees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `face_to_faces`
--

LOCK TABLES `face_to_faces` WRITE;
/*!40000 ALTER TABLE `face_to_faces` DISABLE KEYS */;
INSERT INTO `face_to_faces` VALUES (1,4,'Gilberto Sánchez','Ventas','ASPEL','Entrevista','2014-01-01 17:00:00','2014-01-01 18:00:00',2,'2014-01-30 19:29:44','2014-01-30 19:29:44'),(2,5,'Juan Hernandez','Director Ejecutivo','Fujitsu','Entrevista','2014-02-12 10:53:00','2014-02-12 11:53:00',3,'2014-02-12 17:53:16','2014-02-12 20:26:01'),(3,1,'N/A','Expositor',' SWAN','Cita','2014-02-12 12:32:00','2014-02-12 13:32:00',2,'2014-02-12 19:32:07','2014-02-12 19:32:07'),(4,1,'Gilberto Sánchez','Ventas','ASPEL','Cita','2014-02-13 12:35:00','2014-02-13 13:35:00',2,'2014-02-12 19:36:02','2014-02-12 19:36:02');
/*!40000 ALTER TABLE `face_to_faces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_event_id_fk` (`event_id`),
  CONSTRAINT `groups_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Grupo 1',1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(2,'Grupo 2',2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(3,'prueba',2,'2013-11-20 07:17:56','2013-11-20 07:17:56'),(4,'Main group',2,'2014-02-04 17:57:43','2014-02-04 17:57:43'),(5,'Grupo uno',3,'2014-02-04 21:53:16','2014-02-04 21:53:16'),(6,'Main group',3,'2014-02-07 19:22:01','2014-02-07 19:22:01');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hours`
--

DROP TABLE IF EXISTS `hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hours_event_id_fk` (`event_id`),
  CONSTRAINT `hours_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hours`
--

LOCK TABLES `hours` WRITE;
/*!40000 ALTER TABLE `hours` DISABLE KEYS */;
INSERT INTO `hours` VALUES (1,'2014-01-01 11:00:00','2014-01-01 12:00:00',2,'2014-01-30 18:52:04','2014-01-30 18:52:04'),(2,'2014-01-01 12:00:00','2014-01-01 13:00:00',2,'2014-01-30 18:53:02','2014-01-30 18:53:02'),(3,'2014-02-01 10:00:00','2014-02-01 11:00:00',2,'2014-01-30 22:45:59','2014-01-30 22:45:59'),(4,'2014-02-12 10:00:00','2014-02-12 11:00:00',3,'2014-02-12 17:47:03','2014-02-12 17:47:03'),(5,'2014-02-12 12:00:00','2014-02-12 13:00:00',3,'2014-02-12 17:50:47','2014-02-12 17:50:47'),(11,'2014-02-13 15:37:00','2014-02-13 16:37:00',3,'2014-02-12 22:38:17','2014-02-12 22:38:17');
/*!40000 ALTER TABLE `hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_templates`
--

DROP TABLE IF EXISTS `mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_templates_event_id_fk` (`event_id`),
  CONSTRAINT `mail_templates_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_templates`
--

LOCK TABLES `mail_templates` WRITE;
/*!40000 ALTER TABLE `mail_templates` DISABLE KEYS */;
INSERT INTO `mail_templates` VALUES (1,'acknowledgment_template','<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tbody><tr>\r\n    <td align=\"center\" valign=\"top\" bgcolor=\"#797979\" style=\"background-color:#797979;\"><br>\r\n      <br>\r\n      <table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody><tr>\r\n          <td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#2a2a2a\" style=\"background-color:#2a2a2a; padding:10px;\">\r\n\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:30px; font-weight: bold;\">ExpoMobile</p>\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:18px;\"><span style=\"font-weight: bold;\">Gracias&nbsp;</span>&lt;%= @attendee.a_name %&gt;</p>\r\n          </td>\r\n\r\n        </tr>\r\n        <tr>\r\n          <td width=\"201\" align=\"center\" valign=\"top\" style=\"padding:12px; background-color:#ffffff;\" bgcolor=\"#ffffff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Visitanos</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:16px; color:#08298A;\"><a href=\"http://www.emobile.com.mx/mx/\" style=\"color:#08298A; text-decoration:underline;\">www.emobile.com.mx</a><br>\r\n\r\n            </td></tr></tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\">\r\n                  <div style=\"color:#2E2E2E; font-size:19px;\"><b>Con ExpoMobile disfruta de:</b><br>\r\n                  </div>\r\n                  <div style=\"color:#000000;\"> \r\n                    <ul type=\"disk\">\r\n                      <li> Información sobre tu horario.\r\n                      </li><li> Agenda de todos los eventos. \r\n                      </li><li> Registra tu visita a todas las exposiciones y talleres desde tu móvil.\r\n                      </li><li> Información sobre patrocinadores y ofertas\r\n                      </li><li> Y mucho más... \r\n                    </li></ul>\r\n                  </div> </td>\r\n              </tr>\r\n            </tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/descarga.jpg\" width=\"150\" height=\"110\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/logoexpo.png\" width=\"150\" height=\"105\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Siguenos en</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                    <tbody><tr>\r\n                      <td width=\"33%\" align=\"left\" valign=\"middle\"><a href=\"https://twitter.com/eMobile_MI\"><img src=\"http://expomobile.com.mx/assets/tweet48.png\" width=\"48\" height=\"48\"></a><a href=\"https://www.facebook.com/eMobileMobilizingIdeas\"><img src=\"http://expomobile.com.mx/assets/face48.png\" width=\"48\" height=\"48\"></a></td>\r\n\r\n                    </tr>\r\n\r\n                  </tbody></table></td>\r\n              </tr>\r\n            </tbody></table></td>\r\n          <td align=\"left\" valign=\"top\" style=\"background-color:#e4e4e4; padding:10px;\" bgcolor=\"#e4e4e4;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; color:#6e6e6e;\">\r\n                  <div style=\"font-size:35px; font-family:Freestyle Script, Geneva, sans-serif;\"><b>Movilidad para su evento... </b></div>\r\n                  <div style=\"font-size:15px;\"><b></b></div>\r\n                  <p></p>\r\n                  <div style=\"font-size:24px; \"><b>Bienvenido </b></div>\r\n                  <div style=\"font-size:14px;\"><br>\r\n                    <b>eMobile te dá la bienvenida, administra tu congreso Anadic desde tu celular</b></div>\r\n                  <div><br>\r\n                    <img src=\"http://expomobile.com.mx/assets/iphoneexpo.png\" width=\"349\" height=\"161\" style=\"display:block;\"></div>\r\n                  <div style=\"font-size:13px;\"><br>Si eres usuario de Android (versiones posteriores a 2.3) te sugerimos descargues y obtengas nuestra aplicación móvil del siguiente enlace, para que tu participación en el evento sea mas cómoda y dinámica.\r\n                    <br>\r\n                    <br>\r\n                    <br>\r\n                  </div>\r\n                  <div style=\"font-size:16px; color:#045FB4;\"><b>Importante: Si ya obtuviste la aplicación previamente es importante la actualices</b></div>\r\n                  <div style=\"font-size:11px;\"><br>\r\n                    <a href=\"https://play.google.com/store/apps/details?id=mx.com.emobile.expomobile\" style=\"color:#000; text-decoration:underline; font-size: 16px;\"><br>Click aqui para obtener ExpoMobile<br></a> <br>\r\n                    <br>\r\n                  </div>\r\n\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n\r\n                  <div style=\"font-size:16px; color:#886A08;\"><b>Próximamente versión iOS...</b></div>\r\n\r\n                </td>\r\n              </tr>\r\n            </tbody></table></td>\r\n        </tr>\r\n      </tbody></table>\r\n      <br>\r\n      <br></td>\r\n  </tr>\r\n</tbody></table>',2,'2013-12-21 19:38:18','2013-12-21 20:49:11'),(2,'invitation_template','<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tbody><tr>\r\n    <td align=\"center\" valign=\"top\" bgcolor=\"#797979\" style=\"background-color:#797979;\"><br>\r\n      <br>\r\n      <table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody><tr>\r\n          <td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#2a2a2a\" style=\"background-color:#2a2a2a; padding:10px;\">\r\n\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:30px; font-weight: bold;\">ExpoMobile</p>\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:18px;\">Hola &lt;%= @attendee.a_name %&gt;</p><p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:18px;\">Te invitamos a probar la nueva versión de nuestra aplicación</p>\r\n          </td>\r\n\r\n        </tr>\r\n        <tr>\r\n          <td width=\"201\" align=\"center\" valign=\"top\" style=\"padding:12px; background-color:#ffffff;\" bgcolor=\"#ffffff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Visitanos</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:16px; color:#08298A;\"><a href=\"http://www.emobile.com.mx/mx/\" style=\"color:#08298A; text-decoration:underline;\">www.emobile.com.mx</a><br>\r\n\r\n            </td></tr></tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\">\r\n                  <div style=\"color:#2E2E2E; font-size:19px;\"><b>Con ExpoMobile disfruta de:</b><br>\r\n                  </div>\r\n                  <div style=\"color:#000000;\"> \r\n                    <ul type=\"disk\">\r\n                      <li> Información sobre tu horario.\r\n                      </li><li> Agenda de todos los eventos. \r\n                      </li><li> Registra tu visita a todas las exposiciones y talleres desde tu móvil.\r\n                      </li><li> Información sobre patrocinadores y ofertas\r\n                      </li><li> Y mucho más... \r\n                    </li></ul>\r\n                  </div> </td>\r\n              </tr>\r\n            </tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/descarga.jpg\" width=\"150\" height=\"110\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/logoexpo.png\" width=\"150\" height=\"105\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Siguenos en</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                    <tbody><tr>\r\n                      <td width=\"33%\" align=\"left\" valign=\"middle\"><a href=\"https://twitter.com/eMobile_MI\"><img src=\"http://expomobile.com.mx/assets/tweet48.png\" width=\"48\" height=\"48\"></a><a href=\"https://www.facebook.com/eMobileMobilizingIdeas\"><img src=\"http://expomobile.com.mx/assets/face48.png\" width=\"48\" height=\"48\"></a></td>\r\n\r\n                    </tr>\r\n\r\n                  </tbody></table></td>\r\n              </tr>\r\n            </tbody></table></td>\r\n          <td align=\"left\" valign=\"top\" style=\"background-color:#e4e4e4; padding:10px;\" bgcolor=\"#e4e4e4;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; color:#6e6e6e;\">\r\n                  <div style=\"font-size:35px; font-family:Freestyle Script, Geneva, sans-serif;\"><b>Movilidad para su evento... </b></div>\r\n                  <div style=\"font-size:15px;\"><b></b></div>\r\n                  <p></p>\r\n                  <div style=\"font-size:24px; \"><b>Bienvenido </b></div>\r\n                  <div style=\"font-size:14px;\"><br>\r\n                    <b>eMobile te dá la bienvenida, administra tu congreso Anadic desde tu celular</b></div>\r\n                  <div><br>\r\n                    <img src=\"http://expomobile.com.mx/assets/iphoneexpo.png\" width=\"349\" height=\"161\" style=\"display:block;\"></div>\r\n                  <div style=\"font-size:13px;\"><br>Si eres usuario de Android (versiones posteriores a 2.3) te sugerimos descargues y obtengas nuestra aplicación móvil del siguiente enlace, para que tu participación en el evento sea mas cómoda y dinámica.\r\n                    <br>\r\n                    <br>\r\n                    <br>\r\n                  </div>\r\n                  <div style=\"font-size:16px; color:#045FB4;\"><b>Importante: Si ya obtuviste la aplicación previamente es importante la actualices</b></div>\r\n                  <div style=\"font-size:11px;\"><br>\r\n                    <a href=\"https://play.google.com/store/apps/details?id=mx.com.emobile.expomobile\" style=\"color:#000; text-decoration:underline; font-size: 16px;\"><br>Click aqui para obtener ExpoMobile<br></a> <br>\r\n                    <br>\r\n                  </div>\r\n\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p><img src=\"http://upload.wikimedia.org/wikipedia/commons/5/5d/Available_on_the_App_Store_(black).png\" height=\"64\"></p>\r\n                  <p><img src=\"http://androverge.com/wp-content/uploads/2013/08/play_store_logo.png\" height=\"64\"></p>\r\n\r\n                  <div style=\"font-size:16px; color:#886A08;\"><img></div>\r\n\r\n                </td>\r\n              </tr>\r\n            </tbody></table></td>\r\n        </tr>\r\n      </tbody></table>\r\n      <br>\r\n      <br></td>\r\n  </tr>\r\n</tbody></table>',2,'2013-12-21 19:38:18','2013-12-24 02:51:00'),(3,'general_template','<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tbody><tr>\r\n    <td align=\"center\" valign=\"top\" bgcolor=\"#797979\" style=\"background-color:#797979;\"><br>\r\n      <br>\r\n      <table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody><tr>\r\n          <td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#2a2a2a\" style=\"background-color:#2a2a2a; padding:10px;\">\r\n\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:30px; font-weight: bold;\">ExpoMobile</p>\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:18px;\"><span style=\"font-weight: bold;\">Informe General</span></p><p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:18px;\">Hola &lt;%= @attendee.a_name %&gt;</p>\r\n          </td>\r\n\r\n        </tr>\r\n        <tr>\r\n          <td width=\"201\" align=\"center\" valign=\"top\" style=\"padding:12px; background-color:#ffffff;\" bgcolor=\"#ffffff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Visitanos</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:16px; color:#08298A;\"><a href=\"http://www.emobile.com.mx/mx/\" style=\"color:#08298A; text-decoration:underline;\">www.emobile.com.mx</a><br>\r\n\r\n            </td></tr></tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\">\r\n                  <div style=\"color:#2E2E2E; font-size:19px;\"><b>Con ExpoMobile disfruta de:</b><br>\r\n                  </div>\r\n                  <div style=\"color:#000000;\"> \r\n                    <ul type=\"disk\">\r\n                      <li> Información sobre tu horario.\r\n                      </li><li> Agenda de todos los eventos. \r\n                      </li><li> Registra tu visita a todas las exposiciones y talleres desde tu móvil.\r\n                      </li><li> Información sobre patrocinadores y ofertas\r\n                      </li><li> Y mucho más... \r\n                    </li></ul>\r\n                  </div> </td>\r\n              </tr>\r\n            </tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/descarga.jpg\" width=\"150\" height=\"110\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/logoexpo.png\" width=\"150\" height=\"105\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Siguenos en</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                    <tbody><tr>\r\n                      <td width=\"33%\" align=\"left\" valign=\"middle\"><a href=\"https://twitter.com/eMobile_MI\"><img src=\"http://expomobile.com.mx/assets/tweet48.png\" width=\"48\" height=\"48\"></a><a href=\"https://www.facebook.com/eMobileMobilizingIdeas\"><img src=\"http://expomobile.com.mx/assets/face48.png\" width=\"48\" height=\"48\"></a></td>\r\n\r\n                    </tr>\r\n\r\n                  </tbody></table></td>\r\n              </tr>\r\n            </tbody></table></td>\r\n          <td align=\"left\" valign=\"top\" style=\"background-color:#e4e4e4; padding:10px;\" bgcolor=\"#e4e4e4;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; color:#6e6e6e;\">\r\n                  <div style=\"font-size:35px; font-family:Freestyle Script, Geneva, sans-serif;\"><b>Movilidad para su evento... </b></div>\r\n                  <div style=\"font-size:15px;\"><b></b></div>\r\n                  <p></p>\r\n                  <div style=\"font-size:24px; \"><b>Bienvenido </b></div>\r\n                  <div style=\"font-size:14px;\"><br>\r\n                    <b>eMobile te dá la bienvenida, administra tu congreso Anadic desde tu celular</b></div>\r\n                  <div><br>\r\n                    <img src=\"http://expomobile.com.mx/assets/iphoneexpo.png\" width=\"349\" height=\"161\" style=\"display:block;\"></div>\r\n                  <div style=\"font-size:13px;\"><br>Si eres usuario de Android (versiones posteriores a 2.3) te sugerimos descargues y obtengas nuestra aplicación móvil del siguiente enlace, para que tu participación en el evento sea mas cómoda y dinámica.\r\n                    <br>\r\n                    <br>\r\n                    <br>\r\n                  </div>\r\n                  <div style=\"font-size:16px; color:#045FB4;\"><b>Importante: Si ya obtuviste la aplicación previamente es importante la actualices</b></div>\r\n                  <div style=\"font-size:11px;\"><br>\r\n                    <a href=\"https://play.google.com/store/apps/details?id=mx.com.emobile.expomobile\" style=\"color:#000; text-decoration:underline; font-size: 16px;\"><br>Click aqui para obtener ExpoMobile<br></a> <br>\r\n                    <br>\r\n                  </div>\r\n\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n\r\n                  <div style=\"font-size:16px; color:#886A08;\"><b>Próximamente versión iOS...</b></div>\r\n\r\n                </td>\r\n              </tr>\r\n            </tbody></table></td>\r\n        </tr>\r\n      </tbody></table>\r\n      <br>\r\n      <br></td>\r\n  </tr>\r\n</tbody></table>',2,'2013-12-21 19:38:18','2013-12-21 21:02:07'),(4,'welcome_template','<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tbody><tr>\r\n    <td align=\"center\" valign=\"top\" bgcolor=\"#797979\" style=\"background-color:#797979;\"><br>\r\n      <br>\r\n      <table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n        <tbody><tr>\r\n          <td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#2a2a2a\" style=\"background-color:#2a2a2a; padding:10px;\">\r\n\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:30px; font-weight: bold;\">ExpoMobile</p>\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:18px;\"><b>Bienvenido&nbsp;</b>&lt;%= @attendee.a_name %&gt;</p>\r\n            <p style=\"font-family:Arial, \'Arial Narrow\', Times, serif; color:#F2F2F2; font-size:18px; font-style: italic;\">Tu ID de registro es: &lt;%= @attendee.attendee_id %&gt;</p>\r\n          </td>\r\n\r\n        </tr>\r\n        <tr>\r\n          <td width=\"201\" align=\"center\" valign=\"top\" style=\"padding:12px; background-color:#ffffff;\" bgcolor=\"#ffffff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Visitanos</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:16px; color:#08298A;\"><a href=\"http://www.emobile.com.mx/mx/\" style=\"color:#08298A; text-decoration:underline;\">www.emobile.com.mx</a><br>\r\n\r\n            </td></tr></tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\">\r\n                  <div style=\"color:#2E2E2E; font-size:19px;\"><b>Con ExpoMobile disfruta de:</b><br>\r\n                  </div>\r\n                  <div style=\"color:#000000;\"> \r\n                    <ul type=\"disk\">\r\n                      <li> Información sobre tu horario.\r\n                      </li><li> Agenda de todos los eventos. \r\n                      </li><li> Registra tu visita a todas las exposiciones y talleres desde tu móvil.\r\n                      </li><li> Información sobre patrocinadores y ofertas\r\n                      </li><li> Y mucho más... \r\n                    </li></ul>\r\n                  </div> </td>\r\n              </tr>\r\n            </tbody></table>\r\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"4\" style=\"margin-bottom:20px;\">\r\n\r\n              <tbody><tr>\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/descarga.jpg\" width=\"150\" height=\"110\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td width=\"100%\" align=\"middle\" valign=\"middle\"><img src=\"http://expomobile.com.mx/assets/logoexpo.png\" width=\"150\" height=\"105\"></td>\r\n\r\n\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:14px; color:#000000;\"><b>Siguenos en</b></td>\r\n              </tr>\r\n              <tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#000000;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                    <tbody><tr>\r\n                      <td width=\"33%\" align=\"left\" valign=\"middle\"><a href=\"https://twitter.com/eMobile_MI\"><img src=\"http://expomobile.com.mx/assets/tweet48.png\" width=\"48\" height=\"48\"></a><a href=\"https://www.facebook.com/eMobileMobilizingIdeas\"><img src=\"http://expomobile.com.mx/assets/face48.png\" width=\"48\" height=\"48\"></a></td>\r\n\r\n                    </tr>\r\n\r\n                  </tbody></table></td>\r\n              </tr>\r\n            </tbody></table></td>\r\n          <td align=\"left\" valign=\"top\" style=\"background-color:#e4e4e4; padding:10px;\" bgcolor=\"#e4e4e4;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n              <tbody><tr>\r\n                <td align=\"left\" valign=\"top\" style=\"font-family:Verdana, Geneva, sans-serif; color:#6e6e6e;\">\r\n                  <div style=\"font-size:35px; font-family:Freestyle Script, Geneva, sans-serif;\"><b>Movilidad para su evento... </b></div>\r\n                  <div style=\"font-size:15px;\"><b></b></div>\r\n                  <p></p>\r\n                  <div style=\"font-size:24px; \"><b>Bienvenido </b></div>\r\n                  <div style=\"font-size:14px;\"><br>\r\n                    <b>eMobile te dá la bienvenida, administra tu congreso Anadic desde tu celular</b></div>\r\n                  <div><br>\r\n                    <img src=\"http://expomobile.com.mx/assets/iphoneexpo.png\" width=\"349\" height=\"161\" style=\"display:block;\"></div>\r\n                  <div style=\"font-size:13px;\"><br>Si eres usuario de Android (versiones posteriores a 2.3) te sugerimos descargues y obtengas nuestra aplicación móvil del siguiente enlace, para que tu participación en el evento sea mas cómoda y dinámica.\r\n                    <br>\r\n                    <br>\r\n                    <br>\r\n                  </div>\r\n                  <div style=\"font-size:16px; color:#045FB4;\"><b>Importante: Si ya obtuviste la aplicación previamente es importante la actualices</b></div>\r\n                  <div style=\"font-size:11px;\"><br>\r\n                    <a href=\"https://play.google.com/store/apps/details?id=mx.com.emobile.expomobile\" style=\"color:#000; text-decoration:underline; font-size: 16px;\"><br>Click aqui para obtener ExpoMobile<br></a> <br>\r\n                    <br>\r\n                  </div>\r\n\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n                  <p></p>\r\n\r\n                  <div style=\"font-size:16px; color:#886A08;\"><b>Próximamente versión iOS...</b></div>\r\n\r\n                </td>\r\n              </tr>\r\n            </tbody></table></td>\r\n        </tr>\r\n      </tbody></table>\r\n      <br>\r\n      <br></td>\r\n  </tr>\r\n</tbody></table>',2,'2013-12-21 19:38:18','2013-12-24 02:42:04'),(5,'acknowledgment_template','Empty',3,'2013-12-21 19:38:18','2013-12-24 02:42:04'),(6,'invitation_template','Empty',3,'2013-12-21 19:38:19','2013-12-24 02:42:05'),(7,'general_template','Empty',3,'2013-12-21 19:38:20','2013-12-24 02:42:06'),(8,'welcome_template','Empty',3,'2013-12-21 19:38:21','2013-12-24 02:42:07');
/*!40000 ALTER TABLE `mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `massive_loads`
--

DROP TABLE IF EXISTS `massive_loads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `massive_loads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `excel_file_file_name` varchar(255) DEFAULT NULL,
  `excel_file_content_type` varchar(255) DEFAULT NULL,
  `excel_file_file_size` int(11) DEFAULT NULL,
  `excel_file_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `massive_loads_event_id_fk` (`event_id`),
  CONSTRAINT `massive_loads_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `massive_loads`
--

LOCK TABLES `massive_loads` WRITE;
/*!40000 ALTER TABLE `massive_loads` DISABLE KEYS */;
/*!40000 ALTER TABLE `massive_loads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nips`
--

DROP TABLE IF EXISTS `nips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(255) NOT NULL,
  `sent` datetime DEFAULT NULL,
  `attendee_id` int(11) NOT NULL,
  `times_sent` int(11) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nips_attendee_id_fk` (`attendee_id`),
  KEY `nips_event_id_fk` (`event_id`),
  CONSTRAINT `nips_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `nips_attendee_id_fk` FOREIGN KEY (`attendee_id`) REFERENCES `attendees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nips`
--

LOCK TABLES `nips` WRITE;
/*!40000 ALTER TABLE `nips` DISABLE KEYS */;
INSERT INTO `nips` VALUES (1,'gs7c','2014-02-12 19:34:03',1,6,2,'2014-01-30 00:57:34','2014-02-12 19:34:03'),(2,'y7j9','2014-01-30 01:03:56',2,1,1,'2014-01-30 01:03:56','2014-01-30 01:03:56'),(3,'q3ny','2014-02-11 23:14:54',4,10,2,'2014-01-30 01:05:27','2014-02-11 23:14:54'),(4,'adah','2014-02-13 00:20:14',5,25,3,'2014-02-04 22:26:50','2014-02-13 00:20:14'),(5,'haer','2014-02-06 16:48:20',7,1,3,'2014-02-06 16:48:20','2014-02-06 16:48:20'),(6,'i8f8','2014-02-07 21:06:54',3,1,2,'2014-02-07 21:06:54','2014-02-07 21:06:54');
/*!40000 ALTER TABLE `nips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerts`
--

DROP TABLE IF EXISTS `offerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitor_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offerts_exhibitor_id_fk` (`exhibitor_id`),
  KEY `offerts_event_id_fk` (`event_id`),
  CONSTRAINT `offerts_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `offerts_exhibitor_id_fk` FOREIGN KEY (`exhibitor_id`) REFERENCES `exhibitors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerts`
--

LOCK TABLES `offerts` WRITE;
/*!40000 ALTER TABLE `offerts` DISABLE KEYS */;
INSERT INTO `offerts` VALUES (1,26,'Memorias USB 16 GB en $150',150.00,'2014-01-30 15:00:00','2014-01-30 16:00:00','Stand uno',2,'2014-01-30 22:53:27','2014-01-30 22:53:27'),(2,27,'20% de Descuento en Asesorías personalizadas para tu negocio',4999.00,'2014-02-04 09:00:00','2014-02-04 19:00:00','Stand 044',3,'2014-02-04 19:06:55','2014-02-04 19:06:55'),(3,31,'Abre una cuenta con nosotros hoy y entra a una rifa de premios de hasta 150,000',200.00,'2014-02-04 09:00:00','2014-02-04 14:00:00','Stand 015',3,'2014-02-04 19:08:58','2014-02-04 19:08:58'),(4,33,'10% en cualquiera de nuestros servicios, pregunta con uno de nuestros asesores.',8100.00,'2014-02-04 09:00:00','2014-02-04 19:00:00','Stand 003',3,'2014-02-04 19:10:52','2014-02-04 22:54:23');
/*!40000 ALTER TABLE `offerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_conferences`
--

DROP TABLE IF EXISTS `rate_conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_conferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_id` int(11) DEFAULT NULL,
  `attendee_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rate_conferences_on_conference_id` (`conference_id`),
  KEY `index_rate_conferences_on_attendee_id` (`attendee_id`),
  KEY `index_rate_conferences_on_event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_conferences`
--

LOCK TABLES `rate_conferences` WRITE;
/*!40000 ALTER TABLE `rate_conferences` DISABLE KEYS */;
INSERT INTO `rate_conferences` VALUES (1,4,1,2,1,'2014-01-29 18:18:33','2014-01-29 18:18:33'),(2,5,1,2,2,'2014-01-29 18:18:42','2014-01-29 18:18:42'),(3,6,1,2,4,'2014-01-29 18:18:47','2014-01-29 18:18:47'),(4,6,4,2,3,'2014-01-30 17:27:09','2014-01-30 17:27:09'),(5,4,4,2,2,'2014-01-30 17:49:08','2014-01-30 17:49:08'),(6,5,4,2,3,'2014-01-31 01:09:11','2014-01-31 01:09:11'),(7,7,5,3,3,'2014-02-04 22:36:39','2014-02-04 22:36:39'),(8,9,5,3,3,'2014-02-05 00:56:21','2014-02-05 00:56:21'),(9,11,5,3,2,'2014-02-07 21:14:21','2014-02-07 21:14:21');
/*!40000 ALTER TABLE `rate_conferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_workshops`
--

DROP TABLE IF EXISTS `rate_workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_workshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_id` int(11) DEFAULT NULL,
  `attendee_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rate_workshops_on_workshop_id` (`workshop_id`),
  KEY `index_rate_workshops_on_attendee_id` (`attendee_id`),
  KEY `index_rate_workshops_on_event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_workshops`
--

LOCK TABLES `rate_workshops` WRITE;
/*!40000 ALTER TABLE `rate_workshops` DISABLE KEYS */;
INSERT INTO `rate_workshops` VALUES (1,7,1,2,3,'2014-01-29 00:05:14','2014-01-29 00:14:36'),(2,8,1,2,4,'2014-01-29 17:46:41','2014-01-29 17:46:41'),(3,9,1,2,1,'2014-01-29 17:47:08','2014-01-29 17:47:08'),(4,4,1,2,4,'2014-01-30 00:59:01','2014-01-30 00:59:01'),(5,4,2,1,4,'2014-01-30 00:59:48','2014-01-30 00:59:48'),(6,4,4,2,4,'2014-01-30 01:07:07','2014-01-30 01:07:07'),(7,7,4,2,3,'2014-01-30 18:53:47','2014-01-30 18:53:47'),(8,10,4,2,1,'2014-01-30 18:54:17','2014-01-30 18:54:17');
/*!40000 ALTER TABLE `rate_workshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `comment` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,3,'\"muy recomendada\"','2014-02-04 22:40:12','2014-02-04 22:40:12'),(2,2,'\"com\"','2014-02-08 00:29:57','2014-02-08 00:29:57'),(3,3,'\"Hola Raul :D\"','2014-02-12 23:01:19','2014-02-12 23:01:19');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_super_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super administrator',0,1,'2013-11-14 01:28:40','2013-11-14 01:28:40'),(2,'Administrator',1,0,'2013-11-14 01:28:40','2013-11-14 01:28:40');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `room_key` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_event_id_fk` (`event_id`),
  CONSTRAINT `rooms_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Saturn 1','S1',1,'2013-11-15 01:08:05','2013-11-15 01:08:05'),(2,'Saturn 2','S2',1,'2013-11-15 01:08:27','2013-11-15 01:08:27'),(3,'Saturn 3','S3',1,'2013-11-15 01:08:40','2013-11-15 01:08:40'),(4,'Júpiter 1','J1',1,'2013-11-15 01:09:09','2013-11-15 01:09:09'),(5,'Júpiter 2','J2',1,'2013-11-15 01:09:25','2013-11-15 01:09:25'),(6,'Júpiter 3','J3',1,'2013-11-15 01:09:39','2013-11-15 01:09:39'),(7,'Júpiter 4','J4',2,'2013-11-15 01:09:49','2013-11-15 01:09:55'),(8,'Júpiter 5','J5',2,'2013-11-15 01:10:09','2013-11-15 01:10:09'),(9,'Júpiter 6','J6',2,'2013-11-15 01:10:27','2013-11-15 01:10:27'),(10,'Mars 1','M1',2,'2013-11-15 01:10:45','2013-11-15 01:10:45'),(11,'Mars 2','M2',2,'2013-11-15 01:10:53','2013-11-15 01:10:53'),(12,'Mars 3','M3',2,'2013-11-15 01:11:05','2013-11-15 01:11:05'),(13,'Sala B','SB',3,'2014-02-12 17:46:03','2014-02-12 17:46:03'),(14,'Sala A','SA',3,'2014-02-12 17:49:49','2014-02-12 17:49:49');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workshop_id` int(11) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `hour_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_workshop_id_fk` (`workshop_id`),
  KEY `schedules_subgroup_id_fk` (`subgroup_id`),
  KEY `schedules_hour_id_fk` (`hour_id`),
  CONSTRAINT `schedules_hour_id_fk` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`),
  CONSTRAINT `schedules_subgroup_id_fk` FOREIGN KEY (`subgroup_id`) REFERENCES `subgroups` (`id`),
  CONSTRAINT `schedules_workshop_id_fk` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,10,3,2,'2014-01-30 18:53:22','2014-01-30 18:53:22'),(2,7,3,3,'2014-01-30 22:46:17','2014-01-30 22:46:17'),(3,13,27,4,'2014-02-12 17:47:24','2014-02-12 17:47:24'),(4,14,27,5,'2014-02-12 17:52:03','2014-02-12 17:52:03');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130710214098'),('20130710214099'),('20130710214100'),('20130710214101'),('20130710214102'),('20130710214455'),('20130903235632'),('20130903235645'),('20130904211206'),('20130909213248'),('20130909215936'),('20130909215937'),('20130909220207'),('20130909220208'),('20130909220209'),('20130909220210'),('20130909220211'),('20130924230025'),('20130925225349'),('20130925225350'),('20131005002651'),('20131005002652'),('20131008234441'),('20131008234442'),('20131009212301'),('20131010000216'),('20131010000407'),('20131015003752'),('20131101021328'),('20131112202018'),('20131112202019'),('20131220205522'),('20140128221357'),('20140128221410'),('20140128221411');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `social_reason` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `work_street` varchar(255) DEFAULT NULL,
  `work_street_number` varchar(255) DEFAULT NULL,
  `work_colony` varchar(255) DEFAULT NULL,
  `work_zip` int(11) DEFAULT NULL,
  `web_page` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sponsors_event_id_fk` (`event_id`),
  CONSTRAINT `sponsors_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES (1,'CISCO','Oficina México, Distrito Federal','CISCO SYSTEMS DE MEXICO S.A. DE C.V','5267-1601','contacto@cisco.com','Ventas','Paseo de Tamarindos','400A, Piso 30','Bosques de las Lomas',5120,'http://www.cisco.com/web/MX/index.html','http://twitter.com/cisco_la',1,'2013-11-14 18:26:04','2013-11-15 19:32:32','cisco.jpg','image/jpeg',165324,'2013-11-15 19:32:31'),(2,'D-LINK','México, Distrito Federal','D-LINK MEXICANA, S.A. DE C.V.','(55) 5090 2700','serviciosmx@dlinkla.com','Soporte','Tuxpan','96','Roma Sur',6760,'http://www.dlinkla.com','',1,'2013-11-14 18:35:30','2013-11-15 20:13:16','logo_pagina.jpg','image/jpeg',19278,'2013-11-15 20:13:16'),(3,'MICROSOFT','Salvador Cors','MICROSOFT MEXICO, S.A. DE C.V.','+52 (55) 5267-2000','contacto@microsoft.com.mx','Soporte','Av. Vasco de Quiroga','1700 Piso 7','Centro de Ciudad Santa Fe',1210,'http://www.microsoft.com/es-mx/default.aspx','',1,'2013-11-14 18:48:08','2013-11-21 18:26:23','microsoft.jpg','image/jpeg',5619,'2013-11-15 20:10:07'),(4,'SYSCOM','Jorge Saad','SISTEMAS Y SERVICIOS DE COMUNICACION S.A. DE C.V. - SYSCOM','(614) 415-2525 ','ventas@syscom.com.mx','Ventas','Ave. 20 de Noviembre','805','Centro',31000,'http://www.syscom.mx/','https://twitter.com/syscomenlinea',1,'2013-11-14 18:54:31','2013-11-21 18:28:16','syscom.jpg','image/jpeg',5867,'2013-11-15 20:08:19'),(5,'TECHDATA','Alberto Monroy','TECHDATA DE MEXICO S. DE R.L. DE C.V.','53870176','alberto.monroy@techdata.com.mx','Director General','Siporex','2 Int.9-10','Fracc. Industrial Alce Blanco',53370,'http://www.techdata.com.mx/','',1,'2013-11-14 19:00:33','2013-11-15 20:05:47','Tech-Data-RGB.jpg','image/jpeg',31235,'2013-11-15 20:05:47'),(6,'TOSHIBA','Carlos Canales','TOSHIBA DE MEXICO S.A. DE C.V.','52496525 ó 01800 216 8699 ','ecommerce@toshiba.com.mx','Ventas','Sierra Candela','111','Miguel Hidalgo',11000,'http://www.toshiba.com.mx/','',2,'2013-11-14 19:07:04','2014-02-12 17:59:13','TOSHIBA-Won-t-Build-Enterprise-Hybrid-HDDs-2.jpg','image/jpeg',21539,'2014-02-12 17:59:13'),(7,'ASPEL','Gilberto Sánchez','ASPEL DE MEXICO S.A. DE C.V.','(55) 5325-2323','ventas@aspel.com.mx','Ventas','Cda. Suiza','17','San Jeronimo',104000,'http://www.aspel.com.mx/','https://twitter.com/Aspeldemexico',2,'2013-11-14 19:11:23','2014-02-12 17:59:01','aspel-sae.jpg','image/jpeg',5839,'2014-02-12 17:59:01'),(8,'B LINE','Omar Aburto','B LINE OMAR ABURTO','N/A','contacto@bline.com.mx','N/A','N/A','0','N/A',0,'N/A','',2,'2013-11-14 19:20:26','2014-02-12 17:58:46','b-line-L52744.gif','image/gif',3410,'2014-02-12 17:58:44'),(9,'INGRAM MICRO','Marisol Zamudio','INGRAM MICRO MEXICO S.A. DE C.V.','(01-55) 52-63-63-63','solucionesaclientes@ingrammicro.com.mx','Ventas','Laguna de Términos','249','Anáhuac',11320,'http://www.ingrammicro.com.mx/','https://twitter.com/IngrammicroMx',2,'2013-11-14 19:25:04','2014-02-12 17:57:47','Ingram-Micro-logo-300x300.jpg','image/jpeg',15304,'2014-02-12 17:57:46'),(10,'TRIPP-LITE','Juan Luis Tron','TRIPP-LITE DE MEXICO S. DE R. L.','+52(55)5001.5900','infomxventas@tripplite.com','N/A','Mariano Escobedo','510, Piso 2','Anzures',11590,'http://www.tripplite.com/es','http://twitter.com/TrippLiteLA',2,'2013-11-14 19:29:16','2014-02-12 17:57:20','tripplite_logo.jpg','image/jpeg',6628,'2014-02-12 17:57:19'),(11,'VORAGO','Jorge Melendez','VORAGO','01 800 7 VORAGO (01 800 7 867246)','atencion.clientes@voragolive.com','Expositor','Calle Cisne','No. 1307-A','Morelos',0,'http://voragolive.com/','https://twitter.com/voragolive',2,'2013-11-21 01:00:41','2014-02-12 17:56:42','vorago.png','image/png',30388,'2014-02-12 17:56:42'),(12,'Ingressio','Ramon Pereira','Ingressio','614 939 40 19','rpereira@ingressio.com','Expositor','Calle Hidalgo','535','Azcapotzalco',40391,'ingressio.com','@ingressio',3,'2014-02-04 20:20:46','2014-02-07 18:15:52','patro_ingressio.jpeg','image/jpeg',3704,'2014-02-07 18:15:52'),(13,'C I S C O','Cien Fuegos','C I S C O','614 951 03 13','contacto@cisco','Expositor','Ave Tecnologico','#5993','Zotitla',49391,'cisco.com.mx','ciscomx',3,'2014-02-04 20:27:11','2014-02-07 18:15:30','patro_cisco.jpg','image/jpeg',113980,'2014-02-07 18:15:30'),(14,'Comstor','Carlos Balderrama','Comstor','555 393 09 31','cbalderrama@comstor.com.mx','Expositor','Manzanillo ','#201','LindaVista Sur',94391,'Comstor','@comstor',3,'2014-02-04 20:29:51','2014-02-07 18:15:10','patro_comstor.png','image/png',18028,'2014-02-07 18:15:10'),(15,'Fireeye','Aldo Burciaga','Fireeye','555 033 19 30','aburciaga@fireeye.com.mx','Expositor','Ave Barcelona','#28','Cuauhtemoc',49931,'fireeye.com','@fireeye',3,'2014-02-04 20:32:19','2014-02-07 18:14:53','patro_fireeye.jpeg','image/jpeg',5620,'2014-02-07 18:14:52'),(16,'Fortinet','Luis Herrera','Fortinet','614 399 10 35','lherrera@fortinet.com','Expositor','Viena ','#241','Coyoacan',49300,'www.fortinet.com.mx','@fortinet',3,'2014-02-04 20:36:48','2014-02-07 18:14:22','patro_forniet.gif','image/gif',5310,'2014-02-07 18:14:21'),(17,'Fujitsu','Juan Hernandez','Fujitsu','614 530 39 10','jhernandez@fujistsu.com','Director Ejecutivo','Calle Elsa','#223','Centro',49391,'fujitsu.com.mx','@fujistu',3,'2014-02-04 20:45:19','2014-02-07 18:14:02','patro_fujistu.gif','image/gif',2737,'2014-02-07 18:14:01'),(18,'Huawei','Reyna Orozco','Huawei','555 809 29 11','rorozco@huawei.com.mx','Director Ejecutivo','Mier y Pesado','#2001','Col. Benito Juarez',49120,'www.huawei.com.mx','@huaweimx',3,'2014-02-04 20:49:07','2014-02-07 18:13:41','patro_huawei.jpeg','image/jpeg',7948,'2014-02-07 18:13:41'),(19,'Hubox','Alejandro Ballesteros','Hubox','555 022 82 11','aballesteros@hubox.com','Director Ejecutivo','Torres Elid','#491','Venustiano Carranza',49120,'www.hubox.com.mx','@hubox',3,'2014-02-04 20:51:36','2014-02-07 18:13:23','patro_hubox.png','image/png',5863,'2014-02-07 18:13:23'),(20,'Wacom','Isidro Mendoza','Wacom','555 013 93 11','imendoza@wacom.com','Director Ejecutivo','Leibinitz ','#439','Miguel Hidalgo',49911,'www.wacom.com.mx','@wacom',3,'2014-02-04 20:53:17','2014-02-07 18:15:03','patro_wacom.jpg','image/jpeg',84663,'2014-02-07 18:15:02'),(21,'WatchGuard','Efrain Nuñez','WatchGuard','539 90 11 94','enunez@watchguard.com','Director Ejecutivo','Calle Naranjo','#4914','Col. Cuauhtemoc',94930,'www.watchguard.com','@watchguard',3,'2014-02-04 20:56:49','2014-02-07 18:10:32','patro_watchguard.jpg','image/jpeg',11967,'2014-02-07 18:10:31');
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgroups`
--

DROP TABLE IF EXISTS `subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `leader` varchar(255) NOT NULL,
  `subgroup_key` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subgroups_group_id_fk` (`group_id`),
  KEY `subgroups_event_id_fk` (`event_id`),
  CONSTRAINT `subgroups_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `subgroups_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgroups`
--

LOCK TABLES `subgroups` WRITE;
/*!40000 ALTER TABLE `subgroups` DISABLE KEYS */;
INSERT INTO `subgroups` VALUES (1,'Francisco Villa','Sonia Rodríguez','FV',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(2,'Emiliano Zapata','Armando Rodarte','EZ',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(3,'Álvaro Obregón','Adriana Flores','AO',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(4,'Venustiano Carranza','Harim García','VC',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(5,'Francisco I Madero','Erik García','FI',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(6,'Porfirio Díaz','Ricardo Orellana','PD',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(7,'Eulalio Gutierrez','Gabriel Chávez','EG',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(8,'Pascual Orozco','Jaime Juárez','PO',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(9,'Victoriano Huerta','Juan M. Suárez','VH',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(10,'Manuel Mondragón','Joaquín Reyes','MM',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(11,'José Vasconcelos','Sonia Rodríguez','JV',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(12,'Ricardo Flores Magón','Armando Rodarte','RF',1,1,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(13,'Aquiles Serdán','Adriana Flores','AS',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(14,'José Ma Pino Suárez','Harim García','JP',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(15,'Belisario Dominguez','Erik García','BD',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(16,'León De La Barra','Ricardo Orellana','LB',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(17,'José Limantour','Gabriel Chávez','JL',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(18,'Ramón Corral','Jaime Juárez','RC',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(19,'Bernardo Reyes','Juan M. Suárez','BR',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(20,'Filomeno Mata','Joaquín Reyes','FM',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(21,'Andrés Molina','Manuel Sánchez','AM',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(22,'Heriberto Jara','Manuel Sánchez','HJ',2,2,'2013-11-14 01:28:41','2013-11-21 19:33:05'),(23,'Otilio Montaño','Arturo Ramírez','OM',2,2,'2013-11-14 01:28:41','2013-11-21 19:32:47'),(24,'Luis Cabrera','Arturo Ramírez','LC',2,2,'2013-11-14 01:28:41','2013-11-14 01:28:41'),(25,'Main subgroup','Leader','S1',4,2,'2014-02-04 17:57:43','2014-02-04 17:57:43'),(26,'Subgrupo Uno','Coordinador del Evento','SUB_UNO',5,3,'2014-02-04 21:54:15','2014-02-04 21:54:15'),(27,'Main subgroup','Leader','S1',6,3,'2014-02-07 19:22:01','2014-02-07 19:22:01');
/*!40000 ALTER TABLE `subgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configurations`
--

DROP TABLE IF EXISTS `system_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configurations`
--

LOCK TABLES `system_configurations` WRITE;
/*!40000 ALTER TABLE `system_configurations` DISABLE KEYS */;
INSERT INTO `system_configurations` VALUES (1,'emobile','es','2013-11-14 01:28:41','2014-02-08 00:02:37');
/*!40000 ALTER TABLE `system_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL,
  `colony` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `authentication_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`),
  KEY `users_role_id_fk` (`role_id`),
  KEY `users_event_id_fk` (`event_id`),
  CONSTRAINT `users_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `users_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'System','Administrator','6141111111','Chihuahua','Chihuahua',33333,'México','Address 1','1111','Colony 1',1,NULL,'2013-11-14 01:28:41','2014-02-12 23:27:34','administrator','emobile@emobile.com.mx','$2a$10$lngnawUyrqzKYlLU.DWMyOQlJwKqXdb4pm/ASmAVUTuGzGTbbn89W',NULL,NULL,NULL,60,'2014-02-12 23:27:34','2014-02-12 23:14:39','189.244.46.110','189.244.18.200',NULL,'2013-11-13 05:00:00',NULL,NULL,0,NULL,NULL,NULL),(2,'Raúl','Maese','6141111111','Chihuahua','Chihuahua',33333,'México','Address 1','1111','Colony 1',2,1,'2013-11-14 01:28:41','2013-11-21 18:21:51','rmaeseadmin','rmaese@emobile.com.mx','$2a$10$aMaKGUjOemOoSXp4B3ZmRu58in9R0.7dXhPnaUI6ACdthEqOWGeym',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2013-11-13 05:00:00',NULL,NULL,0,NULL,NULL,NULL),(3,'Jorge','Luna','6141222222','Chihuahua','Chihuahua',33333,'México','Address 2','2222','Colony 2',2,2,'2013-11-14 01:28:45','2013-11-21 18:21:55','jlunaadmin','jluna@emobile.com.mx','$2a$10$TAjue2Hd.VaQz0zajTIJNOEVa1wk0hY/U2SFCVCI6SUXxR2OKDYR6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2013-11-13 05:00:05',NULL,NULL,0,NULL,NULL,NULL),(4,'Raúl','Maese','614 233 54 81','Chihuahua','Chihuahua',30140,'México','Americas','#2001','Panamericana',2,3,'2014-02-04 17:57:42','2014-02-07 01:20:09','administrador','raulmaese@gmail.com','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'hvKWp1YiyVa4ekVRycNx',NULL,'2014-02-06 00:19:27',NULL,1,NULL,NULL,NULL),(8,'Claudia ','Flores Yamada','614 258 21 00','Chihuahua','Chihuahua',94012,'México','Ave. Mirador','422','Lomas Altas',2,3,'2014-02-07 19:58:55','2014-02-12 22:59:29','claudiaflores','claudia@cie-mex.com','$2a$10$tw5aNiOQE8lxLxuhr06VAelfiM5pXCkyIOSyh9XWHE7nq7do6hUXa',NULL,NULL,NULL,14,'2014-02-12 22:59:29','2014-02-12 22:15:42','187.207.254.168','187.207.254.168',NULL,'2014-02-10 23:03:14','2014-02-07 19:58:55',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshops`
--

DROP TABLE IF EXISTS `workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workshops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `workshop_key` varchar(255) NOT NULL,
  `teacher_name` varchar(255) NOT NULL,
  `room_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workshops_room_id_fk` (`room_id`),
  KEY `workshops_event_id_fk` (`event_id`),
  CONSTRAINT `workshops_event_id_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `workshops_room_id_fk` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshops`
--

LOCK TABLES `workshops` WRITE;
/*!40000 ALTER TABLE `workshops` DISABLE KEYS */;
INSERT INTO `workshops` VALUES (1,'SYSCOM','rht','Instructor SYSCOM',1,1,'2013-11-15 01:34:22','2013-11-15 18:10:03'),(2,'CISCO','1zg','Instructor CISCO',2,1,'2013-11-15 01:34:41','2013-11-15 18:09:43'),(3,'TECHDATA','v5b','Instructor TECHDATA',3,1,'2013-11-15 01:34:58','2013-11-15 18:09:21'),(4,'TOSHIBA','k7o','Instructor TOSHIBA',4,1,'2013-11-15 01:35:23','2013-11-15 18:08:51'),(5,'HUAWEI','usc','Instructor HUAWEI',5,1,'2013-11-15 01:35:50','2013-11-15 18:08:12'),(6,'MICROSOFT','7gw','Instructor MICROSOFT',6,1,'2013-11-15 01:36:05','2013-11-15 18:07:33'),(7,'TECHDATA 2','0re','Instructor TECHDATA 2',7,2,'2013-11-15 01:36:39','2013-11-15 18:07:06'),(8,'ASPEL','pot','Instructor ASPEL',8,2,'2013-11-15 01:37:03','2013-11-15 18:06:34'),(9,'D-LINK','l5x','Instructor D-LINK',9,2,'2013-11-15 01:37:24','2013-11-15 18:06:04'),(10,'B LINE','wu3','Instructor B LINE',10,2,'2013-11-15 01:37:38','2013-11-15 18:03:50'),(11,'TRIPP LITE','ea4','Instructor TRIPP LITE',11,2,'2013-11-15 01:38:06','2013-11-15 18:03:16'),(12,'INGRAM','2nc','Instructor INGRAM',12,2,'2013-11-15 01:38:20','2013-11-15 18:02:49'),(13,'¿El fin de las contraseñas?','hwd','Fernando Catoira',13,3,'2014-02-12 17:46:35','2014-02-12 17:46:35'),(14,'EL MEDIO DE COBRO COMO HERRAMIENTA','7oe','Jorge Siqueiros',14,3,'2014-02-12 17:50:00','2014-02-12 17:50:00');
/*!40000 ALTER TABLE `workshops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-12 17:20:31
