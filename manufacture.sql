create table manufacture(
manfid int,
manfname varchar(50),
location varchar(50));

insert manufacture values(1,'abc','def')
insert manufacture values(2,'ews','jgh')
insert manufacture values(3,'rty','jaw')

select * from manufacture

alter table manufacture
alter column manfid int not null;

alter table manufacture
add constraint pk_manufacture primary key(manfid);