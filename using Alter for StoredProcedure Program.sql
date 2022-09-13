create procedure SalesLT.TopProducts3
as
begin
select top(10)Name,ListPrice
from SalesLT.Product
group by Name,ListPrice
order by ListPrice desc
end

exec SalesLT.TopProducts3

--alter

alter procedure SalesLT.TopProducts2
(@ProductCategoryID int)
as
begin
--set nocount on
select top(10) Name,ListPrice
from SalesLT.Product
where ProductCategoryID=@ProductCategoryID
group by Name,ListPrice
order by ListPrice desc
end

exec SalesLT.TopProducts2 15;