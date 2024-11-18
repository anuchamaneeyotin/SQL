STMM-WINSPEED-S


STMM\STMM-TESTVM1$

addr=10.11.0.109;database=dbwins_stmm;Trusted_Connection=yes;


ad hoc updates to system catalogs are not allowed


STMM\1005527a sa stm@48624

EXEC master.dbo.sp_addlinkedserver 
                            @server = N'WINSPEED2', 
                            @srvproduct=N'', 
                            @provider=N'SQLNCLI', 
                            @datasrc=N'10.11.0.109,1433', 
                            @catalog=N'dbwins_stmm',
                            @provstr='addr=10.11.0.109,1433;database=dbwins_stmm;uid=STMM\1005527a;pwd=##anucha01553';