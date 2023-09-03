--Название и продолжительность самого длительного трека.
select max(track_name), max(track_len) from tracks;

--Название треков, продолжительность которых не менее 3,5 минут.
select track_name from tracks
where track_len > 3.5;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select compilation_name from compilations 
where date(compilation_year) between '01.01.2018' and '31.12.2020';

--Исполнители, чьё имя состоит из одного слова.
SELECT * FROM artists
WHERE LENGTH(artist_name) - LENGTH(REPLACE(artist_name, ' ', '')) = 0;

--Название треков, которые содержат слово «мой» или «my».
select track_name from tracks
where track_name like('%мой%') or track_name like('%my%')

--Количество исполнителей в каждом жанре.
select genre_name, count(artist_name) from artists a 
join artist_genre ag on a.artist_id = ag.artist_id
join genres g on ag.genre_id= g.genre_id
group by genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select album_date, count(track_name) from tracks t 
join artist_album aa on aa.artist_id = t.artist_id
join albums a on a.album_id= aa.album_id
where date(album_date) between '01.01.2019' and '31.12.2020'
group by album_date;

--Средняя продолжительность треков по каждому альбому.
select album_name, AVG(track_len) from tracks t 
join artist_album aa on aa.artist_id = t.artist_id
join albums a on a.album_id= aa.album_id
group by album_name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
select artist_name from artists a
join artist_album aa on aa.artist_id = a.artist_id
join albums al on al.album_id= aa.album_id
where extract(year from album_date) != 2020;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select compilation_name from compilations c
join compilation_artist f on f.compilation_id = c.compilation_id
join artists a on a.artist_id = f.artist_id
where artist_name like ('Лизер')