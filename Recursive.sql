
-- ������ UNION ALL ������� recursive
declare @empid int
set @empid = 14;
-- EmpLev ����ͧ�����
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