-- 1. How many people work in the sales department?

select
count(e.emp_name),
d.dept_name
from
employee e
inner join
department d
on
e.department = d.id
where d.dept_name = 'Sales'
group by
d.dept_name;

