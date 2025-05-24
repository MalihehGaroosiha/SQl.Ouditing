--Load CSV files into SQL and join them 
USE bank
select  *  from  PCard1
union
select * from  PCard3
union
select  Service_Area ,Account_Description , Creditor ,JV_Date as Journal_Date, JV_Reference as Journal_Reference  ,JV_Value as Total
from PCard2

create table PCard
 (Service_Area nvarchar(50)
 ,Account_Description nvarchar(50)
 , Creditor nvarchar(50)
 ,Journal_Date date,
 Journal_Reference smallint
 ,Total float)
--Making new table with the name of PCard
insert into PCard(Service_Area ,Account_Description , Creditor,Journal_Date 
 ,Journal_Reference,Total)
 select  Service_Area ,Account_Description , Creditor,Journal_Date 
 ,Journal_Reference,Total  from  PCard1
union
select Service_Area ,Account_Description , Creditor,Journal_Date 
 ,Journal_Reference ,Total from  PCard3
union
select  Service_Area ,Account_Description , Creditor ,JV_Date as Journal_Date, JV_Reference as Journal_Reference  ,JV_Value as Total
from PCard2