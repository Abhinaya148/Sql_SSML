create procedure usp_GetErrorInfo as
select ERROR_NUMBER() as ErrorNumber,
ERROR_SEVERITY() as ErrorSeverity,
ERROR_STATE() as ErrorState,
ERROR_PROCEDURE() as ErrorProcedure,
ERROR_LINE() as ErrorLine,
ERROR_MESSAGE() as ErrorMessage;
go

begin try
--generate divide by zero error
select 1/0;
end try
begin catch
--execute error retrieval routine
execute usp_GetErrorInfo;
end catch;

begin transaction
begin try
--generates a constraint violation error
delete from Production.Product 
where ProductID=980;
end try
begin catch
select ERROR_NUMBER() as ErrorNumber,
ERROR_SEVERITY() as ErrorSeverity,
ERROR_STATE() as ErrorState,
ERROR_PROCEDURE() as ErrorProcedure,
ERROR_LINE() as ErrorLine,
ERROR_MESSAGE() as ErrorMessage;
if @@TRANCOUNT >0
rollback transaction;
end catch;

if @@TRANCOUNT>0
commit transaction;
go

throw 51000, 'The record does not exist.',1;

declare @StringVariable nvarchar(50);
set @StringVariable=N'<\<%7.3s>>';
raiserror (@StringVariable,10,1,N'abcde');
go

