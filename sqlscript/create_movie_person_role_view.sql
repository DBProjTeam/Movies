CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `movie_person_role_view` AS
  select
    `person`.`person_ID`       AS `person_ID`,
    `person`.`name`            AS `name`,
    `person`.`surname`         AS `surname`,
    `person`.`birth_date`      AS `birth_date`,
    `person`.`death_date`      AS `death_date`,
    `person`.`country`         AS `country`,
    `person`.`image_ID`        AS `image_ID`,
    `movie_person`.`movie_ID`  AS `movie_ID`,
    `movie_person_role`.`role` AS `role`
  from ((`movie_person_role`
    join `movie_person`
      on ((`movie_person_role`.`movie_person_ID` = `movie_person`.`movie_person_ID`)))
    join `person`
      on ((`movie_person`.`person_ID` = `person`.`person_ID`)))
