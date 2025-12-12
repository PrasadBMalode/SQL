create database movies_db;
use movies_db;
create table movies_info(
moviesId char(4) primary key,
movieName varchar(15) not null unique,
actorName  varchar(15) not null,
actressName varchar(15) not null,
releaseDate date not null,
movieRating int check(movieRating >0),
movieZoner varchar(15) not null,
movieBudget char(5) not null
);
alter table movies_info add directorName varchar(15) not null;
alter table movies_info add movieProfit char(6) not null;

desc movies_info;

insert into movies_info values('mo01','KGF','Yesh','Shrinidi','2022-01-25',9,'Action','100cr','prashanth neel','1000cr');
insert into movies_info values('mo02','KGF2','Yesh','Shrinidi','2022-01-25',9,'Action','100cr','prashanth neel','1000cr');
insert into movies_info values('mo03','kantara','Rishab','Rukmini','2022-01-25',9,'Action','100cr','Rishab Shetti','1000cr');
insert into movies_info values('mo04','kantara2','Rishab','Rukmini','2024-01-25',9,'Action','100cr','Rishab Shetti','1000cr');
insert into movies_info values('mo05','mungaruMale','Ganesh','Malvika','2020-01-25',9,'Love','10cr','RaviKumar yadav','45cr');
insert into movies_info values('mo06','mungaruMale2','Ganesh','Malvika','2021-01-25',9,'Love','11cr','RaviKumar yadav','50cr');
insert into movies_info values('mo07','HaryPotter1','Daniyal','Emma watsan','2001-01-25',9,'Sci-fi','100cr','Chris Columbus','1000cr');
insert into movies_info values('mo08','HaryPotter2','Daniyal','Emma watsan','2002-01-25',9,'Supper natural','100cr','Chris Columbus','1000cr');
insert into movies_info values('mo09','HaryPotter3','Daniyal','Emma watsan','2003-01-25',9,'Supper natural','100cr','Alfonso Cuarón','1000cr');
insert into movies_info values('mo10','HaryPotter4','Daniyal','Emma watsan','2004-01-25',9,'Supper natural','100cr','Alfonso Cuarón','1000cr');


select * from movies_info;

create table director_info(
director_id char(4) primary key,
director_name varchar(15) not null,
place varchar(15) not null
);
desc director_info;
insert into director_info values ('di01','Prasad','Bangalore');
insert into director_info values ('di02','Daya','Bangalore');
insert into director_info values ('di03','Ashish','Bangalore');
insert into director_info values ('mo01','Prashant neel','Bangalore');
select * from director_info;

alter table movies_info add director_id char(4), add foreign key(director_id) references director_info(director_id);
select * from movies_info;

select * from movies_info where actressName='Shrinidi' and movieZoner='Action';
select * from movies_info where movieName='KGF' or  movieZoner='Action';
select * from movies_info where actressName in('Shrinidi','Rukmini');
select * from movies_info where actressName not in('Shrinidi','Rukmini');
select * from movies_info where actressName like 'M%';
select * from movies_info where actressName like '_h%';
select * from movies_info where directorName like '%neel%';
select * from movies_info where actressName not like 'M%';

select * from movies_info where director_id is not null;
select * from movies_info where director_id is null;
select * from movies_info where movieProfit>40 and movieProfit<=50;
select * from movies_info where releaseDate between '2020-01-01' and '2022-01-30';
select * from movies_info where releaseDate not between '2020-01-01' and '2022-01-30';
select * from movies_info order by movieProfit desc;
select * from movies_info order by movieProfit asc;
select * from movies_info order by releaseDate desc;
select * from movies_info order by releaseDate asc;

select moviesId,movieName,directorName from movies_info;
select moviesId as filmId,movieName,directorName from movies_info;

select d1.director_id, d1.director_name, m1.movieName, m1.moviesId 
from movies_info as m1 inner join director_info as d1;

select * from movies_info inner join director_info;


select count(director_id) from director_info;
select avg(movieProfit) from movies_info;
select max(movieProfit) from movies_info;
select min(movieProfit) from movies_info;
select sum(movieProfit) from movies_info;
select max(movieProfit) from movies_info where movieProfit <(select max(movieProfit) from movies_info);

select max(movieProfit) from movies_info where movieProfit
<(select max(movieProfit) from movies_info where movieProfit <(select max(movieProfit) from movies_info));

select min(movieProfit) from movies_info where movieProfit 
>(select min(movieProfit) from movies_info);

select min(movieProfit) from movies_info where movieProfit
>(select min(movieProfit) from movies_info where movieProfit 
>(select min(movieProfit) from movies_info));

select min(movieProfit) from movies_info where movieProfit
>(select min(movieProfit) from movies_info where movieProfit
>(select min(movieProfit) from movies_info where movieProfit 
>(select min(movieProfit) from movies_info)));


select d1.director_id, d1.director_name, m1.movieName, m1.moviesId
 from movies_info as m1 cross join director_info as d1
 where d1.director_name=m1.directorName;
 
 select d1.director_id, d1.director_name, m1.movieName, m1.moviesId
 from movies_info as m1 left join director_info as d1
 on d1.director_name=m1.directorName;
 
 select d1.director_id, d1.director_name, m1.movieName, m1.moviesId
 from movies_info as m1 right join director_info as d1
 on d1.director_name=m1.directorName;
 
 select d1.director_id, d1.director_name, m1.movieName, m1.moviesId
 from movies_info as m1 left join director_info as d1
 on d1.director_name=m1.directorName
 union
 select d1.director_id, d1.director_name, m1.movieName, m1.moviesId
 from movies_info as m1 right join director_info as d1
 on d1.director_name=m1.directorName;
 
  select * from movies_info where moviesId in (select director_id from director_info);
  

  
  