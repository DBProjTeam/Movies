/*
SQLyog Ultimate v11.33 (32 bit)
MySQL - 5.7.11-log : Database - movies
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movies` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movies`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL,
  `movie_ID` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`comment_ID`),
  KEY `user_to_comment_fk_idx` (`user_ID`),
  KEY `movie_to_comment_fk_idx` (`movie_ID`),
  CONSTRAINT `movie_to_comment_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_to_comment_fk` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

LOCK TABLES `comment` WRITE;

UNLOCK TABLES;

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `country` varchar(60) NOT NULL COMMENT 'change length to 60 ',
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `country` */

LOCK TABLES `country` WRITE;

insert  into `country`(`country`) values ('Испания'),('Италия'),('Канада'),('Турция'),('Франция'),('Южная Корея');

UNLOCK TABLES;

/*Table structure for table `genre` */

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `genre` varchar(30) NOT NULL,
  PRIMARY KEY (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `genre` */

LOCK TABLES `genre` WRITE;

insert  into `genre`(`genre`) values ('Драма'),('Приключения'),('Семейный'),('Триллер'),('Ужасы');

UNLOCK TABLES;

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `image_ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`image_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `image` */

LOCK TABLES `image` WRITE;

insert  into `image`(`image_ID`,`name`) values (200,'movie/Post_BelliAndCebactian.jpg'),(201,'movie/Post_BrodDog.jpg'),(202,'movie/Post_GoodSleep.jpg'),(300,'person/Pers_Kristian_Duge.jpg'),(301,'person/Pers_SesilObri.jpg'),(302,'person/Pers_JulLegran.jpg'),(303,'person/Pers_ChekiKario.jpg'),(304,'person/Pers_JonXimKim.jpg'),(305,'person/Pers_SunNumKim.jpg'),(306,'person/Pers_JaumeBakagyjro.jpg'),(307,'person/Pers_AlbertoMarini.jpg'),(308,'person/Pers_XylioFepnandes.jpg');

UNLOCK TABLES;

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `movie_ID` int(11) NOT NULL AUTO_INCREMENT,
  `runtime` time DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `year` int(11) NOT NULL,
  `description` text,
  `image_ID` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`movie_ID`),
  KEY `image_to_movie_fk_idx` (`image_ID`),
  CONSTRAINT `image_to_movie_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;

/*Data for the table `movie` */

LOCK TABLES `movie` WRITE;

insert  into `movie`(`movie_ID`,`runtime`,`releaseDate`,`year`,`description`,`image_ID`,`title`) values (200,'01:35:30','2015-09-17',2016,'Сентябрь 1945 года. Все во французской горной деревушке празднуют окончание войны. Себастьян вырос — ему уже 10 лет. Вместе с Белль они с нетерпением ждут возвращения Анджелины. Однако позже они узнают, что девушка попала в авиакатастрофу в самом сердце заальпийских лесов. Вся деревня потеряла надежду за исключением дедушки Себастьяна Цезаря, который знает Пьера — человека способного помочь им найти Анджелину. На пути к ее спасению мальчику и его собаке предстоит выдержать множество опасностей, пройти через тысячи испытаний и узнать тайну, которая изменит жизнь Белль и Себастьяна навсегда. Приключение продолжается!',200,'Белль и Себастьян, приключение продолжается'),(201,'01:45:49','2013-06-13',2013,'Чон-гу изготавливает самодельные бомбы и продает тем, кто готов их использовать. У него есть партнер — Хё-мин, который когда-то был его первым покупателем. Хё-мин — безрассудный и агрессивный человек. Он подталкивает Чон-гу к пропасти, откуда нет возврата. Но тот не поддается на провокации со стороны партнера, пока однажды случайно не убивает детектива, следившего за ним. Теперь у Хё-мина есть такой же, как и он сам, напарник.',201,'Бродячая собака'),(202,'01:32:32','2011-09-15',2011,'Главный герой — Сесар, работающий консьержем в небольшом жилом доме, в Барселоне. Кажется, что он маленький незаметный человек, который лишь открывает и закрывает двери, но на самом деле он тот, кто замечает и знает про жителей многоквартирного дома абсолютно все. Он глубоко несчастлив и ищет хоть какую-нибудь причину для дальнейшего своего существования. День за днем он выполняет свою работу и, пока на него никто из жителей дома не обращает особого внимания, сам он неустанно наблюдает за ними. Он знает каждую мелочь в их жизнях, все о них, а в особенности про одну из них.',202,'Крепкий сон');

UNLOCK TABLES;

/*Table structure for table `movie_country` */

DROP TABLE IF EXISTS `movie_country`;

CREATE TABLE `movie_country` (
  `movie_country_ID` int(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` int(11) NOT NULL,
  `country` varchar(30) NOT NULL,
  PRIMARY KEY (`movie_country_ID`),
  KEY `country_to_movie_country_fk_idx` (`country`),
  KEY `movie_to_movie_country_fk_idx` (`movie_ID`),
  CONSTRAINT `country_to_movie_country_fk` FOREIGN KEY (`country`) REFERENCES `country` (`country`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `movie_to_movie_country_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

/*Data for the table `movie_country` */

LOCK TABLES `movie_country` WRITE;

insert  into `movie_country`(`movie_country_ID`,`movie_ID`,`country`) values (115,200,'Франция'),(116,201,'Южная Корея'),(117,202,'Испания');

UNLOCK TABLES;

/*Table structure for table `movie_genre` */

DROP TABLE IF EXISTS `movie_genre`;

CREATE TABLE `movie_genre` (
  `movie_genre_ID` int(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` int(11) NOT NULL,
  `genre` varchar(30) NOT NULL,
  PRIMARY KEY (`movie_genre_ID`),
  KEY `genre_to_movie_genre_fk_idx` (`genre`),
  KEY `movie_to_movie_genre_fk_idx` (`movie_ID`),
  CONSTRAINT `genre_to_movie_genre_fk` FOREIGN KEY (`genre`) REFERENCES `genre` (`genre`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `movie_to_movie_genre_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=658 DEFAULT CHARSET=utf8;

/*Data for the table `movie_genre` */

LOCK TABLES `movie_genre` WRITE;

insert  into `movie_genre`(`movie_genre_ID`,`movie_ID`,`genre`) values (653,200,'Приключения'),(654,200,'Семейный'),(655,201,'Драма'),(656,202,'Ужасы'),(657,202,'Триллер');

UNLOCK TABLES;

/*Table structure for table `movie_image` */

DROP TABLE IF EXISTS `movie_image`;

CREATE TABLE `movie_image` (
  `movie_image_ID` int(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` int(11) NOT NULL,
  `image_ID` int(11) NOT NULL,
  PRIMARY KEY (`movie_image_ID`),
  KEY `image_to_movie_image_fk_idx` (`image_ID`),
  KEY `movie_to_movie_image_fk_idx` (`movie_ID`),
  CONSTRAINT `image_to_movie_image_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_to_movie_image_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `movie_image` */

LOCK TABLES `movie_image` WRITE;

insert  into `movie_image`(`movie_image_ID`,`movie_ID`,`image_ID`) values (8,200,200),(9,201,201),(10,202,202);

UNLOCK TABLES;

/*Table structure for table `movie_person` */

DROP TABLE IF EXISTS `movie_person`;

CREATE TABLE `movie_person` (
  `movie_person_ID` int(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` int(11) NOT NULL,
  `person_ID` int(11) NOT NULL,
  PRIMARY KEY (`movie_person_ID`),
  KEY `movie_to_movie_person_idx` (`movie_ID`),
  KEY `person_to_movie_person_idx` (`person_ID`),
  CONSTRAINT `movie_to_movie_person` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_to_movie_person` FOREIGN KEY (`person_ID`) REFERENCES `person` (`person_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

/*Data for the table `movie_person` */

LOCK TABLES `movie_person` WRITE;

insert  into `movie_person`(`movie_person_ID`,`movie_ID`,`person_ID`) values (400,200,300),(401,200,301),(402,200,302),(403,200,303),(404,201,304),(405,201,305),(406,202,306),(407,202,307),(408,202,308);

UNLOCK TABLES;

/*Table structure for table `movie_person_role` */

DROP TABLE IF EXISTS `movie_person_role`;

CREATE TABLE `movie_person_role` (
  `movie_person_role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `movie_person_ID` int(11) NOT NULL,
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`movie_person_role_ID`),
  KEY `movie_person_to_movie_person_role_fk_idx` (`movie_person_ID`),
  KEY `role_to_movie_person_role_fk_idx` (`role`),
  CONSTRAINT `movie_person_to_movie_person_role_fk` FOREIGN KEY (`movie_person_ID`) REFERENCES `movie_person` (`movie_person_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_to_movie_person_role_fk` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;

/*Data for the table `movie_person_role` */

LOCK TABLES `movie_person_role` WRITE;

insert  into `movie_person_role`(`movie_person_role_ID`,`movie_person_ID`,`role`) values (328,400,'DIRECTOR'),(329,401,'scenario'),(330,402,'producer'),(331,403,'actor'),(332,404,'DIRECTOR'),(333,404,'scenario'),(334,405,'producer'),(335,405,'actor'),(336,406,'DIRECTOR'),(337,407,'scenario'),(338,408,'producer'),(339,408,'operator');

UNLOCK TABLES;

/*Table structure for table `movie_studio` */

DROP TABLE IF EXISTS `movie_studio`;

CREATE TABLE `movie_studio` (
  `movie_studio_ID` int(11) NOT NULL AUTO_INCREMENT,
  `movie_ID` int(11) NOT NULL,
  `studio_ID` int(11) NOT NULL,
  PRIMARY KEY (`movie_studio_ID`),
  KEY `studio_to_movie_studio_fk_idx` (`studio_ID`),
  KEY `movie_to_movie_studio_fk_idx` (`movie_ID`),
  CONSTRAINT `movie_to_movie_studio_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `studio_to_movie_studio_fk` FOREIGN KEY (`studio_ID`) REFERENCES `studio` (`studio_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

/*Data for the table `movie_studio` */

LOCK TABLES `movie_studio` WRITE;

insert  into `movie_studio`(`movie_studio_ID`,`movie_ID`,`studio_ID`) values (104,200,200),(105,201,201),(106,202,202);

UNLOCK TABLES;

/*Table structure for table `person` */

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `person_ID` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `birth_date` date NOT NULL,
  `death_date` date DEFAULT NULL,
  `country` varchar(30) NOT NULL,
  `image_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_ID`),
  KEY `image_to_person_ID_idx` (`image_ID`),
  KEY `country_to_person_ID_idx` (`country`),
  CONSTRAINT `country_to_person_ID` FOREIGN KEY (`country`) REFERENCES `country` (`country`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `image_to_person_ID` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `person` */

LOCK TABLES `person` WRITE;

insert  into `person`(`person_ID`,`name`,`surname`,`birth_date`,`death_date`,`country`,`image_ID`) values (300,'Кристиан','Дюге','1957-02-03',NULL,'Канада',300),(301,'Сесиль','Обри','1928-04-02','2010-05-19','Франция',301),(302,'Жиль','Легран','1960-02-03',NULL,'Франция',302),(303,'Чеки','Карио','1953-10-04',NULL,'Турция',303),(304,'Юнг-xун','Ким','1980-03-20',NULL,'Южная Корея',304),(305,'Со-ын','Ким','1988-04-27',NULL,'Южная Корея',305),(306,'Жауме','Балагуэро','1968-06-02',NULL,'Испания',306),(307,'Альберто','Марини','1972-03-25',NULL,'Италия',307),(308,'Хулио','Фернандес','1959-09-14','2016-02-09','Испания',308);

UNLOCK TABLES;

/*Table structure for table `person_image` */

DROP TABLE IF EXISTS `person_image`;

CREATE TABLE `person_image` (
  `person_image_ID` int(11) NOT NULL AUTO_INCREMENT,
  `person_ID` int(11) NOT NULL,
  `image_ID` int(11) NOT NULL,
  PRIMARY KEY (`person_image_ID`),
  KEY `image_to_person_image_fk_idx` (`image_ID`),
  KEY `person_to_person_image_fk_idx` (`person_ID`),
  CONSTRAINT `image_to_person_image_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_to_person_image_fk` FOREIGN KEY (`person_ID`) REFERENCES `person` (`person_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `person_image` */

LOCK TABLES `person_image` WRITE;

insert  into `person_image`(`person_image_ID`,`person_ID`,`image_ID`) values (1,101,5),(2,101,6),(3,101,7),(4,101,8),(5,101,10);

UNLOCK TABLES;

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rating_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL,
  `movie_ID` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`rating_ID`),
  KEY `movie_to_rating_fk_idx` (`movie_ID`),
  KEY `user_to_rating_fk_idx` (`user_ID`),
  CONSTRAINT `movie_to_rating_fk` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_to_rating_fk` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;

/*Data for the table `rating` */

LOCK TABLES `rating` WRITE;

insert  into `rating`(`rating_ID`,`user_ID`,`movie_ID`,`score`) values (1,78,82,4),(2,12,69,8),(3,91,67,10),(4,22,99,4),(5,60,19,3),(11,91,81,6),(12,13,96,8),(13,49,98,5),(14,68,12,4),(15,68,79,10),(21,54,18,4),(22,8,72,4),(23,80,52,5),(24,96,26,9),(25,86,67,5),(26,100,29,10),(31,19,28,10),(32,63,91,5),(33,55,20,3),(34,81,70,3),(35,101,43,2),(36,39,34,7),(37,19,9,7),(41,35,27,4),(42,89,23,6),(43,23,55,4),(51,28,73,4),(52,22,64,2),(53,99,61,7),(54,56,32,10),(55,42,72,5),(61,72,40,8),(62,55,82,1),(71,74,87,10),(72,50,96,8),(73,23,86,1),(74,13,35,5),(75,74,99,2),(81,51,77,2),(82,74,41,2),(83,63,45,2),(84,15,50,5),(85,28,79,6),(86,80,72,8),(87,30,77,6),(91,81,77,9),(92,63,91,2),(93,67,36,1),(94,8,50,1),(101,86,43,6),(102,72,91,4),(103,30,88,5),(111,63,30,7),(112,54,44,9),(113,74,78,3),(114,28,54,10),(115,34,68,9),(116,51,96,5),(117,42,85,10),(121,58,87,1),(122,50,12,4),(123,41,97,8),(124,24,66,1),(125,72,73,3),(126,87,42,5),(131,74,10,8),(132,39,63,3),(133,39,15,8),(134,19,16,2),(135,12,27,5),(141,47,34,1),(142,23,94,3),(143,7,21,8),(144,67,91,7),(145,57,18,8),(151,42,96,6),(152,30,47,4),(153,74,64,2),(154,101,71,1),(155,49,39,1),(156,6,49,4),(161,19,48,9),(162,30,23,6),(163,86,24,2),(164,76,14,4),(171,100,29,2),(172,51,13,10),(173,22,40,10),(174,51,2,7),(175,56,94,9),(181,49,12,1),(182,7,68,1),(183,74,35,1),(184,41,66,1),(185,80,18,9),(186,19,54,2),(191,57,28,8),(192,28,87,4),(193,55,57,7),(194,67,29,6),(201,81,80,2),(202,76,40,8),(203,50,20,1),(204,15,80,1),(205,41,93,8),(206,74,72,10),(207,55,52,6),(208,57,14,1),(209,12,55,5),(211,91,96,8),(212,7,50,1),(213,49,84,4),(221,73,39,5),(222,60,34,10),(223,35,84,9),(224,56,1,8),(225,42,36,9),(226,102,35,10),(231,92,24,7),(232,74,21,10),(233,55,47,1),(234,96,50,8),(241,47,36,6),(242,91,38,10),(243,54,86,8),(251,102,12,8),(252,58,51,5),(253,22,65,8),(254,92,22,8),(255,57,15,2),(261,87,34,4),(262,8,83,10),(263,54,27,2),(264,91,94,7),(265,51,45,5),(266,23,21,7),(271,22,18,8),(272,60,80,2),(273,51,54,4),(274,7,65,10),(275,35,21,9),(276,12,53,4),(277,73,87,8),(281,50,86,10),(282,42,56,3),(283,13,8,5),(284,86,1,7),(285,89,50,8),(286,34,94,10),(291,28,11,4),(292,54,7,3),(293,23,46,2),(294,24,55,9),(295,56,36,3),(296,102,54,7),(297,102,15,10),(298,102,1,10);

UNLOCK TABLES;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

LOCK TABLES `role` WRITE;

insert  into `role`(`role`) values ('actor'),('actress'),('artist'),('composer'),('DIRECTOR'),('montage'),('operator'),('producer'),('protagonist'),('Roles duplicated'),('scenario'),('Starring');

UNLOCK TABLES;

/*Table structure for table `studio` */

DROP TABLE IF EXISTS `studio`;

CREATE TABLE `studio` (
  `studio_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`studio_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;

/*Data for the table `studio` */

LOCK TABLES `studio` WRITE;

insert  into `studio`(`studio_ID`,`name`) values (200,'Gaumont'),(201,'Tongdaemun'),(202,'OBERON');

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `user_role_ID` int(11) NOT NULL,
  `image_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `image_to_user_fk_idx` (`image_ID`),
  KEY `user_role_ID` (`user_role_ID`),
  CONSTRAINT `image_to_user_fk` FOREIGN KEY (`image_ID`) REFERENCES `image` (`image_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`user_ID`,`login`,`password`,`name`,`surname`,`user_role_ID`,`image_ID`) values (1,'pauluxxx@mail.ru','1234','Pavel','Poimanov',2,4),(6,'Nulla@mollis.net','CSW76UHI9RG','Kibo','Pace',1,5),(7,'et.arcu.imperdiet@le','BJD67ZZP9XR','Scott','King',1,10),(8,'ac.metus@nuncsed.ca','ZMO16QVU7CW','Hillary','Leach',1,8),(12,'varius@malesuada.net','SSL95MKL9AF','Colette','Dunlap',1,10),(13,'pharetra.felis@habit','QLF26ZIM3IJ','Lilah','Ochoa',1,3),(15,'enim@egestas.org','MNC32ADB5UC','Magee','Cash',1,6),(19,'erat@nuncinterdum.co','CGS64DOF6VQ','Carl','Boyer',1,2),(22,'montes.nascetur@atau','SVQ39LGO1OE','Melinda','Delaney',1,4),(23,'commodo@dictum.ca','LFV61FRI7LE','Chelsea','Avery',1,1),(24,'risus.Donec.egestas@','MFZ38LUV8XJ','Alma','House',1,2),(28,'sed.hendrerit.a@eget','ZRD62EXT0UK','Kevyn','Nunez',1,10),(30,'ridiculus@urnaUt.org','NYY33ZAJ9VN','Cody','Maddox',1,3),(34,'Cum@ametultricies.ed','YZG03ECZ5RL','Kuame','Nixon',1,2),(35,'ligula.elit.pretium@','HSB22DMM3EJ','Kelly','England',1,7),(39,'gravida@quis.co.uk','JSG49RBE5ST','Macy','Yates',1,6),(41,'neque.Morbi.quis@acm','DYK11FGJ0BS','Sydney','Blake',1,4),(42,'ullamcorper.magna.Se','KZR48HYL7QS','Maris','Stokes',1,9),(44,'sodales.nisi@diamvel','AJT44BKS2SN','Fatima','Mcneil',1,2),(47,'auctor.quis.tristiqu','AGK91ZTG5ZF','Tanya','Downs',1,6),(49,'id@montesnasceturrid','VAY61XGO4PD','Riley','Oliver',1,10),(50,'ante@amet.net','XOX14SQK5GE','Leslie','Nash',1,5),(51,'sed@scelerisquelorem','SNE64OOM3MG','Camille','Meyer',1,2),(54,'dictum@risus.net','RAB36PKM3UV','Vivien','Battle',1,5),(55,'pede.et@iaculis.com','RQW54LFY7DT','Addison','Delacruz',1,10),(56,'consequat.lectus@tin','KDJ14EQG8HF','Cade','Baxter',1,6),(57,'commodo@Crasdolor.ca','ESC29WXQ8JX','Brian','Harper',1,7),(58,'ultrices@necligulaco','EVZ76KEF1ZS','Kelsey','Dawson',1,4),(60,'per.inceptos@sed.org','EFC70PJZ0IE','Kelsey','Nelson',1,2),(63,'Nam.tempor@Etiam.ca','DZJ89TUB5IZ','Coby','Robertson',1,5),(66,'risus.varius@necorci','UHN27PJB3ZP','Sigourney','Downs',1,5),(67,'ullamcorper.Duis.cur','OWU48TOD5AC','Judah','Parsons',1,5),(68,'lacus.Quisque.imperd','RJF54PAU7ER','Demetria','Levine',1,5),(72,'et.magnis.dis@ut.co.','SMM58COQ8PP','Alana','Davidson',1,2),(73,'at@velfaucibusid.org','TCZ65WIL1IT','Kai','Duffy',1,4),(74,'at.sem@NullamnislMae','YRN73RJZ6YO','Aubrey','Bonner',1,7),(76,'purus@aliquameuaccum','ZUY68TXW9IO','Chava','Dennis',1,3),(78,'massa@eleifend.co.uk','OJM10AVW7II','Wang','Kelley',1,3),(80,'Morbi.neque@laciniaS','PDR31KLS6QG','Charissa','Bell',1,6),(81,'Nullam.scelerisque@n','IXE84NAJ7LF','Constance','Bruce',1,6),(82,'nec.malesuada@lobort','WCS76FZG7LW','Danielle','Mendez',1,2),(86,'scelerisque.sed.sapi','ISU87BDH2ID','Blaze','Doyle',1,3),(87,'fames@Duissit.edu','LFX78IVJ5YP','Gil','Pope',1,4),(89,'mauris.ipsum.porta@a','SIH82JJB1TW','Walter','Guerrero',1,2),(91,'eros.Proin@sociisnat','UXV57IHH5PH','Dane','Kemp',1,3),(92,'congue@aliquamenim.n','ZCX87WCI2QF','Morgan','Hicks',1,6),(96,'eu.placerat@non.com','OFF35JIR1PM','Cassandra','Wiggins',1,3),(99,'eu@ornare.edu','IVM41BVD9JG','Bo','Peters',1,5),(100,'massa.Vestibulum@era','EEE70ZYK9EI','Dahlia','Petty',1,1),(101,'varius@malesuada.net','SSL95MKL9AF','Colette','Dunlap',1,10),(102,'newpavel@com.com','1234','Pavel','Poianov',3,1);

UNLOCK TABLES;

/*Table structure for table `user_movie_favorite` */

DROP TABLE IF EXISTS `user_movie_favorite`;

CREATE TABLE `user_movie_favorite` (
  `user_movie_favorite_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL,
  `movie_ID` int(11) NOT NULL,
  PRIMARY KEY (`user_movie_favorite_ID`),
  KEY `user_to_user_movie_favorite_fk_idx` (`user_ID`),
  KEY `movie_to_user_movie_favorite_idx` (`movie_ID`),
  CONSTRAINT `movie_to_user_movie_favorite` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_to_user_movie_favorite_fk` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user_movie_favorite` */

LOCK TABLES `user_movie_favorite` WRITE;

insert  into `user_movie_favorite`(`user_movie_favorite_ID`,`user_ID`,`movie_ID`) values (2,102,54),(6,102,1);

UNLOCK TABLES;

/* Procedure structure for procedure `findMovie` */

/*!50003 DROP PROCEDURE IF EXISTS  `findMovie` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`pavel`@`%` PROCEDURE `findMovie`(IN movietitle VARCHAR(30),IN Coun VARCHAR(30),IN Genr VARCHAR(30),IN Stud VARCHAR(30),in from_year  VARCHAR(5), in to_year  VARCHAR(5))
BEGIN
	select  rtrim(movietitle)  into movietitle;
	
	SET @sQuery = concat("SELECT movie.`movie_ID`,movie.`year`,movie.`runtime`,movie.`releaseDate`,movie.`image_ID`,movie.`description`,movie.`title`FROM movie ");
	set @wherecause = concat(" where ");
	
	SET @country = CONCAT('%',Coun,'%');
	SET @studio = CONCAT('%',Stud,'%');
	SET @genre = CONCAT('%',Genr,'%');
	
	SET @from_year = from_year;
	SET @to_year = to_year;
	
	SET @title = movietitle;
	
	SET @title =  CONCAT('%',movietitle,'%');
	if (@title !='%%') then
	SET @wherecause = CONCAT(@wherecause," movie.title like ","@title");
	else SET @wherecause = CONCAT(@wherecause," (movie.title like ","@title"," OR ISNULL (title))");
	
	end if;
	if (@from_year!='')then
		if (@to_year!='')then 
		SET @wherecause = CONCAT(@wherecause," and (movie.year >= ",'@from_year',' and ',' movie.year <= @to_year )');
		else SET @wherecause = CONCAT(@wherecause," and movie.year >= @from_year"); 
		end if;
	else  IF (@to_year!='')THEN SET @wherecause = CONCAT(@wherecause," and movie.year <= @to_year"); end if;  
	end if;	
	
	if (@country!='%%')then
		SET @sQuery = CONCAT(@sQuery," INNER JOIN `movie_country` ON (movie_country.movie_id=movie.movie_id) ");
		SET @wherecause = concat(@wherecause," AND movie_country.country like ",'@country');
	end if;	
	IF (@genre!='%%')THEN
		SET @sQuery = CONCAT(@sQuery," INNER JOIN `movie_genre` ON (movie_genre.movie_id=movie.movie_id) ");
		SET @wherecause = CONCAT(@wherecause," AND genre like ",'@genre');
	END IF;	
	IF (@studio!='%%')THEN
		SET @sQuery = CONCAT(@sQuery," INNER JOIN `movie_studio`ON(movie_studio.movie_id=movie.movie_id) ");
		SET @wherecause = CONCAT(@wherecause," AND studio_Id like ",'@studio');
	END IF;	
	
	SET @sQuery = CONCAT(@sQuery,@wherecause);
	PREPARE stmt FROM @sQuery;
	execute stmt ;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `findPerson` */

/*!50003 DROP PROCEDURE IF EXISTS  `findPerson` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`pavel`@`%` PROCEDURE `findPerson`(in name varchar(45),in role varchar(45))
BEGIN
	set @name = name;
	set @role = role;
	set @query = "select person.person_id,`person`.`name` , `person`.`surname`, `person`.`birth_date`  , `person`.`death_date`   , `person`.`country`  , `person`.`image_ID` from person ";	
	set @wherecause = " where ";
	SELECT  CONCAT('%',@name,'%') INTO @name;
		
	SET @wherecause= CONCAT(@wherecause," (name like @name"," or surname like @name )");
	if (@role != '%%')then
	
		SELECT  CONCAT('%',@role,'%') INTO @role;
		SET @query = concat(@query ," INNER JOIN `movie_person_role`  ON ( `movie_person_role`.`movie_person_ID` = person.`person_ID`)");
		SET @wherecause =  CONCAT(@wherecause,"  and role LIKE @role");
	end if;		
		
	SET @query = CONCAT(@query,@wherecause);
	PREPARE stmt FROM @query;
	execute stmt;
		
	
    END */$$
DELIMITER ;

/*Table structure for table `movie_person_role_view` */

DROP TABLE IF EXISTS `movie_person_role_view`;

/*!50001 DROP VIEW IF EXISTS `movie_person_role_view` */;
/*!50001 DROP TABLE IF EXISTS `movie_person_role_view` */;

/*!50001 CREATE TABLE  `movie_person_role_view`(
 `person_ID` int(11) ,
 `name` varchar(25) ,
 `surname` varchar(25) ,
 `birth_date` date ,
 `death_date` date ,
 `country` varchar(30) ,
 `image_ID` int(11) ,
 `movie_ID` int(11) ,
 `role` varchar(30) 
)*/;

/*View structure for view movie_person_role_view */

/*!50001 DROP TABLE IF EXISTS `movie_person_role_view` */;
/*!50001 DROP VIEW IF EXISTS `movie_person_role_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `movie_person_role_view` AS select `person`.`person_ID` AS `person_ID`,`person`.`name` AS `name`,`person`.`surname` AS `surname`,`person`.`birth_date` AS `birth_date`,`person`.`death_date` AS `death_date`,`person`.`country` AS `country`,`person`.`image_ID` AS `image_ID`,`movie_person`.`movie_ID` AS `movie_ID`,`movie_person_role`.`role` AS `role` from ((`movie_person_role` join `movie_person` on((`movie_person_role`.`movie_person_ID` = `movie_person`.`movie_person_ID`))) join `person` on((`movie_person`.`person_ID` = `person`.`person_ID`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
