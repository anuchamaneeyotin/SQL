use school
go

select schoolid,'SCHOOL' = case
when schoolname IS NULL then 'ไม่มีชื่อโรงเรียน'
else
schoolname
end 
from tbl_school


select schoolid,case  when schoolname is null then 'No'
else
schoolname
end as School
from tbl_school