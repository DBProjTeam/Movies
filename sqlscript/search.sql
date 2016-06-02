DELIMITER $$

USE `movies`$$

DROP PROCEDURE IF EXISTS `findMovie`$$

CREATE DEFINER=`pavel`@`%` PROCEDURE `findMovie`(IN movietitle VARCHAR(30),IN c BOOLEAN,IN g BOOLEAN,IN s BOOLEAN,IN Coun VARCHAR(30),IN Genr VARCHAR(30),IN Stud VARCHAR(30),IN from_year INT, IN to_year INT)
BEGIN
	
	SELECT  RTRIM(movietitle)  INTO movietitle;
	
	
	SET @sQuery = CONCAT("SELECT movie.`movie_ID`,movie.`year`,movie.`runtime`,movie.`releaseDate`,movie.`image_ID`,movie.`description`,movie.`title`FROM movie ");
	SET @wherecause = CONCAT(" where ");
	
	IF (movietitle='') THEN
		SET @wherecause = CONCAT(@wherecause," ISNULL(title) ");
	ELSE 	
		SELECT  CONCAT('%',movietitle,'%') INTO movietitle;
		SET @title = movietitle;
		SET @wherecause = CONCAT(@wherecause," movie.title like ","'@title'");
	END IF;
	
	
	SET @from_year = from_year;
	SET @to_year = to_year;
	SET @wherecause = CONCAT(@wherecause," and movie.year BETWEEN ",'@from_year',' and ',' @to_year ');
	
	IF (c)THEN
		SET @country = Coun;
		SET @sQuery = CONCAT(@sQuery," INNER JOIN `movie_country` ON (movie_country.movie_id=movie.movie_id) ");
		SET @wherecause = CONCAT(@wherecause," AND movie_country.country = ",'@country');
	END IF;	
	IF (g)THEN
		SET @genre = Genr;
		SET @sQuery = CONCAT(@sQuery," INNER JOIN `movie_genre` ON (movie_genre.movie_id=movie.movie_id) ");
		SET @wherecause = CONCAT(@wherecause," AND genre= ",'@genre');
	END IF;	
	IF (s)THEN
		SET @studio = Stud;
		SET @sQuery = CONCAT(@sQuery," INNER JOIN `movie_studio`ON(movie_studio.movie_id=movie.movie_id) ");
		SET @wherecause = CONCAT(@wherecause," AND studio_Id = ",'@studio');
	END IF;	
	
	SET @sQuery = CONCAT(@sQuery,@wherecause);
	PREPARE stmt FROM @sQuery;
	EXECUTE stmt ;
	
    END$$

DELIMITER ;