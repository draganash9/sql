use SEDCHome_test



select *
from Student
where FirstName = 'Antonio'

select * 
from Student
where DateOfBirth > '1999-01-01'

select *
from Student
where Gender = 'M'

select *
from Student
where LastName like 't%'

select *
from Student
where EnrolledDate = '1998-01-01'

select *
from Student
where LastName like 'J%' and EnrolledDate = '1998-01-01'

select *
from Student
where FirstName = 'Antonio'
order by LastName

select *
from Student
order by FirstName

select *
from Student
where Gender = 'M'
order by EnrolledDate DESC

select FirstName
from Teacher
union all
select FirstName
from Student

select LastName
from Teacher
union
select LastName
from Student

select FirstName 
from Teacher
intersect 
select FirstName
from Student

alter table GradeDetails 
add constraint DF_GradeDetails_AchivementMaxPoints
default 100 for [AchievementMaxPoints]

alter table GradeDetails with check
add constraint CHK_GradeDetails_AchievementPoints
check(AchievementPoints<=100)

alter table AchievementType with check
add constraint UC_Name unique (Name)

alter table [Grade]  with check
add constraint [FK_Grade_Course] foreign key([CourseID])
references [Course] ([ID])

alter table [dbo].[Grade]  with check
add constraint [FK_Grade_Student] foreign key([StudentID])
references [dbo].[Student] ([ID])

alter table [dbo].[Grade]  with check
add constraint [FK_Grade_Teacher] foreign key([TeacherID])
references [dbo].[Teacher] ([ID])

alter table [dbo].[GradeDetails]  with check
add constraint [FK_GradeDetails_AchievementType] foreign key([AchievementTypeID])
references [dbo].[AchievementType] ([ID])

alter table [dbo].[GradeDetails]  with check
add constraint [FK_GradeDetails_Grade] foreign key([GradeID])
references [dbo].[Grade] ([ID])

select c.Name as [Course name], at.Name as [Achievement type name]
from Course c
CROSS JOIN AchievementType at

select distinct T.FirstName, T.LastName
from Teacher T
INNER JOIN Grade G 
on G.TeacherID = T.ID

select distinct T.FirstName, T.LastName
from Teacher T
LEFT JOIN Grade G 
on T.ID = G.TeacherID
where G.TeacherID IS NULL

select S.FirstName, S.LastName
from Grade G
RIGHT JOIN Student S
on G.StudentID = S.ID
where G.StudentID IS NULL

