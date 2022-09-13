create table product1
(productId int ,productName varchar(100))
go

create table productDescription1
(productId int,productDescription varchar(100))
go
insert into product1 values
(680,'HL Road Frame-Block,58'),
(706,'HL Road Frame-Red,58'),
(707,'Sport-100 Helmet Road,Red')
go
insert into productDescription1 values
(680,'Rplacement Mountain wheel for entry-levvel rider.'),
(706,'Sturdy alloy features a quick-release hub.'),
(707,'Aerodynamic rims for smooth riding.')

--stored procedure
create procedure getproddescript as
begin
set nocount on

select p.productId,p.productName
from product1 as p
join productDescription1 as pd
on p.productId=pd.productId

end

exec getproddescript

--rename
exec sp_rename 'getproddescript','getproddescriptnew3'
exec getproddescriptnew3

--with using parameters

create procedure getproductdescript_withparameters 
(@pid int)
as
begin
set nocount on

select p.productId,p.productName,pd.productDescription
from product1 as p
join productDescription1 as pd
on p.productId=pd.productId
where p.productId=@pid

end

exec getproductdescript_withparameters 707

--with default parameter

create procedure getproddescript_withdefaultparameter
(@pid int =707)
as
begin
set nocount on

select p.productId,p.productName,pd.productDescription
from product1 as p
join productDescription1 as pd
on p.productId=pd.productId
where p.productId=@pid

end

exec getproddescript_withdefaultparameter
exec getproddescript_withdefaultparameter 680

--without parameter
create table employee1
(empId int identity(1,1),empName varchar(50))

select * from employee1

create procedure ins_newemp_withoutparameters
(@ename varchar(100),@eid int output)
as
begin
set nocount on

insert into employee1 (empname)values(@ename)

select @eid=scope_identity()
end

declare @empId int
exec ins_newemp_withoutparameters 'ellen',@empID output

select @empId

select * from employee1

--using encryption

create procedure getemployee2
with encryption
as
begin
set nocount on

select empId,empName
from employee1
end

exec getemployee2
sp_helptext getemployee2

--local temporary

create procedure #temp1
as
begin
print('local temp procedure')
end

exec #temp1

--global temporary
 
 create procedure ##temp1
 as
 begin 
 print('Global temp procedure')
 end

 exec ##temp1