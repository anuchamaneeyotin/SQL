
-- ถ้าเห็น UNION ALL แปลว่าเป็น recursive
declare @empid int
set @empid = 14;
-- EmpLev ตั้งเองได้เลย
WITH DirectReports(EmployeeID, NewVacationHours, EmpLev)
AS
(SELECT e.EmployeeID, e.VacationHours, 1
  FROM HumanResources.Employee AS e
	WHERE e.ManagerID = @empid
  UNION ALL
  SELECT e.EmployeeID, e.VacationHours, EmpLev + 1
  FROM HumanResources.Employee as e
  JOIN DirectReports AS d ON e.ManagerID = d.EmployeeID
)

select * from DirectReports