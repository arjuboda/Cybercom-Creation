/* 3. Create a database structure for worldwide cricket team. Database will contain, each player’s name, its country, it’s expertise and so on. */

create database cricketData;
use cricketData;
/*
CREATE TABLE CricketTeam (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    expertise VARCHAR(100),
    Add other player attributes as needed 
    UNIQUE (player_name, country)
);

INSERT INTO CricketTeam (player_name, country, expertise) 
VALUES 
('Virat Kohli', 'India', 'Batsman'), 
('Jasprit Bumrah', 'India', 'Bowler'), 
('MS Dhoni', 'India', 'Wicketkeeper'), 
('Kane Williamson', 'New Zealand', 'Batsman');

select * from CricketTeam;  
*/

create table Players(
	playerID int primary key auto_increment,
    Name varchar(256),
    Country varchar(256)
);

insert into Players 
(name,Country)
values
('Virat','India'),
('Rohit','India'),
('MS dhoni','India'),
('Bumrah','India');

create table Expertice(
	id int primary key,
    Expertise varchar(256)
);

insert into Expertice
values
(1,'Batting'),
(2,'bowling'),
(3,'WC');

create table player_Expertise(
 PlayerID int,
 ExperticeID int,
 foreign key (PlayerID) references Players(playerID),
 foreign key(ExperticeID) references Expertice(id)
);

insert into player_Expertise values
(1,1),
(2,1),
(3,1),
(3,3),
(4,2);

select p.PlayerID ,p.Name,e.Expertise
from Players p 
inner join player_Expertise pe on p.PlayerID=pe.PlayerID
 inner join Expertice e on pe.ExperticeID=e.id