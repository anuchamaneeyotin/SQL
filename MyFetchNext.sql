
--DECLARE cor CURSOR for  
--SELECT * from tbl_returnorder  -- สร้าง cursor และทำการ query
--OPEN cor  -- เปิด cursor
--FETCH NEXT FROM cor  -- FETCH NEXT FROM cur in @var1,@var2  ใช้ได้ 2 แบบ
--	     WHILE @@FETCH_STATUS = 0 -- เริ่มการวน
--			begin 
--				     FETCH NEXT FROM cor
--			end
--CLOSE cor
--
--DEALLOCATE cor

DECLARE @docid nvarchar(50)
DECLARE cor CURSOR for  
SELECT docid from tbl_returnorder  -- สร้าง cursor และทำการ query
OPEN cor  -- เปิด cursor
FETCH NEXT FROM cor into @docid -- FETCH NEXT FROM cur in @var1,@var2  ใช้ได้ 2 แบบ
	     WHILE @@FETCH_STATUS = 0 -- เริ่มการวน
			begin 
				     print @docid
				     FETCH NEXT FROM cor into @docid
			end
CLOSE cor
DEALLOCATE cor