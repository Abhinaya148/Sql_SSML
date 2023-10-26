create table Employee(emp_id int,
emp_name varchar(250),
Gender varchar(2),
emp_role varchar(50));

insert Employee values(1033326,'Abhinaya','F','SoftwareEngineer');
insert Employee values(1033328,'Yeshwanth','M','Developer');
insert Employee values(1033351,'Ratan','F','Developer');
insert Employee values(1033334,'Mythrika','F','QualityAnalyst');
insert Employee values(1033311,'Bhavani','F','BusinessExcellence');
insert Employee values(1033342,'Akshay','M','Testing');
insert Employee values(1033349,'sai','M','BusinessAnalyst');
insert Employee values(1033324,'Vamshi','M','SoftwareAnalyst');
insert Employee values(1033319,'divya','F','Analyst');
insert Employee values(1033305,'priya','F','SoftwareEngineer');

select * from Employee

select distinct * from Employee;

select * from Employee where emp_role='Developer';
select * from Employee where emp_role='Developer' or emp_id=1033326;
select * from Employee where emp_role='Developer'and emp_id=1033351;
select * from Employee where not emp_role='Analyst';
select * from Employee where emp_id not between 1033330 and 1033345;

select * from Employee order by emp_id;

update Employee set emp_id=1033318
where emp_name='divya';

alter table Employee
add DOB date;
alter table Employee
drop column DOB;

select COUNT(emp_id),emp_role as count from Employee
where emp_id>1033320
group by emp_role;

select count(emp_id) as count,emp_role from Employee
group by emp_role
having count(emp_id)>=2;

create table students(stu_id int,
stu_name varchar(50));

insert students values(10,'Abhi');
insert students values(11,'Bhavani');
insert students values(12,'ratan');
insert students values(13,'harathi');
insert students values(14,'ramya');

select * from students;

alter table students
alter column stu_id int not null;

alter table students
add constraint pk_students primary key(stu_id);

create table subjects(sub_id int,
sub_title varchar(50));

insert subjects values(15,'Maths');
insert subjects values(16,'Physics');
insert subjects values(17,'English');
insert subjects values(18,'Social');
insert subjects values(19,'Sanskrit');
insert subjects values(20,'EG');
insert subjects values(21,'ITWS');
insert subjects values(11,'COA');
insert subjects values(12,'DE');
insert subjects values(13,'DBMS');
insert subjects values(14,'SQL');

alter table subjects
alter column sub_id int not null;
alter table subjects
add constraint pk_subjects primary key(sub_id);

select * from subjects


create table exams(exam_id int primary key,
exam_name varchar(50),
exam_day varchar(50));
insert exams values(25,'Maths','Thursday');
insert exams values(26,'Biology','Friday');
insert exams values(27,'COSM','Saturday');
insert exams values(28,'DMS','Monday');
insert exams values(11,'DS','Tuesday');
insert exams values(12,'DMS','Wednesday');
insert exams values(13,'Social','Thursday');

alter table exams
add constraint fk_students foreign key(exam_id) references students(stu_id);

alter table exams
add constraint fk_subjects foreign key(exam_id) references subjects(sub_id);

create view sample as
select exams.exam_id,students.stu_id,exams.exam_name,sub_title,stu_name from exams
inner join subjects on exams.exam_id=subjects.sub_id
inner join students on exams.exam_id=students.stu_id

select exams.exam_id,students.stu_id,exams.exam_name,sub_title,stu_name from exams
left join subjects on exams.exam_id=subjects.sub_id
left join students on exams.exam_id=students.stu_id

select exams.exam_id,students.stu_id,exams.exam_name,sub_title,stu_name from exams
right join subjects on exams.exam_id=subjects.sub_id
right join students on exams.exam_id=students.stu_id

select exams.exam_id, subjects.sub_title from exams
cross join subjects;

create view [SubjectNames] as 
select subjects.sub_id,subjects.sub_title from subjects

create view [ExamTab] as 
select exams.exam_name,exams.exam_day,exam_id from exams
where exam_id>=12;

select * from ExamTab;

CREATE PROCEDURE Quiz as
select * from subjects
exec Quiz;

create procedure Tests @exam_day varchar(50) as
select * from exams 
where exam_day=@exam_day;
exec Tests @exam_day='Thursday';

--user defined functions
create function resultset(@exam_day varchar(50))
returns table as return(
select exam_id,exam_day,exam_name from exams
where exam_day=@exam_day);
select * from resultset('Thursday');

create function result(@num1 int,@num2 int)
returns int as 
begin
return @num1+@num2;
end;
select dbo.result(5,8);

--formating dates

declare @d date=getdate();
select FORMAT(@d,'dd/MM/yyyy')as 'date'
,FORMAT(9390687360,'####-##-####')as ph_no;

select SYSDATETIME();

--error handling
create procedure Error as
select ERROR_NUMBER() as ErrorNumber,
ERROR_LINE() as ErrorLine,
ERROR_MESSAGE() as ErrorMessage,
ERROR_PROCEDURE() as ErrorProcedure,
ERROR_SEVERITY() as ErrorSeverity,
ERROR_STATE() as ErrorState;

begin try
select 10/0;
end try
begin catch
execute Error;
end catch

throw 57000, 'The record is null.',3;

--raise error
declare @StringVariable nvarchar(50);
set @StringVariable=N'<\<%5.4s>>';
raiserror(@StringVariable,10,1,'abhinaya');

--triggers
select * from exams
--for inserting a row into the table
create trigger tr_exams_ForInsert
on exams for insert as
begin
declare @exam_id int;
select @exam_id=exam_id from inserted;
end
insert exams values(10,'SQL','Sunday');

--deleting a row from the table
create trigger tr_exams_ForDelete
on exams For Delete as
begin
declare @exam_id int;
select @exam_id=exam_id from deleted;
end
delete from exams where exam_id=27;

--updating row in a table
create trigger tr_exams_ForUpdate
on exams For Update as
begin 
select * from inserted;
select * from deleted;
end
update exams set exam_name='DMS',exam_day='Monday'
where exam_id=28;
--instead of triggers
select * from sample
create trigger tr_sample on sample instead of insert as
begin
insert students(stu_id,stu_name)
select inserted.stu_id,inserted.stu_name from inserted;

insert subjects(sub_title)
select inserted.sub_title from inserted;
end
insert students values(25,'sam');
select * from students;
