create table person
(
personID int not null,
personName varchar(30),
personLocation varchar(50)
);

insert into person values
(1,'alan','bangalore'),(2,'basu','mumbai'),(3,'chandru','hubli');

select * from person;

begin tran t1
insert into person values(4,'dinesh','patna')
commit;

begin tran t1
update person set personName='ellen'
where personID=4 and personLocation='patna'
commit;

begin tran t1
rollback

begin tran t1
insert into Person values(5,'fedrick','USA')
save tran t1;

select * from person;

begin tran t1
rollback

begin tran t4
insert into person values(5,'feraranda','Vancover')
save tran t4;

begin tran t4
insert into person values(6,'georgina','Madrid')
commit;

begin tran t4
rollback tran t4;