


SELECT * FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','Excel 12.0;database=\\10.11.0.113\Program\socso.xlsx','SELECT * FROM [data$]') 