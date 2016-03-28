-- MySQL dump 10.13  Distrib 5.6.28, for Win64 (x86_64)
--
-- Host: localhost    Database: movies
-- ------------------------------------------------------
-- Server version	5.6.28-log

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
-- Table structure for table `comment`
--
CREATE SCHEMA IF NOT EXISTS `movies` DEFAULT CHARACTER SET utf8 ;
USE `movies` ;


DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `user_ID` INT(11) NOT NULL,
  `movie_ID` INT(11) NOT NULL,
  `text` TEXT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`comment_ID`),
  KEY `user_to_comment_fk_idx` (`user_ID`),
  KEY `movie_to_comment_fk_idx` (`movie_ID`),
  CONSTRAINT `movie_to_comment_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_to_comment_fk` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`country`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`genre`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image_ID` INT(11) NOT NULL,
  PRIMARY KEY (`image_ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `movie_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `runtime` TIME DEFAULT NULL,
  `releaseDate` DATE DEFAULT NULL,
  `year` INT(11) NOT NULL,
  `description` TEXT,
  `image_ID` INT(11) DEFAULT NULL,
  `title` VARCHAR(200) DEFAULT NULL, -- Add field `title`
  PRIMARY KEY (`movie_ID`),
  KEY `image_to_movie_fk_idx` (`image_ID`),
  CONSTRAINT `image_to_movie_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_country`
--

DROP TABLE IF EXISTS `movie_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_country` (
  `movie_country_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` INT(11) NOT NULL,
  `country` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`movie_country_ID`),
  KEY `country_to_movie_country_fk_idx` (`country`),
  KEY `movie_to_movie_country_fk_idx` (`movie_ID`),
  CONSTRAINT `country_to_movie_country_fk` FOREIGN KEY (`country`) REFERENCES `country` (`country`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `movie_to_movie_country_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_country`
--

LOCK TABLES `movie_country` WRITE;
/*!40000 ALTER TABLE `movie_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_genre` (
  `movie_genre_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` INT(11) NOT NULL,
  `genre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`movie_genre_ID`),
  KEY `genre_to_movie_genre_fk_idx` (`genre`),
  KEY `movie_to_movie_genre_fk_idx` (`movie_ID`),
  CONSTRAINT `genre_to_movie_genre_fk` FOREIGN KEY (`genre`) REFERENCES `genre` (`genre`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `movie_to_movie_genre_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_image`
--

DROP TABLE IF EXISTS `movie_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_image` (
  `movie_image_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` INT(11) NOT NULL,
  `image_ID` INT(11) NOT NULL,
  PRIMARY KEY (`movie_image_ID`),
  KEY `image_to_movie_image_fk_idx` (`image_ID`),
  KEY `movie_to_movie_image_fk_idx` (`movie_ID`),
  CONSTRAINT `image_to_movie_image_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_to_movie_image_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_image`
--

LOCK TABLES `movie_image` WRITE;
/*!40000 ALTER TABLE `movie_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_person`
--

DROP TABLE IF EXISTS `movie_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_person` (
  `movie_person_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` INT(11) NOT NULL,
  `person_ID` INT(11) NOT NULL,
  PRIMARY KEY (`movie_person_ID`),
  KEY `movie_to_movie_person_idx` (`movie_ID`),
  KEY `person_to_movie_person_idx` (`person_ID`),
  CONSTRAINT `movie_to_movie_person` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_to_movie_person` FOREIGN KEY (`person_ID`) REFERENCES `person` (`person_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_person`
--

LOCK TABLES `movie_person` WRITE;
/*!40000 ALTER TABLE `movie_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_person_role`
--

DROP TABLE IF EXISTS `movie_person_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_person_role` (
  `movie_person_role_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `movie_person_ID` INT(11) NOT NULL,
  `role` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`movie_person_role_ID`),
  KEY `movie_person_to_movie_person_role_fk_idx` (`movie_person_ID`),
  KEY `role_to_movie_person_role_fk_idx` (`role`),
  CONSTRAINT `movie_person_to_movie_person_role_fk` FOREIGN KEY (`movie_person_ID`) REFERENCES `movie_person` (`movie_person_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_to_movie_person_role_fk` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_person_role`
--

LOCK TABLES `movie_person_role` WRITE;
/*!40000 ALTER TABLE `movie_person_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_person_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_studio`
--

DROP TABLE IF EXISTS `movie_studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_studio` (
  `movie_studio_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` INT(11) NOT NULL,
  `studio_ID` INT(11) NOT NULL,
  PRIMARY KEY (`movie_studio_ID`),
  KEY `studio_to_movie_studio_fk_idx` (`studio_ID`),
  KEY `movie_to_movie_studio_fk_idx` (`movie_ID`),
  CONSTRAINT `movie_to_movie_studio_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `studio_to_movie_studio_fk` FOREIGN KEY (`studio_ID`) REFERENCES `studio` (`studio_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_studio`
--

LOCK TABLES `movie_studio` WRITE;
/*!40000 ALTER TABLE `movie_studio` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_ID` INT(11) NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  `birth_date` DATE NOT NULL,
  `death_date` DATE DEFAULT NULL,
  `country` VARCHAR(30) NOT NULL,
  `image_ID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`person_ID`),
  KEY `image_to_person_ID_idx` (`image_ID`),
  KEY `country_to_person_ID_idx` (`country`),
  CONSTRAINT `country_to_person_ID` FOREIGN KEY (`country`) REFERENCES `country` (`country`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `image_to_person_ID` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_image`
--

DROP TABLE IF EXISTS `person_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_image` (
  `person_image_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `person_ID` INT(11) NOT NULL,
  `image_ID` INT(11) NOT NULL,
  PRIMARY KEY (`person_image_ID`),
  KEY `image_to_person_image_fk_idx` (`image_ID`),
  KEY `person_to_person_image_fk_idx` (`person_ID`),
  CONSTRAINT `image_to_person_image_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_to_person_image_fk` FOREIGN KEY (`person_ID`) REFERENCES `person` (`person_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_image`
--

LOCK TABLES `person_image` WRITE;
/*!40000 ALTER TABLE `person_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `user_ID` INT(11) NOT NULL,
  `movie_ID` INT(11) NOT NULL,
  `score` INT(11) NOT NULL,
  PRIMARY KEY (`rating_ID`),
  KEY `movie_to_rating_fk_idx` (`movie_ID`),
  KEY `user_to_rating_fk_idx` (`user_ID`),
  CONSTRAINT `movie_to_rating_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_to_rating_fk` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studio` (
  `studio_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`studio_ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(25) NOT NULL,
  `user_role_ID` INT(11) NOT NULL,
  `image_ID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `image_to_user_fk_idx` (`image_ID`),
  CONSTRAINT `image_to_user_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_movie_favorite`
--

DROP TABLE IF EXISTS `user_movie_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_movie_favorite` (
  `user_movie_favorite_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `user_ID` INT(11) NOT NULL,
  `movie_ID` INT(11) NOT NULL,
  PRIMARY KEY (`user_movie_favorite_ID`),
  KEY `user_to_user_movie_favorite_fk_idx` (`user_ID`),
  KEY `movie_to_user_movie_favorite_idx` (`movie_ID`),
  CONSTRAINT `movie_to_user_movie_favorite` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_to_user_movie_favorite_fk` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_movie_favorite`
--

LOCK TABLES `user_movie_favorite` WRITE;
/*!40000 ALTER TABLE `user_movie_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_movie_favorite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 11:55:24