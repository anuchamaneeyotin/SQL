select SUPPLIER,
case 
when vendortypeID= 1 then '����ѷ' 
when vendortypeID=2 then '˨�'
else 
		'��ҹ'
end as vendortype
,address,phone,fax,credit,contact,position
,(select itemgroupname from tbl_itemgroup where itemgroupID= tbl_vendor.itemgroupID) as itemgroup,reason
 from tbl_vendor order by SUPPLIER

use school
go

-- ������ա��᷹���Ϳ�Ŵ���������ͧ�� as �Դ����
select schoolid,'SCHOOL' = case
when schoolname IS NULL then '����ժ����ç���¹'
else
schoolname
end 
from tbl_school



select *,case  when schoolname is null then 'No'
else
schoolname
end as School
from tbl_school