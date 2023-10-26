create table Student(
id int,
studentname varchar(50));

insert Student values(1,'Abhi')
insert Student values(2,'Ratan')
insert Student values(3,'Bhavana')
insert Student values(4,'divya')

select * from Student

alter table Student
alter column id int not null;

alter table Student
add constraint pk_Student primary key(id);




