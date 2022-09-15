with A 
as
(
select PurchaseOrderID,VendorID,OrderDate,TaxAmt,Freight,TotalDue,
Most_Expensive_Rank= ROW_NUMBER()over(partition by VendorID order by TotalDue desc)
from Purchasing.PurchaseOrderHeader
)

select PurchaseOrderID,VendorID,OrderDate,TaxAmt,Freight,TotalDue,Most_Expensive_Rank
from A
where Most_Expensive_Rank<=3 

with b
as
(
select PurchaseOrderID,VendorID,OrderDate,TaxAmt,Freight,TotalDue,
Most_Expensive_Rank= ROW_NUMBER()over(partition by VendorID order by TotalDue desc),
Most_Expensive_Ranking= row_number()over(order by TotalDue desc)
from Purchasing.PurchaseOrderHeader
)

select PurchaseOrderID,VendorID,OrderDate,TaxAmt,Freight,TotalDue
from b
where Most_Expensive_Rank<=3

--scalar subqueries
select BusinessEntityID,JobTitle,VacationHours
from HumanResources.Employee;


select BusinessEntityID,JobTitle,VacationHours,
MaxVacationHours=Max(VacationHours)
from HumanResources.Employee
 
select BusinessEntityID,JobTitle ,VacationHours,
VacationHours * 100.00/(select max(VacationHours)from HumanResources.Employee)as 'Percentage'
from HumanResources.Employee
order by VacationHours desc

select BusinessEntityID,JobTitle ,VacationHours,
VacationHours * 100.00/(select max(VacationHours)
from HumanResources.Employee)as 'Percentage'
from HumanResources.Employee
where VacationHours >80
order by VacationHours desc

--correlated subquery

select PurchaseOrderID,VendorID,OrderDate,TotalDue
from Purchasing.PurchaseOrderHeader a
NonRejectedItems=






