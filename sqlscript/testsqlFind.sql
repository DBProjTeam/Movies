SELECT * FROM movie INNER JOIN `movie_genre` ON (movie_genre.movie_id=movie.movie_id)
INNER JOIN `movie_country` ON (movie_country.movie_id=movie.movie_id)
INNER JOIN `movie_studio`ON(movie_studio.movie_id=movie.movie_id) 
WHERE title LIKE '%a' AND movie_country.country ='Uruguay' AND genre='drama' AND studio_Id = 16 AND movie.`year` BETWEEN 2000 AND 2018