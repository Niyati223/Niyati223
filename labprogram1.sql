select * from SalesLT.Product;
select Name, StandardCost, ListPrice 
from SalesLT.Product;
select Name, ListPrice - StandardCost
from SalesLT.Product;

select Name as ProductName, ListPrice - StandardCost as Markup
from SalesLT.Product;

select ProductNumber, Color, Size, Color + ' , ' + Size as ProductDetails
from SalesLT.Product;

select ProductID + ' : ' + Name as ProductName 
from SalesLT.Product;

select Cast(ProductID as varchar(5)) + ': ' + Name as ProductName 
from SalesLT.Product;

select Convert(varchar(5) , ProductID) + ': ' + Name as ProductName 
from SalesLT.Product;

select SellStartDate,
	CONVERT (nvarchar(30) , SellStartDate) as ConvertedDate,
	CONVERT (nvarchar(30) , SellStartDate, 126) as ISO8601FormatDate
from SalesLt.Product;

