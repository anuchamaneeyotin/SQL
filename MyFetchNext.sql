
--DECLARE cor CURSOR for  
--SELECT * from tbl_returnorder  -- ���ҧ cursor ��зӡ�� query
--OPEN cor  -- �Դ cursor
--FETCH NEXT FROM cor  -- FETCH NEXT FROM cur in @var1,@var2  ���� 2 Ẻ
--	     WHILE @@FETCH_STATUS = 0 -- ��������ǹ
--			begin 
--				     FETCH NEXT FROM cor
--			end
--CLOSE cor
--
--DEALLOCATE cor

DECLARE @docid nvarchar(50)
DECLARE cor CURSOR for  
SELECT docid from tbl_returnorder  -- ���ҧ cursor ��зӡ�� query
OPEN cor  -- �Դ cursor
FETCH NEXT FROM cor into @docid -- FETCH NEXT FROM cur in @var1,@var2  ���� 2 Ẻ
	     WHILE @@FETCH_STATUS = 0 -- ��������ǹ
			begin 
				     print @docid
				     FETCH NEXT FROM cor into @docid
			end
CLOSE cor
DEALLOCATE cor