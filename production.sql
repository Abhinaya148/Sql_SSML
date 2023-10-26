create table production(ProductID int);
insert into production(ProductID) values(4);
insert into production(ProductID) values(5);
insert into production(ProductID) values(6);

select * from production

alter table production
alter column ProductID int not null;

alter table production
add constraint pk_production primary key(ProductID);

alter table production
add manfid int;

alter table production
add carid int;

alter table production
add constraint fk_manufacture
foreign key(manfid) references manufacture(manfid);

alter table production
add constraint fk_car
foreign key(carid) references car(carid);


