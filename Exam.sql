create table Exam(
ExamID int,
id int,
subID int);
insert Exam values(1,1,1)
insert Exam values(2,2,2)
insert Exam values(3,3,3)

select * from Exam

alter table Exam
alter column ExamID int not null;

alter table Exam
add constraint pk_Exam primary key(ExamID);

alter table Exam
add constraint fk_Student foreign key(id) references Student(id);

alter table Exam
add constraint fk_Subject foreign key(subID) references Subject(subID);

select Exam.ExamID,Student.id,Student.studentname, Subject.subName
from Exam 
Inner join Subject
on Subject.subID=Exam.subID
Inner join Student 
on Exam.id=Student.id

select Exam.ExamID,Exam.id,Exam.subID,Subject.subID from Exam
left join Subject on Subject.subID=Exam.subID

select Exam.ExamID,Exam.ExamID,Exam.subID,Subject.subID,Subject.subName from Exam
right join Subject on Subject.subID=Exam.subID

select Exam.ExamID,Exam.id,Exam.subID,Subject.subID,Subject.subName from Exam
full outer join Subject on Subject.subID=Exam.subID

select Exam.ExamID,Exam.id,Exam.subID,Subject.subID,Subject.subName from Exam
cross join Subject

CREATE PROCEDURE SelectAllExam as
select * from Exam
go;
EXEC SelectAllExam;

create procedure SelectAllSubject @subName nvarchar(50) as
select * from Subject where subName=@subName

drop procedure SelectAllSubject

EXEC SelectAllSubject @subName='Maths';

create view [New Exam] as
select ExamID, subID from Exam
where id=3;
select * from [New Exam];