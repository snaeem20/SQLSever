---------------------------------------------------------------------
--IN / BETWEEN / LIKE
---------------------------------------------------------------------
SELECT * FROM Course
WHERE FacultyID IN (1, 2, 4)

SELECT * FROM Course
WHERE NumberOfBatches BETWEEN 1 AND 4 

SELECT * FROM Faculty
WHERE FacultyName LIKE 'Miss%'

SELECT * FROM Faculty
WHERE FacultyName LIKE '%b'

SELECT * FROM Faculty
WHERE FacultyName LIKE '%Sha%'

SELECT * FROM Course
WHERE CourseName LIKE '[a,s]%'

SELECT * FROM Course
WHERE CourseName LIKE '[A-M]%'

SELECT * FROM Faculty
WHERE FacultyName LIKE '%Am_a%'
--Task: try using NOT LIKE with all the wildcards

---------------------------------------------------------------------
--Sub Queries
---------------------------------------------------------------------
--List all the courses that are being taught by a faculty who does not have mentor
SELECT * FROM Course
WHERE FacultyID IN (SELECT FacultyID FROM Faculty WHERE FacultyMentor IS NULL)
--Task: try doing it by using NOT IN

--Courses having assigned Faculty and Faculty has Mentor
SELECT * FROM Course
WHERE FacultyID IS NOT NULL AND
 FacultyID IN (SELECT FacultyID FROM Faculty
WHERE FacultyMentor IS NOT NULL)


