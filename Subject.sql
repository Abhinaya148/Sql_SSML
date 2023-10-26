create table Subject(
subID int,
subName varchar(50));

insert Subject values(1,'Physics')
insert Subject values(2,'Maths')
insert Subject values(3,'English')
insert Subject values(4,'Chemistry')
insert Subject values(5,'BEE')

select * from Subject

alter table Subject
alter column subID int not null;

alter table Subject
add constraint pk_Subject primary key(subID);

