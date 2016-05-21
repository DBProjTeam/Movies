/*Добавления фильмов*/
INSERT INTO image (image.image_ID,image.name) VALUES
(200,"movie/Post_BelliAndCebactian.jpg"),
(201,"movie/Post_BrodDog.jpg"),
(202,"movie/Post_GoodSleep.jpg");

INSERT INTO movie(movie.movie_ID,movie.runtime,movie.releaseDate,movie.year,movie.description,movie.image_ID,movie.title)
VALUES
(200,"1:35:30","2015-09-17",2015,"Сентябрь 1945 года. Все во французской горной деревушке празднуют окончание войны. Себастьян вырос — ему уже 10 лет. Вместе с Белль они с нетерпением ждут возвращения Анджелины. Однако позже они узнают, что девушка попала в авиакатастрофу в самом сердце заальпийских лесов. Вся деревня потеряла надежду за исключением дедушки Себастьяна Цезаря, который знает Пьера — человека способного помочь им найти Анджелину. На пути к ее спасению мальчику и его собаке предстоит выдержать множество опасностей, пройти через тысячи испытаний и узнать тайну, которая изменит жизнь Белль и Себастьяна навсегда. Приключение продолжается!",200,"Белль и Себастьян, приключение продолжается"),
(201,"1:45:49","2013-06-13",2013,"Чон-гу изготавливает самодельные бомбы и продает тем, кто готов их использовать. У него есть партнер — Хё-мин, который когда-то был его первым покупателем. Хё-мин — безрассудный и агрессивный человек. Он подталкивает Чон-гу к пропасти, откуда нет возврата. Но тот не поддается на провокации со стороны партнера, пока однажды случайно не убивает детектива, следившего за ним. Теперь у Хё-мина есть такой же, как и он сам, напарник.",201,"Бродячая собака"),
(202,"1:32:32","2011-09-15",2011,"Главный герой — Сесар, работающий консьержем в небольшом жилом доме, в Барселоне. Кажется, что он маленький незаметный человек, который лишь открывает и закрывает двери, но на самом деле он тот, кто замечает и знает про жителей многоквартирного дома абсолютно все. Он глубоко несчастлив и ищет хоть какую-нибудь причину для дальнейшего своего существования. День за днем он выполняет свою работу и, пока на него никто из жителей дома не обращает особого внимания, сам он неустанно наблюдает за ними. Он знает каждую мелочь в их жизнях, все о них, а в особенности про одну из них.",202,"Крепкий сон")
;
INSERT INTO movie_image(movie_image.movie_image_ID,movie_image.movie_ID,movie_image.image_ID) VALUES
(NULL,200,200),
(NULL,201,201),
(NULL,202,202)
;
INSERT INTO country(country.country) VALUES
("Франция"),
("Южная Корея"),
("Испания")
;
INSERT INTO movie_country(movie_country.movie_country_ID,movie_country.movie_ID,movie_country.country) VALUES
(NULL,200,"Франция"),
(NULL,201,"Южная Корея"),
(NULL,202,"Испания")
;
INSERT INTO genre(genre.genre) VALUES
("Драма"),
("Приключения"),
("Семейный"),
("Ужасы"),
("Триллер")
;
INSERT INTO movie_genre(movie_genre.movie_genre_ID,movie_genre.movie_ID,movie_genre.genre) VALUES
(NULL,200,"Приключения"),
(NULL,200,"Семейный"),
(NULL,201,"Драма"),
(NULL,202,"Ужасы"),
(NULL,202,"Триллер")
;
INSERT INTO studio (studio.studio_ID,studio.name) VALUES
(200,"Gaumont"),
(201,"Tongdaemun"),
(202,"OBERON")
;
INSERT INTO movie_studio(movie_studio.movie_studio_ID,movie_studio.movie_ID,movie_studio.movie_studio_ID) VALUES
(NULL,200,200),
(NULL,201,201),
(NULL,202,202)
;
/*Добавления Персон*/
INSERT INTO image(image.image_ID,image.name) VALUES 
(300,"person/Pers_Kristian_Duge.jpg"),
(301,"person/Pers_SesilObri.jpg"),
(302,"person/Pers_JulLegran.jpg"),
(303,"person/Pers_ChekiKario.jpg"),
(304,"person/Pers_JonXimKim.jpg"),
(305,"person/Pers_SunNumKim.jpg"),
(306,"person/Pers_JaumeBakagyjro.jpg"),
(307,"person/Pers_AlbertoMarini.jpg"),
(308,"person/Pers_XylioFepnandes.jpg")
;
INSERT INTO country (country.country) VALUES
("Канада"),
("Турция"),
("Италия")
;
INSERT INTO person(person.person_ID,person.name,person.surname,person.birth_date,person.death_date,person.country,person.image_ID) VALUES
(300,"Кристиан","Дюге","1957-02-03",NULL,"Канада",300),
(301,"Сесиль","Обри","1928-04-02","2010-05-19","Франция",301),
(302,"Жиль","Легран","1960-02-03",NULL,"Франция",302),
(303,"Чеки","Карио","1953-10-04",NULL,"Турция",303),
(304,"Юнг-xун","Ким","1980-03-020",NULL,"Южная Корея",304),
(305,"Со-ын","Ким","1988-04-27",NULL,"Южная Корея",305),
(306,"Жауме","Балагуэро","1968-06-02",NULL,"Испания",306),
(307,"Альберто","Марини","1972-03-25",NULL,"Италия",307),
(308,"Хулио","Фернандес","1959-09-14","2016-02-09","Испания",308)
;
/* Добавления персон фильм*/
INSERT INTO movie_person(movie_person.movie_person_ID,movie_person.movie_ID,movie_person.person_ID) VALUES 
(400,200,300),
(401,200,301),
(402,200,302),
(403,200,303),
(404,201,304),
(405,201,305),
(406,202,306),
(407,202,307),
(408,202,308)
;
INSERT INTO role(role) VALUE ("operator");
INSERT INTO movie_person_role(movie_person_role.movie_person_role_ID,movie_person_role.movie_person_ID,movie_person_role.role) VALUES
(NULL,400,"DIRECTOR"),
(NULL,401,"scenario"),
(NULL,402,"producer"),
(NULL,403,"actor"),
(NULL,404,"DIRECTOR"),
(NULL,404,"scenario"),
(NULL,405,"producer"),
(NULL,405,"actor"),
(NULL,406,"DIRECTOR"),
(NULL,407,"scenario"),
(NULL,408,"producer"),
(NULL,408,"operator")
;