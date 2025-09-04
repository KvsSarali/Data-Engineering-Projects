#1.Query all rows from Department table?
select * from department_tb;

#2.Change the name of department with id = 1 to 'Management'?
update department_tb
set name='Management'
where id=1;

#3.Delete employees with salary greater than 100000?
delete from employee_tb where salary > 100000;

#4.Query the names of companies?
select name from company_tb;

#5.Query the name and city of every employee?
select name,city from employee_tb;

#6.Query all companies with revenue greater than 5000000?
select name from company_tb  where revenue>5000000;

#7.Query all companies with revenue smaller than 5000000?
select name from company_tb  where revenue<5000000;

#8.Query all companies with revenue smaller than 5000000, but you cannot use the '<' operator?
select name from company_tb where not(revenue>=5000000);

#9.Query all employees with salary greater than 50000 and smaller than 70000?
select name from employee_tb  where salary>50000 and salary<70000;
#should not use between as it brings salary with 50000 and 70000 as well

#10.Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN?
select name from employee_tb  where salary>50000 and salary<70000; 

#11 Query all employees with salary equal to 80000?
select name from employee_tb  where salary=80000;

#12.Query all employees with salary not equal to 80000?
select name from employee_tb  where salary <> 80000;
select name from employee_tb  where not (salary = 80000);
select name from employee_tb  where salary not in (80000);

#13 Query all departments (each name only once)?
select distinct name from department_tb;

#14.Query names of all employees together with id of department they work in, but you cannot use JOIN?
select name,department_id from employee_tb
order by department_id;

#15.Query names of all employees together with id of department they work in, using JOIN?
select e.name EmployeeName ,d.id DepartmentID,d.name Department from employee_tb e join department_tb d
on e.department_id=d.id;

#16.Query name of every company together with every department?
select distinct c.name CompanyName,d.name Department from company_tb c cross join department_tb d
order by c.name;

#17.Query employee name together with the department name that they are not working?
select e.name EmployeeName,d.name Department from employee_tb e left join department_tb d on e.department_id<>d.id
union
select e.name EmployeeName,d.name Department from employee_tb e right join department_tb d on e.department_id<>d.id;

select e.name EmployeeName,d.name Department from employee_tb e cross join department_tb d on e.department_id<>d.id;

#18.Query names of every company and change the name of column to 'Company'?
select name as Company from company_tb; 

#19.Query the city wise salary?
select city,sum(salary) from employee_tb
group by city 
order by sum(salary) desc;

#20.Query the highest revenue company name?
select name from company_tb where revenue in (select max(revenue) from company_tb );
select name from (select *, rank() over(order by revenue desc) rnk from company_tb)a where rnk=1;

