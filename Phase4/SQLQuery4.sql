create procedure
 GiveSalary  
 @StaffID char(5) 
 AS  
SET NOCOUNT ON; 
SELECT Salary
FROM Staff
WHERE StaffID = @StaffID;

EXEC GiveSalary @StaffID = '80001';