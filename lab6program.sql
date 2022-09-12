select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID
order by ProductName,ProductSubCategory,ProductCategory;

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
AvgPriceByCategory=avg(a.ListPrice)over(partition by c.Name)
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
AvgPriceByCategory=avg(a.ListPrice)over(),
AvgPriceBySubCategory=avg(a.ListPrice)over(partition by b.Name order by b.Name)
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
ProductVsCategoryDelta=a.ListPrice - avg(a.ListPrice)over(partition by c.Name)
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID



