DELIMITER $$

USE `movies`$$

DROP PROCEDURE IF EXISTS `findMovie`$$
/*if you want to use my procedure you have to give 6 parameters
movietitle 
can be '' it will be proccesed like find with no title if you do not give others parametes
in this case if no params given you will recive all film in table movie
 
coun
it is a filter for movie wich complain to movie table one more table movie_country 
Genr
it is a filter for movie wich complain to movie table one more table movie_genre
Stud 

it is a filter for movie wich complain to movie table one more table movie_studio 
p.s. in this version need a studio_id format in table studio in future can be a name of studio

from to 
it filter for movie to field movie.year
all params can be '' that means that parameter will be ignored in squery 

*/
CREATE DEFINER=`pavel`@`%` PROCEDURE `findMovie`(IN movietitle VARCHAR(30),IN Coun VARCHAR(30),IN Genr VARCHAR(30),IN Stud VARCHAR(30),IN from_year  VARCHAR(5), IN to_year  VARCHAR(5))
BEGIN
	SELECT  RTRIM(movietitle)  INTO movietitle;
	
	SET @sQuery = CONCAT("SELECT movie.`movie_ID`,movie.`year`,movie.`runtime`,movie.`releaseDate`,movie.`image_ID`,movie.`description`,movie.`title`FROM movie ");
	SET @wherecause = CONCAT(" where ");
	
	SET @country = CONCAT('%',Coun,'%');
	SET @studio = CONCAT('%',Stud,'%');
	SET @genre = CONCAT('%',Genr,'%');
	
	SET @from_year = from_year;
	SET @to_year = to_year;
	
	SET @title = movietitle;
	
	SET @title =  CONCAT('%',movietitle,'%');
	IF (@title !='%%') THEN
	SET @wherecause = CONCAT(@wherecause," movie.title like ","@title");
	ELSE SET @wherecause = CONCAT(@wherecause," (movie.title like ","@title"," OR ISNULL (title))");
	END IF;
	
	/*from and to params obtained if it need*/
	IF (@from_year!='')THEN
		IF (@to_year!='')THEN 
		SET @wherecause = CONCAT(@wherecause," and (movie.year >= ",'@from_year',' and ',' movie.year <= @to_year )');
		ELSE SET @wherecause = CONCAT(@wherecause," and movie.year >= @from_year"); 
		END IF;
	ELSE  IF (@to_year!='')THEN SET @wherecause = CONCAT(@wherecause," and movie.year <= @to_year"); END IF;  
	END IF;	
	
	/*country genre studio params obtained if need */
	IF (@country!='%%')THEN
		SET @sQuery = CONCAT(@sQuery," INNER JOIN `movie_country` ON (movie_country.movie_id=movie.movie_id) ");
		SET @wherecause = CONCAT(@wherecause," AND movie_country.country like ",'@country');
	END IF;	
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
	EXECUTE stmt ;
	
    END$$

DELIMITER ;