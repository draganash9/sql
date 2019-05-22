use SEDCHome_test

SELECT COUNT(Grade) AS Total
FROM Grade

SELECT T.ID AS [Teacher ID], T.FirstName, T.LastName, COUNT(TeacherID) AS [Total grades]
FROM Grade G JOIN Teacher T
ON G.TeacherID = T.ID
GROUP BY  T.ID, T.FirstName, T.LastName
ORDER BY T.ID ASC

SELECT T.ID AS [Teacher ID], T.FirstName, T.LastName, COUNT(TeacherID) AS [Total grades]
FROM Grade G JOIN Teacher T
ON G.TeacherID = T.ID
WHERE G.StudentID <= 100
GROUP BY  T.ID, T.FirstName, T.LastName
ORDER BY T.ID ASC

SELECT G.StudentID, S.FirstName, S.LastName, Max(Grade) AS [Max grade], AVG(Grade) AS [Average grade]
FROM Grade G JOIN Student S
ON G.StudentID = S.ID
GROUP BY G.StudentID, S.FirstName, S.LastName
ORDER BY G.StudentID

SELECT T.ID AS [Teacher ID], T.FirstName, T.LastName, COUNT(TeacherID) AS [Total grades]
FROM Grade G JOIN Teacher T
ON G.TeacherID = T.ID
GROUP BY  T.ID, T.FirstName, T.LastName
HAVING COUNT(TeacherID) > 200
ORDER BY T.ID ASC

SELECT T.ID AS [Teacher ID], T.FirstName, T.LastName, COUNT(TeacherID) AS [Total grades]
FROM Grade G JOIN Teacher T
ON G.TeacherID = T.ID
WHERE G.StudentID <= 100
GROUP BY  T.ID, T.FirstName, T.LastName
HAVING COUNT(TeacherID) > 50
ORDER BY T.ID ASC

SELECT G.StudentID, S.FirstName, S.LastName, COUNT(Grade) AS [Grade count], Max(Grade) AS [Max grade], AVG(Grade) AS [Average grade]
FROM Grade G JOIN Student S
ON G.StudentID = S.ID
GROUP BY G.StudentID, S.FirstName, S.LastName
HAVING MAX(Grade) = AVG(Grade)
ORDER BY G.StudentID

SELECT S.FirstName, S.LastName, COUNT(Grade) AS [Grade count], Max(Grade) AS [Max grade], AVG(Grade) AS [Average grade]
FROM Grade G JOIN Student S
ON G.StudentID = S.ID
GROUP BY S.FirstName, S.LastName
HAVING MAX(Grade) = AVG(Grade)
ORDER BY S.FirstName