create table car(carID int,
carmodel varchar,
color varchar);
alter table car
alter column carID int not null;

alter table car
alter column carmodel varchar(1) not null;

alter table car
alter column color varchar(1) not null;

select * from dbo.car
insert car values(115,'s','r');
insert car values(342,'t','k');
insert car values(165,'w','a');

alter table car
add constraint pk_car primary key(carid)