SELECT * FROM OPENROWSET('Microsoft.Jet.OLEDB.4.0','Excel 8.0;database=D:\File\aaa.xls;Extended Property=Excel 8.0;HDR=YES','SELECT * FROM [STMM$1:10000]') 

--select * from openquery(XLTEST_SP,'SELECT * FROM [STMM$]')

--exec sp_tables_ex 'XLTEST_SP'