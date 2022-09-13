/* exercise 1 */

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID

/*excercise 2 */

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
PriceRank=row_number() over(order by a.ListPrice desc)
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID

/* exercise 3*/

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
PriceRank=Row_number()over(order by a.ListPrice Desc),
CategoryPriceRank=Row_number()over(partition by c.Name order by a.ListPrice desc)
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID


/* exercise 4 */

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
PriceRank=Row_number() over(order by a.ListPrice Desc),
CategoryPriceRank=Row_number()over(partition by c.Name order by a.ListPrice desc),
	case
		when row_number()over(partition by c.Name order by a.ListPrice desc)>5 then 'No'
		else 'yes'
		end as Top5PriceInCategory
	
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID


