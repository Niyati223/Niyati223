/* exercise 1 */

select a.PurchaseOrderID,a.OrderDate,a.TotalDue,b.BusinessEntityID,b.Name as VendorName
from Purchasing.PurchaseOrderHeader as a
join Purchasing.Vendor as b
on a.VendorID=b.BusinessEntityID
where OrderDate >='2013' and TotalDue > 500;

/* exercise 2 */

select a.PurchaseOrderID,a.OrderDate,a.TotalDue,b.BusinessEntityID,b.Name as VendorName,
PrevOrderFromVendorAmt=lag(TotalDue,1)over(partition by a.VendorID order by b.BusinessEntityID)
from Purchasing.PurchaseOrderHeader as a
join Purchasing.Vendor as b
on a.VendorID=b.BusinessEntityID
where OrderDate >='2013' and TotalDue > 500;

/* exercise 3 */

select a.PurchaseOrderID,a.OrderDate,a.TotalDue,a.EmployeeID,b.BusinessEntityID,b.Name as VendorName,
NextOrderByEmployeeVendor=lead(b.Name,1)over(order by a.EmployeeID)
from Purchasing.PurchaseOrderHeader as a
join Purchasing.Vendor as b
on a.VendorID=b.BusinessEntityID
where OrderDate >='2013' and TotalDue > 500;

/* exercise 4 */

select a.PurchaseOrderID,a.OrderDate,a.TotalDue,a.EmployeeID,b.BusinessEntityID,b.Name as VendorName,
Next2OrderByEmployeeVendor=lead(b.Name,2)over(order by a.EmployeeID)
from Purchasing.PurchaseOrderHeader as a
join Purchasing.Vendor as b
on a.VendorID=b.BusinessEntityID
where OrderDate >='2013' and TotalDue > 500;












