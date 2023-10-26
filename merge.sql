create table source(id int, name varchar(50));
insert source values (11,'Abhi');
insert source values(12,'Sam');
insert source values(13,'Ram');
insert source values(14,'jeev');

create table target(id int,name varchar(50));
insert target values(11,'Abhinaya');
insert target values(13,'Ram');
insert target values(15,'dev');

select * from source;
select * from target;

merge target as t
using source as s
on s.id=t.id
when matched then
update set t.name=s.name
when not matched by target then
insert (id,name) values (s.id,s.name)
when not matched by source then
delete;

drop table source;
drop table target;