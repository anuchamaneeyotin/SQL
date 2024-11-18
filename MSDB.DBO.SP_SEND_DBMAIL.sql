EXEC msdb.dbo.sp_send_dbmail
@profile_name='Tungman',
    @recipients=N'anucha.m@tong-siang.com',
    @subject=N'The master database is full.',
	@query=N'SELECT top 10 * FROM  TSDB_MAIN.dbo.tbl_Configfabric';



