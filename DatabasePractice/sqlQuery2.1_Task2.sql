/*2.	Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring". Return the result table ordered by rating in descending order.
*/
create database cinemaInformation;
use cinemaInformation;

create table Cinema(
	id int primary key,
    movie varchar(256) unique,
    description varchar(256),
    rating float
);

insert into Cinema(id,movie,description,rating)
values('1','War','great 3D','8.9'),
('2','Science','fiction','8.5'),
('3','irish','boring','6.2'),
('4','Ice song ','Fantacy','8.6'),
('5','House card ','Interesting',' 9.1');

select * from Cinema where id%2<>0 and description<>'boring' order by rating desc; 