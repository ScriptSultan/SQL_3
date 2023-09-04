-- заполнение альбомы
insert into albums(album_name, album_date) values
	('Смерть', '2020-12-12'),
	('Любовь', '2019-12-12'),
	('Роботы', '2022-12-12');
	

-- заполнение артисты
insert into artists(artist_name) values
	('Лизер'), 
	('Боливуд'), 
	('Салуки'), 
	('Бьянка G');

-- заполнение жанры 
insert into genres(genre_name) values
	('Рэр'), 
	('Рок'), 
	('Джаз'), 
	('Хип-хоп');

-- заполнение сборники
insert into compilations(compilation_name, compilation_year) values
	('Сборник 1', '2022-12-12'), 
	('Сборник 2', '2019-12-12'), 
	('Сборник 3', '2020-12-12'), 
	('Сборник 4', '2021-12-12');

-- заполнение треки
insert into tracks(track_name, track_len, album_id) values
	('Круто', '00:03:15', 1), 
	('Пламойкать', '00:04:15', 2), 
	('Лень', '00:03:30', 3), 
	('Спасибо', '00:03:00', 3),
	('Спасите my', '00:05:15', 1),
	('Кома', '00:03:19', 2),
	('Хочу', '00:02:15', 2);

--Заполнение таблицы артист-альбом
insert into artist_album(artist_id, album_id) values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 3);

--Заполнение таблицы треки - сборники
insert into compilation_track(track_id, compilation_id) values
	(22, 1),
	(23, 2),
	(24, 3),
	(25, 4),
	(26, 1),
	(27, 2),
	(28, 3);

--Заполнение таблицы артист-жанр
insert into artist_genre(artist_id, genre_id) values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4);

