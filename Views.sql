---------------------------------------------------------------
VIEWS
---------------------------------------------------------------
CREATE VIEW VW_SelectedFaculty AS

SELECT CRS.CourseName, FAC.FacultyName, FAC.FacultyQualification 
FROM Faculty AS FAC
LEFT OUTER JOIN Course AS CRS ON CRS.FacultyID = FAC.FacultyID
GO


SELECT * FROM VW_SelectedFaculty
Order by CourseName


GO

CREATE TABLE AuditLogType
(
Id INT NOT NULL PRIMARY KEY IDENTITY,
LogType VARCHAR(100) NULL
)
GO

--DROP TABLE AuditLogType
--DROP TABLE AuditLog

Select * from AuditLog

CREATE VIEW VW_SelectAuditData
AS
SELECT TableAction FROM AuditLog
UNION
SELECT LogType FROM AuditLogType

Select * from VW_SelectAuditData

INSERT INTO VW_SelectAuditData
VALUES ('Deleted')


CREATE VIEW VW_SelectAuditDataFromSingleTable
AS
SELECT TableAction FROM AuditLog


INSERT INTO VW_SelectAuditDataFromSingleTable
VALUES ('Deleted')














---------------------------------------------------------------
--Program Flow Statements
--1. RETURN
--2. THROW
--3. TRY - CATCH
--4. BREAK
--5. CONTINUE
--6. GOTO LABEL
--7. IF ELSE
---------------------------------------------------------------
