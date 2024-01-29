--Gets the Number of Courses being taught by a Faculty
CREATE FUNCTION GetNumberOFCourses (
	@FacultyID INT
)
RETURNS INT 
AS
BEGIN
	DECLARE @NoOfCourses INT

	SET @NoOfCourses = 
		(SELECT COUNT(FacultyID)
		FROM Course
		WHERE FacultyID = @FacultyID 
		GROUP BY FacultyID
		)
	RETURN @NoOfCourses
END
GO

Select * FROM Course
SELECT dbo.GetNumberOFCourses(3)

CREATE PROCEDURE GetAllCourses
	@FacultyID INT	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM Course
	WHERE FacultyID = @FacultyID

END
GO

EXEC GetAllCourses 1

----------------------------------------------
--Common Table Expressions
----------------------------------------------
CREATE PROCEDURE GetAllCoursesUsingCTE
	@FacultyID INT	
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH CourseByFaculty AS
	(
		SELECT * FROM Course
		WHERE FacultyID = @FacultyID
	)
	SELECT * FROM CourseByFaculty
	ORDER BY CourseName

END
GO

EXEC GetAllCoursesUsingCTE 1

--SQL Profiler
--QUERY Optimizer
	--1. Execution Plan
	--2. using temp table
	--3. avoid using Distinct
	--4. Filter data (if possible) before applying joins
	--5. replace outer joins with inner joins where possible
	--6. using indexes




