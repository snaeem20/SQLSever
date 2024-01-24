USE AptechSem3_DB

---------------------------
--SEARCH
---------------------------
CREATE PROCEDURE sp_Search
@Keyword VARCHAR(50),
@DataToSearch VARcHAR(50)

AS
BEGIN

SET NOCOUNT ON

IF @DataToSearch = 'Faculty'
	SELECT * FROM Faculty
	WHERE FacultyName LIKE '%' + @Keyword + '%'

ELSE IF @DataToSearch = 'Course'
	SELECT * FROM Course
	WHERE CourseName LIKE '%' + @Keyword + '%'

END
GO

EXEC sp_Search 'Miss', 'Faculty'
EXEC sp_Search 'Azure', 'Course'

-----------------------------
--Get Average Using TEMP TABLE
-----------------------------
GO
CREATE PROCEDURE sp_GetAverage
@FacultyID INT
,@TotalBatches INT OUTPUT

AS
BEGIN

SET NOCOUNT ON

SELECT @TotalBatches = SUM(NumberOfBatches)
FROM Course C

CREATE TABLE #Data
(
	FacultyInfo VARCHAR,
	AverageBatches INT
)

INSERT INTO #Data (FacultyInfo, AverageBatches)	
	SELECT C.FacultyID, AVG(NumberOfBatches)  
	FROM Course AS C
	WHERE @FacultyID =
		(
		CASE WHEN @FacultyID = 0 
		THEN 0 ELSE C.FacultyID
		END
		)

	GROUP BY C.FacultyID
	
SELECT * FROM #Data
ORDER BY FacultyInfo

END
GO


DECLARE @TotalBatches INT
EXEC sp_GetAverage 1, @TotalBatches OUTPUT
SELECT @TotalBatches
--Task1: List Faculty names instead of Ids and Null Faculty Print "UNASSIGNED"
--Hint: Use join and ISNULL function

--Task2: Return the Sum of NumberOfBatches in a return parameter.

--Tips for troubleshooting data isues regarding SPs that already exists:
--1. Create a query that will call the SP along with parameters declared and assigned values and save it somewhere
--2. For SPs with complex and multiple queries, pick out the queries 1 by 1 and execute them separately
--3. If its not returning any data then try removing the filters from the WHERE clause 1 by 1. Then try removing joins 1 by 1



--SELECT ISNULL(F.FacultyName, 'UNASSIGNED') AS Faculty, AVG(C.NumberOfBatches) AS 'Average Batches'
--FROM Course C
--LEFT JOIN Faculty F ON F.FacultyID = C.FacultyID
--GROUP BY C.FacultyID, F.FacultyName
