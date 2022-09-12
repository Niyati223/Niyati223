select p.FirstName,p.LastName,oh.JobTitle,c.Rate,avg(c.Rate) over() as AverageRate 
from Person.Person as p
join HumanResources.Employee as oh
on p.BusinessEntityID=oh.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on oh.BusinessEntityID=c.BusinessEntityID

select Rate from HumanResources.EmployeePayHistory;

select p.FirstName,p.LastName ,oh.JobTitle,c.Rate,avg(c.Rate)over() as AverageRate,max(c.Rate)over() as MaximumRate
from Person.Person as p
join HumanResources.Employee as oh
on p.BusinessEntityID=oh.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on p.BusinessEntityID=c.BusinessEntityID
order by AverageRate,MaximumRate;

select p.FirstName,p.LastName ,oh.JobTitle,c.Rate,
avg(c.Rate)over() as AverageRate,
max(c.Rate)over() as MaximumRate,
difffromAvgRate =c.Rate - avg(c.Rate)over()
from Person.Person as p
join HumanResources.Employee as oh
on p.BusinessEntityID=oh.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on p.BusinessEntityID=c.BusinessEntityID
order by AverageRate,MaximumRate;

select p.FirstName,p.LastName ,oh.JobTitle,c.Rate,avg(c.Rate)over() as AverageRate,max(c.Rate)over() as MaximumRate,
PercentofMaximumRate=c.rate/max(c.Rate)over()*100
from Person.Person as p
join HumanResources.Employee as oh
on p.BusinessEntityID=oh.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on p.BusinessEntityID=c.BusinessEntityID











