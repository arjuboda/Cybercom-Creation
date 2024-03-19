use college;

select * from students;

create table grade(
 id int primary key,
 studentID int unique,
 semester1 float ,
 semester2 float ,
 semester3 float ,
 semester4 float ,
 semester5 float ,
 semester6 float 
);

insert into grade 
values
(1,1,9.1,9.7,9.4,9.2,9.5,8.9),
(2,2,8.1,9.5,6.4,9.22,5.5,9.01),
(3,4,9.1,8.7,7.9,8.2,9.5,9.2);

select 
s.student_id,s.student_name,s.gender,
g.semester1,g.semester2,g.semester3,g.semester4,g.semester5, g.semester6
from students s  right join grade g 
on s.student_id=g.studentID;