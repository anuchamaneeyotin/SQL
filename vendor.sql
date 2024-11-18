select SUPPLIER,
case 
when vendortypeID= 1 then 'บริษัท' 
when vendortypeID=2 then 'หจก'
else 
		'ร้าน'
end as vendortype
,address,phone,fax,credit,contact,position
,(select itemgroupname from tbl_itemgroup where itemgroupID= tbl_vendor.itemgroupID) as itemgroup,reason
 from tbl_vendor order by SUPPLIER

use school
go

-- เมื่อมีการแทนชื่อฟิลด์แล้วไม่ต้องมี as ปิดท้าย
select schoolid,'SCHOOL' = case
when schoolname IS NULL then 'ไม่มีชื่อโรงเรียน'
else
schoolname
end 
from tbl_school



select *,case  when schoolname is null then 'No'
else
schoolname
end as School
from tbl_school