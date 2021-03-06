/*Добавления фильмов*/
INSERT INTO image (image.image_ID,image.name) VALUES
(200,"movie/Post_BelliAndCebactian.jpg"),
(201,"movie/Post_BrodDog.jpg"),
(202,"movie/Post_GoodSleep.jpg"),
(203,"movie/Post_ZaprosInFrends.jpg"),
(204,"movie/Post_TemDelete.jpg"),
(205,"movie/Post_SleepGirl.jpg"),
(206,"movie/Post_GoodFromEgipet.jpg")
;
INSERT INTO movie(movie.movie_ID,movie.runtime,movie.releaseDate,movie.year,movie.description,movie.image_ID,movie.title)
VALUES
(200,"1:35:30","2015-09-17",2015,"Сентябрь 1945 года. Все во французской горной деревушке празднуют окончание войны. Себастьян вырос — ему уже 10 лет. Вместе с Белль они с нетерпением ждут возвращения Анджелины. Однако позже они узнают, что девушка попала в авиакатастрофу в самом сердце заальпийских лесов. Вся деревня потеряла надежду за исключением дедушки Себастьяна Цезаря, который знает Пьера — человека способного помочь им найти Анджелину. На пути к ее спасению мальчику и его собаке предстоит выдержать множество опасностей, пройти через тысячи испытаний и узнать тайну, которая изменит жизнь Белль и Себастьяна навсегда. Приключение продолжается!",200,"Белль и Себастьян, приключение продолжается"),
(201,"1:45:49","2013-06-13",2013,"Чон-гу изготавливает самодельные бомбы и продает тем, кто готов их использовать. У него есть партнер — Хё-мин, который когда-то был его первым покупателем. Хё-мин — безрассудный и агрессивный человек. Он подталкивает Чон-гу к пропасти, откуда нет возврата. Но тот не поддается на провокации со стороны партнера, пока однажды случайно не убивает детектива, следившего за ним. Теперь у Хё-мина есть такой же, как и он сам, напарник.",201,"Бродячая собака"),
(202,"1:32:32","2011-09-15",2011,"Главный герой — Сесар, работающий консьержем в небольшом жилом доме, в Барселоне. Кажется, что он маленький незаметный человек, который лишь открывает и закрывает двери, но на самом деле он тот, кто замечает и знает про жителей многоквартирного дома абсолютно все. Он глубоко несчастлив и ищет хоть какую-нибудь причину для дальнейшего своего существования. День за днем он выполняет свою работу и, пока на него никто из жителей дома не обращает особого внимания, сам он неустанно наблюдает за ними. Он знает каждую мелочь в их жизнях, все о них, а в особенности про одну из них.",202,"Крепкий сон"),
(203,"1:35:29","2016-03-09",2016,"Вас добавляет в друзья одноклассник, однокурсник или коллега с работы, с которым вы практически никогда не общались, и начинает буквально атаковать вас сообщениями, почему-то решив, что вы с ним лучшие друзья. Знакомая ситуация? В подобную попадает Лора — главная героиня леденящего кровь триллера «Запрос в друзья». Решение удалить из френд-листа навязчивую и странноватую однокурсницу приведет к таким последствиям, которые не смогли бы предугадать даже самые большие любители хорроров.",203,"Запрос в друзья"),
(204,"1:45:50","2016-02-05",2016,"Недалекое будущее. Экспериментальный отряд специальных агентов высаживается на необитаемом острове для прохождения интенсивных боевых учений. Но на острове высадился кто-то еще. И это — не люди.",204,"Команда уничтожить"),
(205,"1:38:40","2016-01-09",2016,"Томас Кайзер наследует родовое поместье, принадлежащее его семье многие поколения. Но он и не подозревает, что вместе с домом унаследовал и древнее проклятие, что лежит на нём со времён крестовых походов. Томас вынужден примерить на себя роль «хранителя» — того, кто не допустит, чтобы силы зла высвободились из поместья. Разгадать тайну дома ему помогут местный риелтор и священник, а также разбудить прекрасную Брайер Роуз, запертую в ужасном месте, которое Томас видел в своих снах.",205,"Проклятие Спящей красавицы"),
(206,"1:49:55","2016-02-08",2016,"Некогда мирное и процветающее египетское царство погружается в хаос: беспощадный бог тьмы Сет убивает своего брата Осириса и узурпирует трон. Вызов ему неожиданно бросает простой смертный, находчивый молодой вор. Чтобы вернуть к жизни свою прекрасную возлюбленную, ему приходится заручиться поддержкой могущественного и мстительного бога Гора. Лишь выдержав испытание на прочность и принеся в жертву все самое дорогое, им удастся противостоять Сету и его приспешникам в мире живых и мире мертвых.",206,"Боги Египта")
;
INSERT INTO movie_image(movie_image.movie_image_ID,movie_image.movie_ID,movie_image.image_ID) VALUES
(NULL,200,200),
(NULL,201,201),
(NULL,202,202),
(NULL,203,203),
(NULL,204,204),
(NULL,205,205),
(NULL,206,206)
;
INSERT INTO country(country.country) VALUES
("Франция"),
("Южная Корея"),
("Испания"),
("Германия"),
("Великобритания"),
("США"),
("Австралия")
;
INSERT INTO movie_country(movie_country.movie_country_ID,movie_country.movie_ID,movie_country.country) VALUES
(NULL,200,"Франция"),
(NULL,201,"Южная Корея"),
(NULL,202,"Испания"),
(NULL,203,"Германия"),
(NULL,204,"Великобритания"),
(NULL,205,"США"),
(NULL,206,"Австралия"),
(NULL,206,"США")
;
INSERT INTO genre(genre.genre) VALUES
("Драма"),
("Приключения"),
("Семейный"),
("Ужасы"),
("Триллер"),
("Фантастика")
;
INSERT INTO movie_genre(movie_genre.movie_genre_ID,movie_genre.movie_ID,movie_genre.genre) VALUES
(NULL,200,"Приключения"),
(NULL,200,"Семейный"),
(NULL,201,"Драма"),
(NULL,202,"Ужасы"),
(NULL,202,"Триллер"),
(NULL,203,"Триллер"),
(NULL,204,"Ужасы"),
(NULL,204,"Фантастика"),
(NULL,205,"Фантастика"),
(NULL,205,"Триллер"),
(NULL,206,"Фантастика"),
(NULL,206,"Приключения")
;
INSERT INTO studio (studio.studio_ID,studio.name) VALUES
(200,"Gaumont"),
(201,"Tongdaemun"),
(202,"OBERON"),
(203,"Deutsche Film AG"),
(204,"Ealing Studios"),
(205,"Columbia Pictures‎"),
(206,"FILM STAGES‎")
;
INSERT INTO movie_studio(movie_studio.movie_studio_ID,movie_studio.movie_ID,movie_studio.movie_studio_ID) VALUES
(NULL,200,200),
(NULL,201,201),
(NULL,202,202),
(NULL,203,203),
(NULL,204,204),
(NULL,205,205),
(NULL,205,206),
(NULL,206,206)
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
(308,"person/Pers_XylioFepnandes.jpg"),
(309,"person/Pesr_SimonFerxon.jpg"),
(310,"person/Pers_FilipKox.jpg"),
(311,"person/Pers_KvintBerg.jpg")
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
(306,"Жауме","Балагуэро","1968-findMovie06-02",NULL,"Испания",306),
(307,"Альберто","Марини","1972-03-25",NULL,"Италия",307),
(308,"Хулио","Фернандес","1959-09-14","2016-02-09","Испания",308),
(309,"Симон","Ферхоэвен","1972-08-17",NULL,"Германия",309),
(310,"Филип","Кох","1975-02-03",NULL,"Германия",310),
(311,"Квирин","Берг","1970-09-02",NULL,"Германия",311),
(312,"Стивен","Гомез","1968-04-05",NULL,"США",1)
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
(408,202,308),
(409,203,309),
(410,203,310),
(411,203,311),
(412,203,308),
(413,204,312)
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
(NULL,408,"operator"),
(NULL,409,"DIRECTOR"),
(NULL,410,"scenario"),
(NULL,411,"producer"),
(NULL,412,"operator"),
(NULL,413,"DIRECTOR"),
(NULL,413,"scenario")
;