---------------------------------------------------------------------
--UNION / UNION ALL / INTERSECT
--------------------------------------------------------------------
SELECT CourseName AS 'Name' FROM Course
UNION 
SELECT FacultyName AS 'Name' FROM Faculty

--Faculty who is also a mentor
SELECT FacultyID AS 'Faculty' FROM Faculty
INTERSECT
SELECT FacultyMentor AS 'Faculty' FROM Faculty

--Task: Try to do it without using INTERSECT

---------------------------------------------------------------------
--EXISTS 
---------------------------------------------------------------------
SELECT * FROM Course
WHERE EXISTS (SELECT FacultyID FROM Faculty
			  --WHERE FacultyQualification = 'BCom'
			  WHERE FacultyQualification = 'BS'
			 )	
			 
			 SELECT * FROM Faculty  

--Task: Try NOT EXIST

---------------------------------------------------------------------
--Grouping / Aggregation / Sorting
---------------------------------------------------------------------
SELECT FacultyName Name, FacultyQualification Degree 
FROM Faculty AS FAC
WHERE FacultyQualification = 'MS'
ORDER BY Name 

--TOP x WITH TIES requires OrDER BY
SELECT TOP 2 WITH TIES FacultyName AS Name, FacultyQualification AS Degree 
FROM Faculty AS FAC
ORDER BY Degree


DECLARE @Option int 
SET @Option = 2

SELECT * FROM Course
WHERE NumberOfBatches > 
(CASE WHEN @Option = 1
 THEN 1 
 ELSE 2 
 END)


SELECT FacultyID, COUNT(FacultyID) AS 'Courses'
FROM Course
WHERE FacultyID IS NOT NULL
GROUP BY FacultyID
HAVING COUNT(FacultyID) > 2

SELECT MAX(NumberOfBatches) FROM Course
SELECT MIN(NumberOfBatches) FROM Course
SELECT SUM(NumberOfBatches) FROM Course
--Task: Try using MIN and SUM similarly

SELECT FacultyID, AVG(Courses) FROM
(
	SELECT FacultyID, COUNT(FacultyID) AS 'Courses'
	FROM Course
	WHERE FacultyID IS NOT NULL
	GROUP BY FacultyID
) AS CourseDetails
GROUP BY FacultyID, Courses


---------------------------------------------------------------------
--Select Conditionally
---------------------------------------------------------------------
SELECT FacultyName,
CASE
	WHEN FacultyMentor IS NOT NULL THEN 'Mentor is assigned.'
	ELSE 'Mentor is not assigned.'
END AS 'MentorAssignment'
FROM Faculty

--Task: Try using CASE WHEN in ORDER BY

---------------------------------------------------------------------
--SELECT INTO
---------------------------------------------------------------------
SELECT * INTO VisitingFaculty1
FROM Faculty
WHERE 1 = 0

SELECT * FROM VisitingFaculty1
--Task: Try creating a new table with only selected columns of an existing table alog with the data in the existing table 
