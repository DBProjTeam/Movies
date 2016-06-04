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

/*Table structure for table `coachtype` */

DROP TABLE IF EXISTS `coachtype`;

CREATE TABLE `coachtype` (
  `id_coachtype` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `passanger_number` int(11) NOT NULL,
  `picture` varchar(45) DEFAULT NULL,
  `coefficient` double NOT NULL,
  PRIMARY KEY (`id_coachtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `coachtype` */

LOCK TABLES `coachtype` WRITE;

insert  into `coachtype`(`id_coachtype`,`name`,`passanger_number`,`picture`,`coefficient`) values (1,'sleep',36,'sleep.png',1.8),(2,'platz',38,'plaz.png',1.5),(3,'general',64,'general.png',1),(4,'small',2,NULL,1);

UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

LOCK TABLES `comment` WRITE;

insert  into `comment`(`comment_ID`,`user_ID`,`movie_ID`,`text`,`date`) values (1,8,90,'ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec','2015-05-26 22:45:39'),(2,68,74,'volutpat nunc sit amet metus. Aliquam','2015-10-16 21:28:06'),(5,8,98,'pharetra nibh. Aliquam ornare, libero at','2015-03-14 04:36:08'),(6,63,86,'nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.','2015-12-17 14:53:44'),(8,47,3,'morbi','2015-07-10 16:07:03'),(10,86,50,'mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet','2015-04-22 14:01:57'),(12,54,2,'Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel,','2015-05-04 13:47:10'),(14,47,2,'malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien.','2015-11-23 00:28:22'),(16,92,37,'tempus eu, ligula. Aenean euismod mauris eu elit. Nulla','2016-02-26 00:47:47'),(18,67,30,'Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper,','2016-01-24 12:26:54'),(24,63,72,'non arcu. Vivamus sit amet','2015-09-17 14:38:56'),(28,58,30,'Mauris','2015-11-04 02:20:24'),(32,23,55,'velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse','2015-07-21 09:53:50'),(33,22,99,'interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum','2016-01-16 20:46:10'),(35,92,67,'laoreet lectus quis massa.','2016-01-04 11:07:02'),(37,89,41,'risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar','2016-02-04 01:06:41'),(38,7,89,'sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus.','2015-05-05 13:13:47'),(39,30,75,'id magna','2015-09-12 14:49:04'),(40,99,39,'et malesuada fames ac turpis egestas. Fusce aliquet magna a','2015-09-17 19:01:52'),(41,39,38,'gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate,','2015-10-13 21:18:59'),(42,99,27,'Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum','2015-02-22 17:21:56'),(43,89,29,'auctor non, feugiat nec, diam. Duis','2015-09-09 03:29:11'),(47,28,87,'in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit','2016-02-12 09:08:24'),(48,91,49,'tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum','2015-12-13 08:15:07'),(49,23,23,'nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in','2015-01-27 00:12:42'),(53,57,26,'orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at','2015-03-06 00:42:18'),(55,57,49,'sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque','2015-01-14 17:42:36'),(56,80,91,'lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi','2015-12-31 15:46:03'),(57,67,31,'elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi','2015-03-23 02:48:47'),(58,42,59,'dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae','2015-10-18 00:53:09'),(61,96,85,'tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque','2015-08-28 16:57:21'),(63,42,21,'adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus','2016-02-23 04:20:50'),(65,42,67,'venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at,','2015-11-08 15:44:57'),(66,99,32,'sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis','2015-10-09 06:03:53'),(67,68,43,'vitae nibh. Donec est mauris, rhoncus id,','2016-02-22 03:38:06'),(68,28,56,'tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna','2016-02-06 05:32:57'),(69,100,29,'varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede','2016-02-01 04:50:17'),(70,50,47,'nisl. Nulla eu neque','2015-08-27 08:57:17'),(77,50,41,'Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam','2015-11-27 04:32:33'),(78,68,45,'adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo','2015-09-27 11:27:05'),(79,54,100,'nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare','2015-11-19 11:39:50'),(82,99,97,'eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet','2016-01-31 08:42:35'),(83,55,26,'fringilla est. Mauris eu turpis.','2016-01-22 14:41:05'),(84,58,29,'Curabitur ut odio vel est tempor bibendum. Donec felis orci,','2015-05-10 09:55:55'),(86,76,16,'Curae; Phasellus ornare. Fusce mollis.','2015-08-21 20:45:19'),(91,47,73,'hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper,','2015-04-27 04:31:38'),(93,74,9,'auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus.','2015-07-23 16:53:16'),(95,50,2,'Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus','2015-12-26 04:37:36'),(96,89,17,'mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh.','2015-10-14 05:21:12'),(98,44,98,'tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus','2016-01-03 10:33:57'),(99,73,94,'nunc. Quisque ornare tortor at risus. Nunc ac','2016-01-03 00:22:45'),(100,1,54,'hjaskldhfjkalsdhfjkl ashdfjkasdlhf jkalsdhfjkas dfhasdjkflhasdjklfhasjkdl','2016-01-03 00:22:45'),(101,102,54,'апр','2016-06-02 00:00:00');

UNLOCK TABLES;

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `country` varchar(60) NOT NULL COMMENT 'change length to 60 ',
  PRIMARY KEY (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `country` */

LOCK TABLES `country` WRITE;

insert  into `country`(`country`) values ('Afghanistan'),('Åland Islands'),('Albania'),('Algeria'),('American Samoa'),('Andorra'),('Angola'),('Anguilla'),('Antigua and Barbuda'),('Argentina'),('Armenia'),('Aruba'),('Australia'),('Austria'),('Bahamas'),('Bahrain'),('Bangladesh'),('Barbados'),('Belarus'),('Belgium'),('Belize'),('Bermuda'),('Bhutan'),('Bolivia'),('Bonaire, Sint Eustatius and Saba'),('Bosnia and Herzegovina'),('Botswana'),('Brazil'),('Brunei'),('Burkina Faso'),('Burundi'),('Cambodia'),('Cameroon'),('Cayman Islands'),('Chad'),('Chile'),('China'),('Christmas Island'),('Cocos (Keeling) Islands'),('Colombia'),('Comoros'),('Congo (Brazzaville)'),('Congo, the Democratic Republic of the'),('Cook Islands'),('Costa Rica'),('Côte D\'Ivoire (Ivory Coast)'),('Croatia'),('Cuba'),('Curaçao'),('Cyprus'),('Czech Republic'),('Denmark'),('Djibouti'),('Dominica'),('Dominican Republic'),('Ecuador'),('Egypt'),('El Salvador'),('Equatorial Guinea'),('Eritrea'),('Estonia'),('Ethiopia'),('Faroe Islands'),('Fiji'),('Finland'),('France'),('French Polynesia'),('Gabon'),('Gambia'),('Georgia'),('Ghana'),('Gibraltar'),('Greece'),('Greenland'),('Guadeloupe'),('Guam'),('Guatemala'),('Guernsey'),('Guinea'),('Guinea-Bissau'),('Guyana'),('Haiti'),('Heard Island and Mcdonald Islands'),('Holy See (Vatican City State)'),('Honduras'),('Hong Kong'),('Hungary'),('Iceland'),('India'),('Indonesia'),('Iran'),('Ireland'),('Isle of Man'),('Israel'),('Italy'),('Jamaica'),('Japan'),('Jersey'),('Jordan'),('Kazakhstan'),('Kenya'),('Kiribati'),('Korea, South'),('Kuwait'),('Kyrgyzstan'),('Laos'),('Latvia'),('Lebanon'),('Liberia'),('Libya'),('Liechtenstein'),('Lithuania'),('Luxembourg'),('Macao'),('Macedonia'),('Madagascar'),('Malawi'),('Malaysia'),('Maldives'),('Mali'),('Malta'),('Marshall Islands'),('Martinique'),('Mauritania'),('Mauritius'),('Mayotte'),('Mexico'),('Micronesia'),('Moldova'),('Monaco'),('Montenegro'),('Montserrat'),('Morocco'),('Mozambique'),('Myanmar'),('Namibia'),('Nepal'),('Netherlands'),('New Caledonia'),('New Zealand'),('Niger'),('Niue'),('Norfolk Island'),('Northern Mariana Islands'),('Norway'),('Oman'),('Pakistan'),('Palau'),('Palestine, State of'),('Panama'),('Papua New Guinea'),('Paraguay'),('Peru'),('Philippines'),('Pitcairn Islands'),('Poland'),('Portugal'),('Puerto Rico'),('Qatar'),('Reunion'),('Romania'),('Russian Federation'),('Rwanda'),('Saint Barthélemy'),('Saint Helena, Ascension and Tristan da Cunha'),('Saint Kitts and Nevis'),('Saint Lucia'),('Saint Martin'),('Saint Vincent and The Grenadines'),('Samoa'),('San Marino'),('Sao Tome and Principe'),('Saudi Arabia'),('Senegal'),('Seychelles'),('Sierra Leone'),('Singapore'),('Sint Maarten'),('Slovakia'),('Slovenia'),('Solomon Islands'),('Somalia'),('South Africa'),('South Georgia and The South Sandwich Islands'),('South Sudan'),('Spain'),('Sri Lanka'),('Sudan'),('Suriname'),('Svalbard and Jan Mayen Islands'),('Swaziland'),('Switzerland'),('Syria'),('Taiwan'),('Tajikistan'),('Tanzania'),('Thailand'),('Timor-Leste'),('Togo'),('Tokelau'),('Tonga'),('Trinidad and Tobago'),('Tunisia'),('Turkey'),('Turkmenistan'),('Turks and Caicos Islands'),('Tuvalu'),('Uganda'),('Ukraine'),('United Kingdom (Great Britain)'),('United States'),('United States Minor Outlying Islands'),('Uruguay'),('Vanuatu'),('Venezuela'),('Viet Nam'),('Virgin Islands, British'),('Virgin Islands, United States'),('Western Sahara'),('Yemen'),('Zambia'),('Zimbabwe'),('Без страны');

UNLOCK TABLES;

/*Table structure for table `genre` */

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `genre` varchar(30) NOT NULL,
  PRIMARY KEY (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `genre` */

LOCK TABLES `genre` WRITE;

insert  into `genre`(`genre`) values ('action'),('comedy'),('drama'),('fantasy'),('fiction'),('horror'),('melodrama'),('science '),('thriller'),('western');

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

insert  into `image`(`image_ID`,`name`) values (1,'detal_movie_01.jpg'),(2,'detal_movie_02.jpg'),(3,'detal_movie_03.jpg'),(4,'detal_movie_04.jpg'),(5,'Person_17.jpg'),(6,'Person_07.jpg'),(7,'Person_09.jpg'),(8,'Person_12.jpg'),(9,'detal_movie_main.jpg'),(10,'Person_14.jpg'),(11,'Person_03.jpg'),(12,''),(13,' '),(14,' '),(15,' '),(16,' '),(17,' '),(18,' '),(19,' '),(20,' '),(111,'movie-1.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `movie` */

LOCK TABLES `movie` WRITE;

insert  into `movie`(`movie_ID`,`runtime`,`releaseDate`,`year`,`description`,`image_ID`,`title`) values (1,'02:22:22','2002-08-03',2002,'dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat,',111,'Голая бухта'),(2,'02:42:37','2013-09-24',2013,'egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet.',111,'Агент ноно'),(3,'01:53:58','2005-11-23',2005,'est, vitae sodales nisi magna sed dui. Fusce',111,'Нуль Реактор'),(4,'02:51:50','2003-11-14',2003,'parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia',111,'Реквеем по мечте'),(5,'00:24:10','2006-04-23',2006,'netus et malesuada fames',111,'Рвемся в бой'),(6,'00:09:19','2015-06-23',2015,'Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor',111,'Когда сил больше нет'),(7,'01:54:15','2013-03-25',2013,'nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc',111,'Нет тебя '),(8,'01:37:57','2002-08-13',2002,'dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit',111,'Веди меня'),(9,'02:47:48','2015-12-11',2015,'venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus',111,'Убирайся вон'),(10,'02:20:31','1992-12-07',1992,'diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque',111,'Красная зоря'),(11,'00:41:15','1996-05-15',1996,'eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc',111,'Не слыханная дерзость'),(12,'00:42:45','2011-07-12',2011,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu',111,'Не дерди меня'),(13,'01:40:05','1988-09-12',1988,'Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem',111,'asf'),(14,'00:16:40','2006-05-25',2006,'accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce',111,'asfsf'),(15,'01:12:59','2017-08-24',2017,'a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris',111,'sfasfa'),(16,'00:31:36','2013-06-02',2013,'ac',111,'as'),(17,'00:02:25','2017-03-26',2017,'Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis',111,'asfsfas'),(18,'01:50:50','1994-11-17',1994,'auctor, nunc',111,'z'),(19,'00:15:40','2013-09-04',2013,'accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis',111,NULL),(20,'01:42:49','2017-03-16',2017,'at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a',111,NULL),(21,'02:02:49','2015-11-04',2015,'libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus',111,NULL),(22,'02:07:07','1997-11-14',1997,'eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa.',111,NULL),(23,'01:47:31','2012-02-16',2012,'quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla',111,'Просто люби меня'),(24,'02:31:03','2010-09-15',2010,'ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et',111,NULL),(25,'00:51:48','1997-06-12',1997,'placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero',111,NULL),(26,'01:00:37','1989-03-04',1989,'amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis',111,NULL),(27,'00:03:25','1995-12-02',1995,'mauris a nunc.',111,NULL),(28,'02:54:16','2009-10-05',2009,'parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis,',111,NULL),(29,'02:36:36','1991-11-07',1991,'auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed',111,NULL),(30,'00:10:18','2012-06-12',2012,'urna. Vivamus molestie dapibus ligula. Aliquam erat',111,NULL),(31,'01:05:27','2002-05-03',2002,'et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,',111,NULL),(32,'01:33:59','1992-01-28',1992,'iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi',111,NULL),(33,'01:57:47','1998-10-12',1998,'laoreet lectus quis massa. Mauris vestibulum, neque',111,NULL),(34,'07:41:28','1996-02-27',1996,'Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum',111,NULL),(35,'14:02:50','2019-06-14',2019,'id enim. Curabitur massa. Vestibulum accumsan neque et',111,NULL),(36,'18:16:40','2010-08-11',2010,'in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit',111,NULL),(37,'21:13:42','2011-10-24',2011,'hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt',111,NULL),(38,'04:35:46','1999-08-02',1999,'Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus',111,NULL),(39,'08:43:41','2015-02-20',2015,'Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem,',111,NULL),(40,'02:36:23','2017-11-12',2017,'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque',111,NULL),(41,'19:16:11','2011-08-11',2011,'nibh enim, gravida sit amet,',111,NULL),(42,'19:34:36','1995-12-11',1995,'Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla.',111,NULL),(43,'00:31:19','2012-02-19',2012,'Nunc commodo auctor',111,NULL),(44,'10:04:42','1997-03-17',1997,'urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.',111,NULL),(45,'21:37:40','1994-12-25',1994,'iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat.',111,NULL),(46,'20:54:35','1993-11-19',1993,'tellus id nunc interdum feugiat. Sed nec metus facilisis lorem',111,NULL),(47,'02:00:10','1991-12-19',1991,'elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet',111,NULL),(48,'12:00:28','2010-07-10',2010,'eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy.',111,NULL),(49,'15:53:37','2001-06-01',2001,'ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus',111,NULL),(50,'20:23:53','1990-12-29',1990,'quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a',111,NULL),(51,'20:20:18','2016-09-09',2016,'et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat',111,NULL),(52,'00:18:18','2012-08-12',2012,'enim, gravida',111,NULL),(53,'00:40:58','2000-08-12',2000,'lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi',111,'Тайны и ложь'),(54,'01:27:55','2016-10-06',2016,'nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero dui',9,'Криолан'),(55,'17:40:04','2014-11-16',2014,'feugiat. Lorem ipsum dolor sit amet,',111,NULL),(56,'09:05:04','2008-12-02',2008,'Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu',111,NULL),(57,'18:39:08','1990-02-11',1990,'luctus et ultrices posuere cubilia Curae; Donec tincidunt.',111,NULL),(58,'17:48:37','1988-03-11',1988,'nunc,',111,NULL),(59,'06:19:52','1989-02-22',1989,'dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis',111,NULL),(60,'00:50:47','1996-06-09',1996,'Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean',111,NULL),(61,'21:22:33','1998-04-28',1998,'Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis',111,NULL),(62,'06:55:32','1999-02-02',1999,'vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus',111,NULL),(63,'07:20:01','2010-06-03',2010,'sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci.',111,NULL),(64,'06:47:25','2005-04-10',2005,'dictum placerat,',111,NULL),(65,'01:11:27','1997-02-02',1997,'molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros',111,NULL),(66,'02:37:52','1992-08-25',1992,'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare',111,NULL),(67,'17:00:48','1995-07-20',1995,'blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla',111,NULL),(68,'20:43:57','2019-12-11',2019,'interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer',111,NULL),(69,'09:50:17','1998-08-01',1998,'luctus felis purus ac tellus. Suspendisse',111,NULL),(70,'12:46:11','1993-12-18',1993,'velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut',111,NULL),(71,'08:58:54','1990-12-06',1990,'Quisque ornare tortor at risus. Nunc ac sem',111,NULL),(72,'10:33:44','2005-08-31',2005,'non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare',111,NULL),(73,'05:39:49','2010-11-23',2010,'Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat',111,NULL),(74,'10:47:40','2002-06-15',2002,'ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit',111,NULL),(75,'03:28:01','1993-10-28',1993,'dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum',111,NULL),(76,'12:11:18','2009-04-12',2009,'ligula eu enim. Etiam imperdiet dictum',111,NULL),(77,'07:37:55','1994-07-27',1994,'ac libero nec ligula consectetuer rhoncus. Nullam velit dui,',111,NULL),(78,'13:43:05','1995-02-01',1995,'purus sapien, gravida non, sollicitudin a, malesuada',111,NULL),(79,'07:44:36','1996-08-26',1996,'Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper.',111,NULL),(80,'00:13:56','2011-12-17',2011,'vel, faucibus id, libero. Donec consectetuer mauris id',111,NULL),(81,'08:24:50','2008-09-03',2008,'Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum',111,NULL),(82,'05:02:58','1996-09-11',1996,'in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis,',111,NULL),(83,'23:35:42','2017-07-07',2017,'magnis dis parturient montes, nascetur',111,NULL),(84,'17:00:49','1988-08-13',1988,'id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi',111,NULL),(85,'15:14:45','2007-08-20',2007,'ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam',111,NULL),(86,'21:46:38','2003-12-06',2003,'urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere',111,NULL),(87,'03:32:11','1994-04-28',1994,'dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non,',111,NULL),(88,'15:48:07','2006-08-07',2006,'Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque',111,NULL),(89,'10:27:38','1999-06-06',1999,'enim. Etiam gravida molestie arcu. Sed eu',111,NULL),(90,'10:08:37','1989-03-05',1989,'vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus',111,NULL),(91,'17:20:40','2011-12-03',2011,'at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor',111,NULL),(92,'09:55:52','2000-09-29',2000,'habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin',111,NULL),(93,'03:37:20','2002-11-15',2002,'Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc',111,NULL),(94,'03:28:17','2006-08-08',2006,'eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean',111,NULL),(95,'11:54:51','2015-11-20',2015,'ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo',111,NULL),(96,'12:35:14','2008-12-17',2008,'nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus.',111,NULL),(97,'13:39:31','2005-01-14',2005,'id nunc interdum',111,NULL),(98,'03:01:20','2014-01-27',2014,'nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper',111,NULL),(99,'18:52:31','1989-07-14',1989,'non nisi. Aenean eget metus. In nec orci.',111,NULL),(100,'12:10:12','2019-12-22',2019,'et ultrices',111,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

/*Data for the table `movie_country` */

LOCK TABLES `movie_country` WRITE;

insert  into `movie_country`(`movie_country_ID`,`movie_ID`,`country`) values (8,41,'Aruba'),(9,22,'Bangladesh'),(10,35,'Cayman Islands'),(11,69,'Colombia'),(12,15,'Comoros'),(13,26,'Cuba'),(14,26,'Djibouti'),(15,26,'Egypt'),(16,15,'Eritrea'),(17,15,'Estonia'),(18,44,'Ethiopia'),(19,33,'Greenland'),(20,44,'Guinea'),(21,69,'Hong Kong'),(22,5,'Israel'),(23,33,'Jordan'),(24,23,'Kuwait'),(25,44,'Luxembourg'),(26,26,'Macedonia'),(27,4,'Mauritius'),(28,91,'Mayotte'),(29,25,'Monaco'),(30,46,'Morocco'),(31,33,'Mozambique'),(32,22,'Oman'),(33,46,'Panama'),(34,15,'Saint Kitts and Nevis'),(35,15,'Saint Lucia'),(36,22,'Saint Martin'),(37,33,'Somalia'),(38,15,'Swaziland'),(39,22,'Syria'),(40,15,'Uruguay'),(41,73,'Vanuatu'),(42,46,'Viet Nam'),(43,54,'Vanuatu'),(111,1,'Без страны');

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
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8;

/*Data for the table `movie_genre` */

LOCK TABLES `movie_genre` WRITE;

insert  into `movie_genre`(`movie_genre_ID`,`movie_ID`,`genre`) values (511,15,'drama'),(512,15,'fantasy'),(513,15,'horror'),(514,70,'action'),(515,70,'western'),(516,73,'action'),(517,73,'comedy'),(518,7,'fiction'),(519,7,'thriller'),(520,31,'fantasy'),(521,31,'melodrama'),(522,28,'comedy'),(523,28,'melodrama'),(524,28,'science '),(525,28,'western'),(526,45,'fantasy'),(527,45,'science '),(528,45,'western'),(529,52,'drama'),(530,52,'horror'),(531,52,'western'),(532,80,'horror'),(533,50,'comedy'),(534,50,'fantasy'),(535,50,'horror'),(536,55,'drama'),(537,55,'fiction'),(538,55,'horror'),(539,55,'melodrama'),(540,55,'science '),(541,55,'western'),(542,6,'action'),(543,6,'fantasy'),(544,6,'thriller'),(545,99,'horror'),(546,99,'thriller'),(547,16,'fiction'),(548,16,'melodrama'),(549,16,'western'),(550,54,'action'),(551,54,'horror'),(552,54,'science '),(553,56,'drama'),(554,56,'melodrama'),(555,71,'action'),(556,71,'fantasy'),(557,71,'fiction'),(558,71,'horror'),(559,71,'melodrama'),(560,71,'science '),(561,71,'thriller'),(562,24,'fiction'),(563,24,'melodrama'),(564,24,'thriller'),(565,43,'fiction'),(566,49,'action'),(567,49,'fantasy'),(568,49,'fiction'),(569,49,'melodrama'),(574,22,'comedy'),(575,22,'drama'),(576,44,'fantasy'),(577,44,'horror'),(578,44,'thriller'),(579,46,'melodrama'),(580,25,'action'),(581,25,'western'),(582,70,'thriller'),(583,76,'thriller'),(584,29,'action'),(585,29,'melodrama'),(586,29,'science '),(587,29,'thriller'),(588,35,'action'),(589,35,'drama'),(590,35,'melodrama'),(591,40,'comedy'),(592,40,'drama'),(593,40,'fantasy'),(594,40,'fiction'),(595,40,'western'),(596,60,'drama'),(597,60,'horror'),(598,14,'comedy'),(599,14,'fantasy'),(600,14,'fiction'),(601,14,'science '),(602,21,'comedy'),(603,21,'fiction'),(604,57,'melodrama'),(605,18,'drama'),(606,18,'melodrama'),(607,18,'western'),(608,11,'action'),(609,11,'drama'),(610,11,'fiction'),(611,11,'horror'),(612,11,'western'),(613,50,'fantasy'),(614,50,'melodrama'),(615,50,'thriller'),(616,65,'horror'),(617,65,'melodrama'),(618,65,'science '),(619,19,'drama'),(620,19,'fantasy'),(621,19,'horror'),(622,19,'melodrama'),(623,32,'comedy'),(624,32,'fiction'),(625,32,'horror'),(626,32,'science '),(627,39,'fiction'),(628,39,'melodrama'),(629,56,'action'),(630,56,'drama'),(631,56,'western'),(632,71,'comedy'),(633,71,'melodrama'),(634,77,'fiction'),(635,93,'fantasy'),(636,93,'horror'),(637,93,'thriller'),(638,20,'action'),(639,20,'comedy'),(640,20,'drama'),(641,20,'fiction'),(642,20,'horror'),(643,24,'comedy'),(644,24,'fantasy'),(645,24,'fiction'),(646,43,'action'),(647,43,'melodrama');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `movie_image` */

LOCK TABLES `movie_image` WRITE;

insert  into `movie_image`(`movie_image_ID`,`movie_ID`,`image_ID`) values (1,54,1),(2,54,2),(3,54,3),(4,54,4);

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
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

/*Data for the table `movie_person` */

LOCK TABLES `movie_person` WRITE;

insert  into `movie_person`(`movie_person_ID`,`movie_ID`,`person_ID`) values (1,33,114),(2,33,116),(3,33,147),(4,33,178),(5,33,191),(6,33,123),(7,33,182),(8,33,148),(9,33,177),(10,33,127),(11,33,135),(12,33,152),(13,33,119),(14,33,175),(15,33,103),(16,33,133),(17,33,149),(18,33,190),(19,46,124),(20,46,187),(21,46,144),(22,46,145),(23,46,147),(24,46,178),(25,46,163),(26,46,174),(27,46,182),(28,46,143),(29,46,129),(30,46,130),(31,46,138),(32,46,152),(33,46,170),(34,46,133),(35,89,125),(36,89,150),(37,89,114),(38,89,147),(39,89,154),(40,89,159),(41,89,104),(42,89,106),(43,89,142),(44,89,197),(45,89,173),(46,89,177),(47,89,120),(48,89,128),(49,89,135),(50,89,109),(51,89,140),(52,89,166),(53,89,168),(54,89,170),(55,89,133),(56,89,134),(57,89,149),(58,89,190),(59,4,118),(60,4,155),(61,4,186),(62,4,147),(63,4,197),(64,4,173),(65,4,120),(66,4,171),(67,4,100),(68,4,140),(69,4,160),(70,4,168),(71,4,103),(72,4,133),(73,4,134),(74,4,190),(75,9,118),(76,9,125),(77,9,150),(78,9,155),(79,9,186),(80,9,193),(81,9,145),(82,9,178),(83,9,104),(84,9,123),(85,9,101),(86,9,106),(87,9,120),(88,9,129),(89,9,127),(90,9,171),(91,9,113),(92,9,140),(93,9,166),(94,23,118),(95,23,124),(96,23,145),(97,23,174),(98,23,101),(99,23,110),(100,23,173),(101,23,120),(102,23,128),(103,23,130),(104,23,138),(105,23,100),(106,23,168),(107,23,103),(108,23,149),(109,60,118),(110,60,125),(111,60,150),(112,60,155),(113,60,122),(114,60,193),(115,60,145),(116,60,147),(117,60,191),(118,60,111),(119,60,138),(120,60,171),(121,60,108),(122,60,119),(123,60,102),(124,41,124),(125,41,184),(126,41,187),(127,41,104),(128,41,123),(129,41,174),(130,41,101),(131,41,106),(132,41,127),(133,41,119),(134,41,175),(135,41,103),(136,41,133),(137,41,190),(138,66,118),(139,66,161),(140,66,184),(141,66,117),(142,66,154),(143,66,178),(144,66,163),(145,66,182),(146,66,115),(147,66,197),(148,66,120),(149,66,121),(150,66,128),(151,66,129),(152,66,100),(153,66,108),(154,66,109),(155,66,113),(156,66,166),(157,66,134),(158,96,150),(159,96,116),(160,96,104),(161,96,111),(162,96,163),(163,96,115),(164,96,177),(165,96,130),(166,96,152),(167,96,160),(168,96,165),(169,96,170),(170,96,102),(171,74,124),(172,74,117),(173,74,145),(174,74,159),(175,74,123),(176,74,148),(177,74,173),(178,74,120),(179,74,128),(180,74,129),(181,74,100),(182,74,113),(183,74,119),(184,74,162),(185,74,133),(186,74,149),(187,84,161),(188,84,122),(189,84,154),(190,84,178),(191,84,182),(192,84,106),(193,84,110),(194,84,121),(195,84,130),(196,84,135),(197,84,192),(198,84,108),(199,84,119),(200,84,149),(201,18,118),(202,18,150),(203,18,155),(204,18,187),(205,18,116),(206,18,186),(207,18,145),(208,18,191),(209,18,104),(210,18,123),(211,18,163),(212,18,101),(213,18,106),(214,18,115),(215,18,142),(216,18,143),(217,18,148),(218,18,173),(219,18,177),(220,18,120),(221,18,129),(222,18,130),(223,18,135),(224,18,171),(225,18,108),(226,18,119),(227,18,166),(228,18,149),(229,97,161),(230,97,184),(231,97,187),(232,97,114),(233,97,122),(234,97,186),(235,97,154),(236,97,178),(237,97,104),(238,97,101),(239,97,106),(240,97,197),(241,97,143),(242,97,173),(243,97,177),(244,97,120),(245,97,121),(246,97,135),(247,97,192),(248,97,109),(249,97,119),(250,97,140),(251,97,168),(252,97,149),(253,62,150),(254,62,184),(255,62,144),(256,62,193),(257,62,147),(258,62,182),(259,62,142),(260,62,197),(261,62,120),(262,62,128),(263,62,138),(264,62,166),(265,62,168),(266,62,170),(267,62,102),(268,62,133),(269,62,134),(270,62,149),(271,54,118),(272,54,155),(273,54,161),(274,54,144),(275,54,191),(276,54,163),(277,54,101),(278,54,142),(279,54,197),(280,54,120),(281,54,129),(282,54,127),(283,54,135),(284,54,100),(285,54,160),(286,54,103),(287,56,118),(288,56,124),(289,56,187),(290,56,116),(291,56,147),(292,56,111),(293,56,174),(294,56,106),(295,56,110),(296,56,173),(297,56,109),(298,56,119),(299,56,140),(300,56,162),(301,56,168),(302,56,175),(303,56,134),(304,98,118),(305,98,125),(306,98,122),(307,98,144),(308,98,197),(309,98,121),(310,98,127),(311,98,152),(312,98,171),(313,98,100),(314,98,108),(315,98,165),(316,98,166),(317,98,170),(318,98,175),(319,98,149),(320,98,190),(321,43,187),(322,43,122),(323,43,193),(324,43,123),(325,43,163),(326,43,182),(327,43,120),(328,43,129),(329,43,130),(330,43,127),(331,43,192),(332,43,108),(333,43,113),(334,43,119),(335,43,160),(336,43,170),(337,43,102),(338,49,124),(339,49,150),(340,49,184),(341,49,122),(342,49,144),(343,49,186),(344,49,145),(345,49,159),(346,49,178),(347,49,104),(348,49,106),(349,49,110),(350,49,173),(351,49,121),(352,49,152),(353,49,192),(354,49,170),(355,79,114),(356,79,116),(357,79,144),(358,79,193),(359,79,191),(360,79,111),(361,79,123),(362,79,163),(363,79,173),(364,79,177),(365,79,109),(366,79,119),(367,79,160),(368,51,111);

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
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;

/*Data for the table `movie_person_role` */

LOCK TABLES `movie_person_role` WRITE;

insert  into `movie_person_role`(`movie_person_role_ID`,`movie_person_ID`,`role`) values (1,59,'artist'),(2,59,'montage'),(3,59,'protagonist'),(4,59,'Roles duplicated'),(5,61,'montage'),(6,61,'Starring'),(7,71,'\roperator'),(8,71,'actress'),(9,72,'\roperator'),(10,72,'actress'),(11,72,'artist'),(12,72,'scenario'),(13,78,'actor'),(14,78,'DIRECTOR'),(15,78,'producer'),(16,78,'scenario'),(17,78,'Starring'),(18,83,'\roperator'),(19,83,'actress'),(20,83,'artist'),(21,93,'actor'),(22,93,'actress'),(23,93,'DIRECTOR'),(24,204,'composer'),(25,204,'producer'),(26,204,'protagonist'),(27,204,'scenario'),(28,211,'actress'),(29,211,'DIRECTOR'),(30,211,'scenario'),(31,217,'artist'),(32,217,'composer'),(33,217,'Roles duplicated'),(34,219,'artist'),(35,219,'Starring'),(36,226,'\roperator'),(37,226,'protagonist'),(38,227,'\roperator'),(39,227,'protagonist'),(40,227,'Roles duplicated'),(41,94,'actress'),(42,94,'artist'),(43,94,'Starring'),(44,97,'montage'),(45,97,'protagonist'),(46,97,'Roles duplicated'),(47,98,'scenario'),(48,101,'\roperator'),(49,101,'producer'),(50,101,'protagonist'),(51,101,'Roles duplicated'),(52,102,'\roperator'),(53,102,'montage'),(54,106,'Roles duplicated'),(55,8,'\roperator'),(56,8,'actress'),(57,8,'DIRECTOR'),(58,16,'artist'),(59,16,'composer'),(60,16,'montage'),(61,16,'Starring'),(62,128,'actor'),(63,128,'artist'),(64,134,'actor'),(65,134,'Roles duplicated'),(66,136,'scenario'),(67,332,'\roperator'),(68,332,'Roles duplicated'),(69,336,'actor'),(70,336,'actress'),(71,336,'Starring'),(72,20,'actor'),(73,20,'Roles duplicated'),(74,20,'scenario'),(75,27,'actor'),(76,27,'producer'),(77,27,'protagonist'),(78,27,'scenario'),(79,27,'Starring'),(80,28,'\roperator'),(81,28,'artist'),(82,28,'producer'),(83,28,'Starring'),(84,34,'DIRECTOR'),(85,34,'protagonist'),(86,34,'Roles duplicated'),(87,341,'composer'),(88,341,'DIRECTOR'),(89,341,'scenario'),(90,345,'composer'),(91,348,'actress'),(92,348,'producer'),(93,351,'DIRECTOR'),(94,351,'producer'),(95,351,'protagonist'),(96,351,'Starring'),(97,352,'DIRECTOR'),(98,352,'protagonist'),(99,352,'Starring'),(100,271,'actress'),(101,271,'artist'),(102,275,'actor'),(103,275,'composer'),(104,275,'montage'),(105,276,'protagonist'),(106,276,'Roles duplicated'),(107,277,'actor'),(108,277,'actress'),(109,277,'artist'),(110,277,'producer'),(111,277,'scenario'),(112,277,'Starring'),(113,280,'actor'),(114,280,'actress'),(115,280,'artist'),(116,280,'composer'),(117,280,'DIRECTOR'),(118,280,'protagonist'),(119,280,'Roles duplicated'),(120,284,'artist'),(121,284,'DIRECTOR'),(122,284,'montage'),(123,284,'protagonist'),(124,285,'composer'),(125,285,'montage'),(126,285,'protagonist'),(127,287,'\roperator'),(128,287,'artist'),(129,287,'DIRECTOR'),(130,288,'montage'),(131,288,'protagonist'),(132,288,'scenario'),(133,290,'DIRECTOR'),(134,292,'\roperator'),(135,293,'composer'),(136,293,'protagonist'),(137,298,'protagonist'),(138,298,'Starring'),(139,299,'\roperator'),(140,299,'actor'),(141,299,'montage'),(142,299,'producer'),(143,111,'\roperator'),(144,111,'actor'),(145,111,'artist'),(146,111,'montage'),(147,111,'Roles duplicated'),(148,111,'scenario'),(149,112,'actor'),(150,112,'producer'),(151,112,'protagonist'),(152,112,'Starring'),(153,113,'\roperator'),(154,113,'actor'),(155,115,'DIRECTOR'),(156,115,'protagonist'),(157,115,'Roles duplicated'),(158,255,'producer'),(159,255,'Starring'),(160,258,'Roles duplicated'),(161,264,'actor'),(162,264,'actress'),(163,264,'composer'),(164,265,'\roperator'),(165,265,'actress'),(166,265,'montage'),(167,267,'artist'),(168,267,'composer'),(169,267,'DIRECTOR'),(170,267,'protagonist'),(171,267,'Starring'),(172,139,'\roperator'),(173,139,'montage'),(174,139,'producer'),(175,139,'Starring'),(176,147,'actress'),(177,147,'composer'),(178,147,'montage'),(179,147,'protagonist'),(180,148,'actress'),(181,148,'artist'),(182,148,'producer'),(183,148,'protagonist'),(184,148,'Starring'),(185,153,'actor'),(186,153,'producer'),(187,153,'protagonist'),(188,153,'scenario'),(189,154,'\roperator'),(190,154,'montage'),(191,154,'Roles duplicated'),(192,157,'actor'),(193,157,'montage'),(194,157,'protagonist'),(195,157,'Roles duplicated'),(196,174,'actress'),(197,174,'Roles duplicated'),(198,174,'Starring'),(199,175,'actor'),(200,175,'DIRECTOR'),(201,175,'montage'),(202,177,'actress'),(203,177,'artist'),(204,358,'\roperator'),(205,358,'actress'),(206,358,'artist'),(207,358,'DIRECTOR'),(208,358,'Starring'),(209,359,'DIRECTOR'),(210,359,'Starring'),(211,362,'\roperator'),(212,362,'composer'),(213,362,'DIRECTOR'),(214,362,'producer'),(215,362,'scenario'),(216,363,'composer'),(217,363,'Starring'),(218,365,'actress'),(219,365,'DIRECTOR'),(220,365,'scenario'),(221,188,'producer'),(222,188,'Starring'),(223,198,'actress'),(224,198,'protagonist'),(225,198,'Roles duplicated'),(226,198,'Starring'),(227,35,'actor'),(228,35,'montage'),(229,35,'producer'),(230,35,'protagonist'),(231,38,'\roperator'),(232,38,'artist'),(233,38,'DIRECTOR'),(234,43,'actress'),(235,43,'DIRECTOR'),(236,43,'protagonist'),(237,44,'DIRECTOR'),(238,44,'montage'),(239,44,'protagonist'),(240,44,'scenario'),(241,44,'Starring'),(242,46,'composer'),(243,46,'DIRECTOR'),(244,46,'montage'),(245,46,'Roles duplicated'),(246,49,'scenario'),(247,49,'Starring'),(248,56,'actor'),(249,56,'protagonist'),(250,58,'\roperator'),(251,58,'actor'),(252,58,'actress'),(253,58,'artist'),(254,58,'DIRECTOR'),(255,58,'producer'),(256,165,'composer'),(257,165,'montage'),(258,232,'montage'),(259,232,'protagonist'),(260,233,'composer'),(261,233,'producer'),(262,236,'producer'),(263,242,'\roperator'),(264,242,'actor'),(265,242,'actress'),(266,242,'composer'),(267,242,'montage'),(268,242,'Roles duplicated'),(269,245,'\roperator'),(270,245,'composer'),(271,247,'actress'),(272,247,'artist'),(273,247,'scenario'),(274,249,'\roperator'),(275,249,'Roles duplicated'),(276,252,'actress'),(277,252,'DIRECTOR'),(278,305,'actor'),(279,305,'artist'),(280,305,'DIRECTOR'),(281,305,'scenario'),(282,306,'artist'),(283,306,'DIRECTOR'),(284,311,'composer'),(285,311,'DIRECTOR'),(286,311,'montage'),(287,311,'protagonist'),(288,311,'Roles duplicated'),(289,312,'\roperator'),(290,312,'actor'),(291,312,'composer'),(292,312,'protagonist'),(293,316,'artist'),(294,316,'producer'),(295,316,'scenario'),(296,316,'Starring'),(297,319,'actor'),(298,319,'actress'),(299,319,'composer'),(300,319,'protagonist'),(301,319,'Roles duplicated'),(302,319,'Starring'),(303,368,'DIRECTOR');

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `movie_studio` */

LOCK TABLES `movie_studio` WRITE;

insert  into `movie_studio`(`movie_studio_ID`,`movie_ID`,`studio_ID`) values (1,56,53),(2,99,96),(3,24,49),(4,2,54),(5,65,9),(6,5,33),(7,58,87),(8,86,82),(9,93,79),(10,95,39),(11,20,28),(12,34,65),(13,88,49),(14,26,18),(15,75,26),(16,40,59),(18,37,98),(19,30,22),(20,92,65),(21,63,90),(22,79,42),(23,11,26),(24,84,100),(25,85,40),(26,32,72),(27,17,50),(30,19,11),(31,45,42),(32,81,54),(33,27,77),(34,23,34),(36,31,15),(37,10,92),(39,77,69),(42,59,70),(43,12,26),(44,16,90),(46,60,23),(48,1,38),(49,28,81),(53,98,32),(54,13,67),(55,96,88),(57,78,45),(58,53,50),(60,15,16),(62,36,5),(64,8,5),(66,21,61),(67,55,46),(70,7,60),(71,49,73),(72,76,89),(74,90,94),(78,80,37),(83,42,95),(84,73,82),(89,44,5),(91,61,94),(92,54,91),(93,83,65),(94,38,76),(97,48,14),(98,47,33),(100,4,45);

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

insert  into `person`(`person_ID`,`name`,`surname`,`birth_date`,`death_date`,`country`,`image_ID`) values (100,'Signe','Pitts','1979-11-13','2011-11-18','Holy See (Vatican City State)',11),(101,'Chava','Parsons','1983-12-20','2012-04-12','Kazakhstan',11),(102,'Lester','Maddox','1967-09-16','2013-12-12','New Zealand',10),(103,'Victoria','Shannon','1972-03-24','2013-04-29','Bermuda',10),(104,'Palmer','Mooney','1995-11-20','2015-02-25','Seychelles',4),(106,'Glenna','Cain','1977-02-05','2012-07-07','Syria',5),(108,'Mufutau','Gross','1991-12-18','2014-09-15','Mexico',9),(109,'Chester','Ware','1980-10-23','2016-10-26','Indonesia',9),(110,'Craig','Dickson','1986-07-31','2013-01-06','Monaco',6),(111,'Sara','Bright','1965-05-09','2012-01-07','Syria',4),(113,'Quintessa','Scott','1969-10-22','2011-04-03','Madagascar',9),(114,'Dominique','Welch','1973-01-31','2017-02-21','Kazakhstan',2),(115,'Leandra','Russell','1974-06-13','2013-08-15','Greece',5),(116,'Bertha','Gross','1971-03-02','2017-01-22','Northern Mariana Islands',2),(117,'Dane','Moody','1991-06-23','2012-09-13','Djibouti',2),(118,'Jelani','Marquez','1992-02-05','2011-08-16','Monaco',1),(119,'Dominic','Chan','1966-06-23','2013-12-03','Latvia',9),(120,'Kelsey','Kelly','1965-09-01','2013-08-06','Iceland',7),(121,'Salvador','Mcdowell','1997-11-23','2016-01-03','Estonia',7),(122,'Jack','Flores','1965-12-21','2012-11-13','Romania',2),(123,'Rose','Hines','1974-02-21','2014-02-13','Bahrain',4),(124,'Paloma','Bonner','1985-12-12','2012-12-11','Isle of Man',1),(125,'Cora','Ramsey','1972-10-06','2016-12-28','Colombia',1),(127,'Tara','Shannon','2000-08-06','2012-08-06','Solomon Islands',8),(128,'Jennifer','Langley','1982-07-28','2016-08-22','Cook Islands',7),(129,'Bradley','Knapp','1998-05-05','2016-04-20','Turks and Caicos Islands',7),(130,'Branden','Hardy','1976-03-01','2011-05-11','Zimbabwe',7),(133,'Montana','Kent','1982-11-25','2017-01-08','Georgia',10),(134,'Elvis','Murray','1999-03-08','2011-05-22','Saint Martin',10),(135,'Herrod','Watson','1985-11-24','2012-01-03','Côte D\'Ivoire (Ivory Coast)',8),(138,'Derek','Wood','1991-09-27','2015-02-06','Uruguay',8),(140,'Astra','Bright','1990-07-25','2016-12-11','Estonia',9),(142,'Chase','Barnes','1991-10-20','2012-04-30','Dominica',5),(143,'Levi','Barlow','1982-02-28','2015-03-18','Turkey',6),(144,'Illiana','Keller','1997-08-05','2015-04-19','Finland',2),(145,'Olympia','Evans','1969-10-07','2016-11-03','Croatia',3),(147,'Ima','Lloyd','1998-03-25','2012-02-19','Ecuador',3),(148,'Kelsie','Freeman','2000-09-04','2011-12-14','Anguilla',6),(149,'Hermione','Mcgee','1983-07-26','2012-11-04','Colombia',10),(150,'Chandler','Jennings','1969-11-11','2014-01-12','Albania',1),(152,'Imani','Gutierrez','1997-06-13','2011-12-28','Northern Mariana Islands',8),(154,'Hannah','Gates','1999-03-17','2016-03-22','Namibia',3),(155,'Alec','Lamb','1971-12-26','2012-06-06','Philippines',1),(159,'Giselle','Dickson','1985-09-28','2015-07-30','Cayman Islands',3),(160,'Kelsie','Hewitt','1996-08-16','2016-02-05','United Kingdom (Great Britain)',9),(161,'Indira','Allison','1985-12-12','2012-02-20','Namibia',1),(162,'Serena','Hardin','1969-08-06','2012-03-30','South Sudan',9),(163,'Juliet','Barry','1996-01-03','2017-02-05','Chad',4),(165,'Mariko','Richardson','1970-09-11','2015-02-25','Palestine, State of',9),(166,'Brenna','Meyers','1984-12-21','2013-03-06','French Polynesia',9),(168,'Hyatt','Ware','1988-07-16','2011-08-13','Saint Kitts and Nevis',9),(170,'Lamar','Michael','1983-03-19','2016-06-09','Ukraine',9),(171,'Uriel','Rasmussen','1995-08-27','2014-02-10','Poland',8),(173,'Shelly','Kelley','1972-10-10','2016-03-17','Trinidad and Tobago',6),(174,'August','Yates','1980-09-02','2011-10-13','Brunei',4),(175,'Brenden','Maynard','1968-10-09','2013-02-11','Dominica',9),(177,'Ebony','Witt','1993-06-19','2015-06-06','Rwanda',6),(178,'Ora','Valencia','1968-06-15','2016-12-11','Montserrat',3),(182,'Beverly','Long','1968-07-10','2014-08-16','Tanzania',4),(184,'Indira','Wilson','1992-10-01','2013-08-30','Anguilla',1),(186,'Ali','Silva','1977-02-19','2016-08-04','Laos',2),(187,'Kimberley','Willis','1987-01-25','2016-03-05','Monaco',1),(190,'Ocean','Collier','1992-05-14','2015-09-20','Peru',10),(191,'Denton','Robbins','1991-12-01','2012-08-12','Ethiopia',3),(192,'Constance','Mooney','1999-09-22','2012-03-07','Montenegro',8),(193,'Dora','Anthony','1989-08-10','2016-08-16','Northern Mariana Islands',2),(197,'Sandra','Pierce','1993-09-10','2016-08-31','Bangladesh',5);

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
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8;

/*Data for the table `rating` */

LOCK TABLES `rating` WRITE;

insert  into `rating`(`rating_ID`,`user_ID`,`movie_ID`,`score`) values (1,78,82,4),(2,12,69,8),(3,91,67,10),(4,22,99,4),(5,60,19,3),(11,91,81,6),(12,13,96,8),(13,49,98,5),(14,68,12,4),(15,68,79,10),(21,54,18,4),(22,8,72,4),(23,80,52,5),(24,96,26,9),(25,86,67,5),(26,100,29,10),(31,19,28,10),(32,63,91,5),(33,55,20,3),(34,81,70,3),(35,101,43,2),(36,39,34,7),(37,19,9,7),(41,35,27,4),(42,89,23,6),(43,23,55,4),(51,28,73,4),(52,22,64,2),(53,99,61,7),(54,56,32,10),(55,42,72,5),(61,72,40,8),(62,55,82,1),(71,74,87,10),(72,50,96,8),(73,23,86,1),(74,13,35,5),(75,74,99,2),(81,51,77,2),(82,74,41,2),(83,63,45,2),(84,15,50,5),(85,28,79,6),(86,80,72,8),(87,30,77,6),(91,81,77,9),(92,63,91,2),(93,67,36,1),(94,8,50,1),(101,86,43,6),(102,72,91,4),(103,30,88,5),(111,63,30,7),(112,54,44,9),(113,74,78,3),(114,28,54,10),(115,34,68,9),(116,51,96,5),(117,42,85,10),(121,58,87,1),(122,50,12,4),(123,41,97,8),(124,24,66,1),(125,72,73,3),(126,87,42,5),(131,74,10,8),(132,39,63,3),(133,39,15,8),(134,19,16,2),(135,12,27,5),(141,47,34,1),(142,23,94,3),(143,7,21,8),(144,67,91,7),(145,57,18,8),(151,42,96,6),(152,30,47,4),(153,74,64,2),(154,101,71,1),(155,49,39,1),(156,6,49,4),(161,19,48,9),(162,30,23,6),(163,86,24,2),(164,76,14,4),(171,100,29,2),(172,51,13,10),(173,22,40,10),(174,51,2,7),(175,56,94,9),(181,49,12,1),(182,7,68,1),(183,74,35,1),(184,41,66,1),(185,80,18,9),(186,19,54,2),(191,57,28,8),(192,28,87,4),(193,55,57,7),(194,67,29,6),(201,81,80,2),(202,76,40,8),(203,50,20,1),(204,15,80,1),(205,41,93,8),(206,74,72,10),(207,55,52,6),(208,57,14,1),(209,12,55,5),(211,91,96,8),(212,7,50,1),(213,49,84,4),(221,73,39,5),(222,60,34,10),(223,35,84,9),(224,56,1,8),(225,42,36,9),(226,102,35,10),(231,92,24,7),(232,74,21,10),(233,55,47,1),(234,96,50,8),(241,47,36,6),(242,91,38,10),(243,54,86,8),(251,102,12,8),(252,58,51,5),(253,22,65,8),(254,92,22,8),(255,57,15,2),(261,87,34,4),(262,8,83,10),(263,54,27,2),(264,91,94,7),(265,51,45,5),(266,23,21,7),(271,22,18,8),(272,60,80,2),(273,51,54,4),(274,7,65,10),(275,35,21,9),(276,12,53,4),(277,73,87,8),(281,50,86,10),(282,42,56,3),(283,13,8,5),(284,86,1,7),(285,89,50,8),(286,34,94,10),(291,28,11,4),(292,54,7,3),(293,23,46,2),(294,24,55,9),(295,56,36,3),(296,102,54,7),(297,102,15,10);

UNLOCK TABLES;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role` varchar(30) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

LOCK TABLES `role` WRITE;

insert  into `role`(`role`) values ('\roperator'),('actor'),('actress'),('artist'),('composer'),('DIRECTOR'),('montage'),('producer'),('protagonist'),('Roles duplicated'),('scenario'),('Starring');

UNLOCK TABLES;

/*Table structure for table `station` */

DROP TABLE IF EXISTS `station`;

CREATE TABLE `station` (
  `id_station` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_station`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `station` */

LOCK TABLES `station` WRITE;

insert  into `station`(`id_station`,`name`) values (24,'Днепропетровск'),(28,'Житомир'),(21,'Киев'),(23,'Кировоград'),(27,'Луцк'),(26,'Львов'),(29,'Полтава'),(25,'Харьков'),(22,'Черкасы');

UNLOCK TABLES;

/*Table structure for table `studio` */

DROP TABLE IF EXISTS `studio`;

CREATE TABLE `studio` (
  `studio_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`studio_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

/*Data for the table `studio` */

LOCK TABLES `studio` WRITE;

insert  into `studio`(`studio_ID`,`name`) values (1,'Egestas Duis Ac Ltd'),(2,'Risus Company'),(3,'Amet Luctus Vulputate Company'),(4,'Mauris Corporation'),(5,'Aenean Massa Corporation'),(6,'Amet LLP'),(7,'Nec LLC'),(8,'Semper Industries'),(9,'Sed Pede Ltd'),(10,'Sed Leo Cras LLC'),(11,'Pharetra Ut Pharetra Corp.'),(12,'Nisi Nibh Institute'),(13,'Amet Consectetuer Limited'),(14,'Dolor Elit Pellentesque Limited'),(15,'Vel Turpis Foundation'),(16,'Purus Gravida Incorporated'),(17,'Urna Justo Company'),(18,'Nec Urna Suscipit Incorporated'),(19,'Placerat Augue PC'),(20,'In Faucibus Inc.'),(21,'Duis Industries'),(22,'Euismod Mauris Eu Inc.'),(23,'Etiam Imperdiet Dictum Industries'),(24,'Non Industries'),(25,'Diam Corp.'),(26,'Netus LLC'),(27,'Turpis Non Enim Incorporated'),(28,'Velit Dui Semper Industries'),(29,'Sed Leo Consulting'),(30,'Ipsum Suspendisse Consulting'),(31,'Aenean Gravida Incorporated'),(32,'Dapibus LLC'),(33,'Mauris Sapien Cursus Institute'),(34,'Facilisis Magna LLP'),(35,'Semper Auctor Associates'),(36,'Risus Nulla Company'),(37,'Ligula Consectetuer LLC'),(38,'Quisque Company'),(39,'Adipiscing Elit Etiam LLP'),(40,'Nostra Industries'),(41,'Vehicula Foundation'),(42,'Lacus Associates'),(43,'Neque LLC'),(44,'Sodales Mauris Institute'),(45,'Ornare Libero At Institute'),(46,'Dis Associates'),(47,'Integer Aliquam Incorporated'),(48,'Donec Egestas Aliquam Industries'),(49,'Sit Corp.'),(50,'Tempus Industries'),(51,'Cursus Vestibulum Mauris Company'),(52,'Nunc Sed Inc.'),(53,'Pellentesque Eget Dictum Foundation'),(54,'Metus Aenean Sed LLP'),(55,'In Lobortis Tellus LLC'),(56,'Pede LLC'),(57,'Parturient Montes Associates'),(58,'Porttitor Vulputate Posuere Incorporated'),(59,'Posuere LLP'),(60,'Cursus Vestibulum Mauris Ltd'),(61,'Est Mollis Limited'),(62,'Convallis Ligula Donec Corporation'),(63,'Fringilla Donec Corporation'),(64,'Eu LLP'),(65,'Nisi Nibh LLC'),(66,'Eu Enim Etiam Corporation'),(67,'A Corporation'),(68,'Tristique Ac Associates'),(69,'Sit Ltd'),(70,'Tempus LLP'),(71,'Lorem Ipsum Associates'),(72,'Amet Consectetuer Ltd'),(73,'Vel Consulting'),(74,'Nulla LLC'),(75,'Nulla Cras Foundation'),(76,'Mauris Blandit Enim Company'),(77,'Dui Cum Consulting'),(78,'Nisi Nibh Corp.'),(79,'Sociis Natoque Penatibus PC'),(80,'Velit Institute'),(81,'Sodales LLP'),(82,'Sed Eu Eros LLC'),(83,'Eget Inc.'),(84,'A Auctor Limited'),(85,'Tellus Imperdiet Non Consulting'),(86,'Ullamcorper Velit In Inc.'),(87,'Accumsan Neque Associates'),(88,'Urna Consulting'),(89,'Maecenas Mi Felis Corp.'),(90,'Libero Consulting'),(91,'Ornare Libero At Corp.'),(92,'Eu Erat PC'),(93,'At Auctor Ullamcorper Corporation'),(94,'Dui Nec Urna LLP'),(95,'Vehicula LLP'),(96,'Donec LLP'),(97,'Aliquam Iaculis Lacus Associates'),(98,'Curabitur Sed Tortor Foundation'),(99,'Rhoncus Proin Inc.'),(100,'Cras Pellentesque Ltd');

UNLOCK TABLES;

/*Table structure for table `train` */

DROP TABLE IF EXISTS `train`;

CREATE TABLE `train` (
  `id_train` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  PRIMARY KEY (`id_train`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `train` */

LOCK TABLES `train` WRITE;

insert  into `train`(`id_train`,`number`) values (1,'1111А'),(2,'156К');

UNLOCK TABLES;

/*Table structure for table `unconfirmed_user` */

DROP TABLE IF EXISTS `unconfirmed_user`;

CREATE TABLE `unconfirmed_user` (
  `token` char(36) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `unconfirmed_user` */

LOCK TABLES `unconfirmed_user` WRITE;

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

insert  into `user`(`user_ID`,`login`,`password`,`name`,`surname`,`user_role_ID`,`image_ID`) values (1,'pauluxxx@mail.ru','1234','Pavel','Poimanov',2,4),(6,'Nulla@mollis.net','CSW76UHI9RG','Kibo','Pace',1,5),(7,'et.arcu.imperdiet@le','BJD67ZZP9XR','Scott','King',1,10),(8,'ac.metus@nuncsed.ca','ZMO16QVU7CW','Hillary','Leach',1,8),(12,'varius@malesuada.net','SSL95MKL9AF','Colette','Dunlap',1,10),(13,'pharetra.felis@habit','QLF26ZIM3IJ','Lilah','Ochoa',1,3),(15,'enim@egestas.org','MNC32ADB5UC','Magee','Cash',1,6),(19,'erat@nuncinterdum.co','CGS64DOF6VQ','Carl','Boyer',1,2),(22,'montes.nascetur@atau','SVQ39LGO1OE','Melinda','Delaney',1,4),(23,'commodo@dictum.ca','LFV61FRI7LE','Chelsea','Avery',1,1),(24,'risus.Donec.egestas@','MFZ38LUV8XJ','Alma','House',1,2),(28,'sed.hendrerit.a@eget','ZRD62EXT0UK','Kevyn','Nunez',1,10),(30,'ridiculus@urnaUt.org','NYY33ZAJ9VN','Cody','Maddox',1,3),(34,'Cum@ametultricies.ed','YZG03ECZ5RL','Kuame','Nixon',1,2),(35,'ligula.elit.pretium@','HSB22DMM3EJ','Kelly','England',1,7),(39,'gravida@quis.co.uk','JSG49RBE5ST','Macy','Yates',1,6),(41,'neque.Morbi.quis@acm','DYK11FGJ0BS','Sydney','Blake',1,4),(42,'ullamcorper.magna.Se','KZR48HYL7QS','Maris','Stokes',1,9),(44,'sodales.nisi@diamvel','AJT44BKS2SN','Fatima','Mcneil',1,2),(47,'auctor.quis.tristiqu','AGK91ZTG5ZF','Tanya','Downs',1,6),(49,'id@montesnasceturrid','VAY61XGO4PD','Riley','Oliver',1,10),(50,'ante@amet.net','XOX14SQK5GE','Leslie','Nash',1,5),(51,'sed@scelerisquelorem','SNE64OOM3MG','Camille','Meyer',1,2),(54,'dictum@risus.net','RAB36PKM3UV','Vivien','Battle',1,5),(55,'pede.et@iaculis.com','RQW54LFY7DT','Addison','Delacruz',1,10),(56,'consequat.lectus@tin','KDJ14EQG8HF','Cade','Baxter',1,6),(57,'commodo@Crasdolor.ca','ESC29WXQ8JX','Brian','Harper',1,7),(58,'ultrices@necligulaco','EVZ76KEF1ZS','Kelsey','Dawson',1,4),(60,'per.inceptos@sed.org','EFC70PJZ0IE','Kelsey','Nelson',1,2),(63,'Nam.tempor@Etiam.ca','DZJ89TUB5IZ','Coby','Robertson',1,5),(66,'risus.varius@necorci','UHN27PJB3ZP','Sigourney','Downs',1,5),(67,'ullamcorper.Duis.cur','OWU48TOD5AC','Judah','Parsons',1,5),(68,'lacus.Quisque.imperd','RJF54PAU7ER','Demetria','Levine',1,5),(72,'et.magnis.dis@ut.co.','SMM58COQ8PP','Alana','Davidson',1,2),(73,'at@velfaucibusid.org','TCZ65WIL1IT','Kai','Duffy',1,4),(74,'at.sem@NullamnislMae','YRN73RJZ6YO','Aubrey','Bonner',1,7),(76,'purus@aliquameuaccum','ZUY68TXW9IO','Chava','Dennis',1,3),(78,'massa@eleifend.co.uk','OJM10AVW7II','Wang','Kelley',1,3),(80,'Morbi.neque@laciniaS','PDR31KLS6QG','Charissa','Bell',1,6),(81,'Nullam.scelerisque@n','IXE84NAJ7LF','Constance','Bruce',1,6),(82,'nec.malesuada@lobort','WCS76FZG7LW','Danielle','Mendez',1,2),(86,'scelerisque.sed.sapi','ISU87BDH2ID','Blaze','Doyle',1,3),(87,'fames@Duissit.edu','LFX78IVJ5YP','Gil','Pope',1,4),(89,'mauris.ipsum.porta@a','SIH82JJB1TW','Walter','Guerrero',1,2),(91,'eros.Proin@sociisnat','UXV57IHH5PH','Dane','Kemp',1,3),(92,'congue@aliquamenim.n','ZCX87WCI2QF','Morgan','Hicks',1,6),(96,'eu.placerat@non.com','OFF35JIR1PM','Cassandra','Wiggins',1,3),(99,'eu@ornare.edu','IVM41BVD9JG','Bo','Peters',1,5),(100,'massa.Vestibulum@era','EEE70ZYK9EI','Dahlia','Petty',1,1),(101,'varius@malesuada.net','SSL95MKL9AF','Colette','Dunlap',1,10),(102,'newpavel@com.com','1234','Pavel','Poianov',2,1);

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
