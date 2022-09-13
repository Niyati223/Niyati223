/*exercise 1 */

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
PriceRank=row_number() over(order by ListPrice desc),
CategoryPriceRankWithRank=rank()over(partition by c.Name order by a.ListPrice desc)
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID
order by a.ListPrice desc,ProductCategory;

/*exercise 2 */

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
CategoryPriceRank=Row_number()over(order by a.ListPrice desc),
CategoryPriceRankWithRank=rank()over(partition by c.Name order by a.ListPrice desc),
CategoryPriceDenseRank=Dense_rank()over(partition by c.Name order by a.ListPrice desc)
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID
order by a.ListPrice desc,ProductCategory desc;

/*exercise 3 */

select a.Name as ProductName,a.ListPrice,b.Name as ProductSubCategory ,c.Name as ProductCategory,
CategoryPriceRankWithRank=rank()over(partition by c.Name order by a.ListPrice desc),
CategoryPriceDenseRank=Dense_rank()over(partition by c.Name order by a.ListPrice desc),
	case
		when dense_rank()over(partition by c.Name order by a.ListPrice desc)>5 then 'No'
		else 'yes'
		end as Top5PriceInCategory
	
from Production.Product as a
join Production.ProductSubcategory as b
on b.ProductSubcategoryID=a.ProductSubcategoryID
join Production.ProductCategory as c
on c.ProductCategoryID=b.ProductCategoryID

