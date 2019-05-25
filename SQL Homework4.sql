use SEDCHome_test

declare @FirstName nvarchar(20)
set @FirstName = 'Antonio'

select *
from Student
where FirstName = @FirstName
go

declare @FemaleSt table
(StudentID int, StudentName nvarchar(20), DateOfBirth date)

insert into @FemaleSt
select ID, FirstName, DateOfBirth
from Student
where Gender='f'

select *
from @FemaleSt
go

create table #MaleStudentsA
(LastName nvarchar(20), EnrollDate date)

insert into #MaleStudentsA
select LastName,EnrolledDate
from Student
where Gender='m' and FirstName like 'A%'

select *
from #MaleStudentsA
where len(LastName)=7
go

create function dbo.fn_FormatStudentName(@StudentId int)
returns nvarchar(2000)
as
begin

declare @Result nvarchar(2000)

select @Result = SUBSTRING(StudentCardNumber, 4, 5) + ' - ' + LEFT(FirstName, 3) + '.' + LastName
from Student
where ID=@StudentId

return @Result
end
go

select *,dbo.fn_FormatStudentName(1) as [Function outcome]
from Student
where ID=1
go


create function dbo.fn_StudentsWhoPassed (@TeacherID int, @CourseID int)
returns @TableResult table 
(FirstName nvarchar(20), LastName nvarchar(20), Grade int, CreatedDate datetime)
as 
begin

insert into @TableResult
select S.FirstName as StudentsFirstName, S.LastName as StudentsLastName, Grade, CreatedDate as CreatedDate
from Grade G
inner join Teacher T on t.ID=g.TeacherID
inner join Course C on c.ID=g.CourseID
inner join Student S on s.ID=g.StudentID
where t.ID=@TeacherID and c.ID=CourseID
group by s.FirstName,s.LastName,Grade,CreatedDate
order by Grade

return
end

go

declare @TeacherID int
set @TeacherID=7

declare @CourseID int
set @CourseID=7

select *
from dbo.fn_StudentsWhoPassed(@TeacherID, @CourseID)