use school
go

select schoolid,'SCHOOL' = case
when schoolname IS NULL then '����ժ����ç���¹'
else
schoolname
end 
from tbl_school


select schoolid,case  when schoolname is null then 'No'
else
schoolname
end as School
from tbl_school