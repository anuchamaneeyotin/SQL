select LTRIM(RTRIM(POID)) as "@POID",
CreateDate,
LTRIM(RTRIM(DOCSTMM)) as DOCSTMM
from CO where LEFT(DOCSTMM,3)  IN ('DIY','COM') and DOCSTMM <> ''
for XML PATH('PONumber'),ROOT('Data')



select LTRIM(RTRIM(Code)) as "@EmployeeCode",
LTRIM(RTRIM(Name)) AS Name
from XX 
for XML PATH('User'),ROOT('Users')