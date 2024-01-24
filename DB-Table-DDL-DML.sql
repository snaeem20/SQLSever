--------------------------------------------------------------------
-- Creating DB / Craeting and Altering Table
--------------------------------------------------------------------
--CREATE DATABASE AptechSem3_DB

--CREATE TABLE Faculty
--(
--FacultyID INT NOT NULL PRIMARY KEY,
--FacultyName VARCHAR(50) NOT NULL,
--FacultyNumber VARCHAR(10) not null,
--FacultyQualification VARCHAR(10) 
--)

--ALTER TABLE Faculty
--ADD FacultyMentor INT



--ALTER TABLE Course
--ADD FacultyID INT, 
--FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)

--Task: Try to add, alter and drop columns using Object Explorer

---------------------------------------------------------------------
--Table Design
---------------------------------------------------------------------
--SP_HELP Course

---------------------------------------------------------------------
--Insert / update / delete records
---------------------------------------------------------------------
--INSERT INTO Faculty (FacultyID)
--VALUES (1)

INSERT INTO Faculty (FacultyID, FacultyName, FacultyNumber, FacultyQualification, FacultyMentor)
VALUES (1, 'Sir Shabbir', 'FAC-001', 'MS', NULL),
(2, 'Sir Atif', 'FAC-002', 'MS', 1),
(3, 'Miss Amna', 'FAC-003', 'MS', 1),
(4, 'Miss Filza', 'FAC-004', 'MS', 3)
--INSERT INTO Faculty (FacultyID, FacultyName, FacultyNumber, FacultyQualification)
--VALUES (2, 'Sir Atif', 'FAC-002', 'MS')
--INSERT INTO Faculty (FacultyID, FacultyName, FacultyNumber, FacultyQualification)
--VALUES (3, 'Miss Amna', 'FAC-003', 'MS')
--INSERT INTO Faculty (FacultyID, FacultyName, FacultyNumber, FacultyQualification)
--VALUES (4, 'Miss Filza', 'FAC-004', 'MS')

INSERT INTO Course (CourseID, CourseName, FacultyID)
VALUES (1, 'MSSQL', 3),
(2, 'MySQL', 1),
(3, 'AzureSQL', 4)
--VALUES (1, 'CRS-001', 'MS SQL', 'MS SQL')
--INSERT INTO Course (CourseID, CourseNumber, CourseName, CourseDescription)
--VALUES (2, 'CRS-002', 'ADV MS SQL', 'ADV MS SQL')
--INSERT INTO Course (CourseID, CourseNumber, CourseName, CourseDescription)
--VALUES (3, 'CRS-002', 'Azure SQL', 'Azure SQL')
--INSERT INTO Course (CourseID, CourseNumber, CourseName, CourseDescription, FacultyID)
--VALUES (6, 'CRS-001', 'SQLLite', 'SQLLite', 1)

--UPDATE Faculty Set FacultyMentor = 4
--WHERE FacultyID = 1

--DELETE Faculty
--WHERE FacultyID = 2

--Task: Try to insert, update and delete data using Object Explorer

---------------------------------------------------------------------
--Data selection
---------------------------------------------------------------------
--All rows and columns
SELECT * FROM Faculty AS FAC

--filtered rows and columns / renaming column headers
SELECT FacultyName AS Name, FacultyQualification AS Degree 
FROM Faculty AS FAC
WHERE FacultyQualification = 'MS'

--using TOP
Select * From Faculty
SELECT TOP 2  FacultyName AS Name, FacultyQualification AS Degree 
FROM Faculty AS FAC
--Task: Try using TOP x PERCENT
SELECT TOP 50 PERCENT  FacultyName AS Name, FacultyQualification AS Degree 
FROM Faculty AS FAC

--using constants in SELECT statements
SELECT FacultyName + ' holds the degree of ' + FacultyQualification AS 'Faculty Education'
FROM Faculty AS FAC

--Select Distinct data
SELECT DISTINCT FacultyQualification FROM Faculty AS FAC

---------------------------------------------------------------------
--Adding related data
---------------------------------------------------------------------
--UPDATE Course SET FacultyID = 1 WHERE CourseID = 1
--UPDATE Course SET FacultyID = 3 WHERE CourseID = 2

---------------------------------------------------------------------
--Table joins
---------------------------------------------------------------------
SELECT * FROM Faculty AS FAC
LEFT OUTER JOIN Course AS CRS ON CRS.FacultyID = FAC.FacultyID

SELECT * FROM Faculty AS FAC
RIGHT OUTER JOIN Course AS CRS ON CRS.FacultyID = FAC.FacultyID

SELECT * FROM Faculty AS FAC
FULL OUTER JOIN Course AS CRS ON CRS.FacultyID = FAC.FacultyID

SELECT * FROM Faculty AS FAC
INNER JOIN Course AS CRS ON CRS.FacultyID = FAC.FacultyID

SELECT * FROM Faculty AS FAC
CROSS JOIN Course AS CRS

SELECT * FROM Faculty AS FAC
LEFT JOIN Course AS CRS ON FAC.FacultyID = CRS.FacultyID

--SELF JOIN
SELECT FAC.FacultyName 'Faculty', MNT.FacultyName 'Mentor' 
FROM Faculty AS MNT
INNER JOIN Faculty AS FAC ON MNT.FacultyID = FAC.FacultyMentor
