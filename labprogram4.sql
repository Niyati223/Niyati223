select * from employees;


select first_name,last_name,round(salary/12,2)as 'monthly salary' from employees;

select manager_id,min(salary) as minsalary
from employees
where manager_id is not null
group by manager_id order by min(salary)desc;

 select department_id,avg(salary) as avgsalary,
 count(*) from employees 
 group by department_id 
 having count(*)>10;

select first_name,last_name from employees
where salary>
(select salary from employees where employee_id=163);

select first_name,last_name,salary,department_id from employees
where salary in(select min(salary) from employees group by department_id);

select first_name,last_name,employee_id,salary from employees
where manager_id= (select employee_id from employees where first_name='Payam');
 