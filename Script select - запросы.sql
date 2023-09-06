--Название и продолжительность самого длительного трека.(исправил)
select track_name, track_len from tracks
where track_len = (
	select max(track_len) from tracks
);

--Название треков, продолжительность которых не менее 3,5 минут.(исправил)
select track_name from tracks
where track_len >= '00:03:30';

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.(верно)
select compilation_name from compilations 
where date(compilation_year) between '01.01.2018' and '31.12.2020';

--Исполнители, чьё имя состоит из одного слова.(верно)
SELECT * FROM artists
WHERE LENGTH(artist_name) - LENGTH(REPLACE(artist_name, ' ', '')) = 0;

--Название треков, которые содержат слово «мой» или «my».(исправил)
select track_name from tracks
where track_name ilike('мой %') or track_name ilike('my %') 
or track_name ilike('% мой') or track_name ilike('% my') 
or track_name ilike('% мой %') or track_name ilike('% my %')
or track_name ilike('мой') or track_name ilike('my')

--Количество исполнителей в каждом жанре.(верно)
select genre_name, count(artist_name) from artists a 
join artist_genre ag on a.artist_id = ag.artist_id
join genres g on ag.genre_id= g.genre_id
group by genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.(исправил)
select count(track_name) from tracks t 
join albums aa on aa.album_id  = t.album_id
where date(album_date) between '01.01.2019' and '31.12.2020';

--Средняя продолжительность треков по каждому альбому.(исправил)
select album_name, AVG(track_len) from tracks t
join albums aa on aa.album_id  = t.album_id
group by album_name;

--Все исполнители, которые не выпустили альбомы в 2020 году.(исправил)
select artist_name from artists
where artist_name not in(
	select artist_name from artists a
	join artist_album aa2 on aa2.artist_id = a.artist_id 
	join albums a2 on a2.album_id =aa2.album_id 
	where extract (year from album_date) = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).(исправил)
select distinct  compilation_name from compilations c
join compilation_track ct on ct.compilation_id = c.compilation_id
join tracks t  on t.track_id = ct.track_id
join albums a2 on a2.album_id = t.album_id
join artist_album aa on aa.album_id = a2.album_id
join artists a on a.artist_id = aa.artist_id
where artist_name like ('Лизер')
