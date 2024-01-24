CREATE VIEW VW_SelectedFaculty AS
SELECT CRS.CourseName, FAC.FacultyName, FAC.FacultyQualification 
FROM Faculty AS FAC
LEFT OUTER JOIN Course AS CRS ON CRS.FacultyID = FAC.FacultyID


SELECT * FROM VW_SelectedFaculty


--If the same user-defined error is raised at multiple locations,
--using a unique state number for each location can help find which section of code is raising the errors.
--Severity levels from 20 through 25 are considered fatal

RAISERROR ('This is message %s %d.', -- Message text.
           25, -- Severity,
           8, -- State,
           'number', -- First argument.
           5); -- Second argument.

GO