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
where 
  d.dept_name = 'Sales'
group by
  d.dept_name;

-- 2. List the names of all employees assigned to the 'Plan Christmas party' project.

select
  e.emp_name,
  p.project_name
from
  employee e 
join 
  employee_project ep
on 
  e.id = ep.emp_id
join
  project p
on 
  ep.project_id = p.id
where 
  p.project_name = 'Plan christmas party';

-- 3. List the names of employees from the Warehouse department that are assigned to the 'Watch paint dry' project.

select
  e.emp_name
from
  employee e
join
  department d
on
  e.department = d.id
join
  employee_project ep
on
  e.id = ep.emp_id
join
  project p
on
  ep.project_id = p.id
where
  d.dept_name = 'Warehouse'
and
  p.project_name = 'Watch paint dry';
  

-- 4. Which projects are the Sales department employees assigned to?

select
  e.emp_name,
  p.project_name
from
  employee e
join
  department d
on
  e.department = d.id
join
  employee_project ep
on
  e.id = ep.emp_id
join
  project p
on
  ep.project_id = p.id
where
  d.dept_name = 'Sales';


-- 5. List only the managers that are assigned to the 'Watch paint dry' project.

select
  e.emp_name as managers
from
  department d
join
  employee e
on
  d.manager = e.id
join
  employee_project ep
on
  e.id = ep.emp_id
join
  project p
on
  ep.project_id = p.id
where
  p.project_name = 'Watch paint dry';