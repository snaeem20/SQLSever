------------------------------------------
--Adding more Data
------------------------------------------
CREATE TABLE AlphaTarget(
	TargetID INT NOT NULL PRIMARY KEY,
	TargetName nchar(10) NULL,
	TargetDueDate date NULL
	)
INSERT INTO AlphaTarget VALUES
(1, 'Attendance', GETDATE()),
(2, 'Project', GETDATE()),
(3, 'Unpaid', GETDATE()),
(4, 'Course', GETDATE())

GO
CREATE TABLE Performance(
	PerformanceID INT NOT NULL PRIMARY KEY,
	Rating DECIMAL(18, 0) NULL
	)
INSERT INTO [Performance] VALUES
(1, 8),
(2, 5),
(3, 6),
(4, 7)

-------------------------------------------
--AFTER TRIGGERS - insert update and dlete
-------------------------------------------
CREATE TABLE AuditLog
(
Id INT NOT NULL PRIMARY KEY IDENTITY,
TableAction VARCHAR(100) NOT NULL
)
GO

GO
CREATE TRIGGER trg_Log ON Faculty
FOR INSERT
AS

INSERT INTO AuditLog (TableAction)
VALUES('Faculty inserted')



SELECT * FROM Faculty
SELECT * FROM AuditLog
INSERT INTO Faculty VALUES('11', 'Miss XYZ', 'FAC-011', 'MCS', NULL)


--Task Try creating for UPDATE and DELETE

-------------------------------------------
--INSTEAD OF TRIGGERS - inser delete update
-------------------------------------------
GO
CREATE TRIGGER trg_ValidateData ON Faculty
INSTEAD OF INSERT
AS

DECLARE @Mentor INT

SELECT @Mentor = I.FacultyMentor FROM inserted I

IF @Mentor IS NULL
BEGIN
	--TODO: RaiseError parameters details
	RAISERROR('Cannot add a faculty without mentor', 16, 1);
    ROLLBACK;
END

GO


--If the same user-defined error is raised at multiple locations,
--using a unique state number for each location can help find which section of code is raising the errors.
--Severity levels from 20 through 25 are considered fatal

RAISERROR ('This is message %s %d.', -- Message text.
           16, -- Severity,
           8, -- State,
           'number', -- First argument.
           5); -- Second argument.

GO




