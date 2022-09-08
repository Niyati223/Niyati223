create table salesman3
(Salesman_id int not null,cust_name varchar(30) not null, city varchar(30),comission varchar(30) not null,
primary key(Salesman_id),
);

insert into salesman3
	(Salesman_id,cust_name,city,comission)
values
	(5001,'James Hoog','New York',0.15),(5002,'Nail Knite','Paris',0.13),(5005,'Pit Alex','London',0.11),(5006,'Mc lyon','Paris',0.14),(5003,'Lauson Hen',null,0.12),(5007,'Paul Adam','Rome',0.13);
select * from salesman3;

create table customer2
(customer_id int not null,cust_name varchar(30) not null,city varchar(30) not null,grade varchar(30),salesman_id int not null,
primary key(customer_id),
unique(cust_name)
);
insert into customer2
		(customer_id,cust_name,city,grade,salesman_id)
values
		(3002,'Nick Rimando','New York',100,5001),(3005,'Graham Zusi','California',200,5002),(3001,'Brad Guzan','London',null,5005),(3004,'Fabian Johnx','Paris',300,5006),(3007,'Brad Davis','New York',200,5001),(3009,'Geoff Camero','Berlin',100,5003),(3008,'Julian Green','London',300,5002),(3003,'Jozy Altidor','Moscow',200,5007);

select * from customer2;

create table orders6
(ord_no int not null,purch_amt int not null,ord_date date not null,customers_id int not null,Salesman_id int not null,
primary key(ord_no),
);

insert into orders6
	(ord_no,purch_amt,ord_date,customers_id,Salesman_id)
values
	(70001,150.5,'2012-10-05',3005,5002),(70009,270.65,'2012-09-10',3001,5005),(70002,65.26,'2012-10-05',3002,5001),(70004,110.5,'2012-08-17',3009,5003),(70007,948.5,'2012-09-10',3005,5002),(70005,2400.6,'2012-07-27',3007,5001),(70008,5760,'2012-09-10',3002,5001),(70010,1983.43,'2012-10-10',3004,5006),(70003,2480.4,'2012-10-10',3008,5002),(70012,250.45,'2012-06-27',3008,5002),(70011,75.29,'2012-08-17',3003,5007),(70013,3045.6,'2012-04-25',3002,5001);
	select * from orders6 ;

select cust_name,city from salesman3 where city='Paris';

select c.* ,a.cust_name from orders6 as c , customer2 as a where a.customer_id=c.customers_id and c.ord_date= '2012-08-17';

select salesman_id ,cust_name from salesman3 as a where 1 < (select count(*) from customer2 where salesman_id=a.salesman_id);

select * from orders6 as a where purch_amt > (select avg(purch_amt) from orders6 as b where b.customers_id=a.customers_id);

select * from salesman3 where salesman_id in (select distinct salesman_id from customer2 as a where not exists (select * from customer2 as b where a.salesman_id=b.salesman_id and a.cust_name<>b.cust_name));

select * from salesman3 as a where 1 <(select count(*) from customer2 where salesman_id = a.salesman_id);

select * from salesman3 where city in(select city from customer2); 