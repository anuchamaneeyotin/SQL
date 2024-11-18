
DECLARE @DB VARCHAR(100)

SET @DB = 'Backup Database ' + DB_NAME() + ' Completed'

EXEC sp_send_dbmail @profile_name='Admin',@recipients='tungmanit19@gmail.com;tungman_it19@hotmail.com',@subject=@DB