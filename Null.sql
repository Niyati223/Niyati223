select Name , cast(Size as Integer) as NumericSize
from SalesLT.Product;

select Name, TRY_CAST(Size as Integer) as NumericSize
from SalesLT.Product;

select Name, ISNULL(TRY_CAST(Size as Integer),0) as NumericSize
from SalesLT.Product;
 
select ProductNumber, ISNULL(Color, ' ') + ',' + ISNULL(Size, ' ') as ProductDetails 
from SalesLT.Product;

select Name, NULLIF(Color, 'Multi') as SinglerColor
from SalesLT.Product;

select Name,COALESCE(SellEndDate, SellStartDate) as StatusLastUpdated
from SalesLT.Product;

select Name,
	CASE
		When SellEndDate IS NULL Then 'Currently for Sale'
		ELSE 'No longer available'
	End as SalesStatus
from SalesLT.Product;

select Name,
	CASE Size
		When 'S' then 'Small'
		When 'M' then 'Medium'
		When 'L' then 'Large'
		When 'XL' then 'Extra Large'
		ELSE ISNULL(Size,'n/a')
	END as ProductSize
from SalesLT.Product;

