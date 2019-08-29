-- 1. How many people work in the sales department? 

SELECT Count(e.emp_name), 
       d.dept_name 
FROM   employee e 
       INNER JOIN department d 
               ON e.department = d.id 
WHERE  d.dept_name = 'Sales' 
GROUP  BY d.dept_name; 


-- 2. List the names of all employees assigned to the 'Plan Christmas party' project. 

SELECT e.emp_name, 
       p.project_name 
FROM   employee e 
       JOIN employee_project ep 
         ON e.id = ep.emp_id 
       JOIN project p 
         ON ep.project_id = p.id 
WHERE  p.project_name = 'Plan christmas party'; 


-- 3. List the names of employees from the Warehouse department that are assigned to the 'Watch paint dry' project.

SELECT e.emp_name 
FROM   employee e 
       JOIN department d 
         ON e.department = d.id 
       JOIN employee_project ep 
         ON e.id = ep.emp_id 
       JOIN project p 
         ON ep.project_id = p.id 
WHERE  d.dept_name = 'Warehouse' 
       AND p.project_name = 'Watch paint dry'; 


-- 4. Which projects are the Sales department employees assigned to? 

SELECT e.emp_name, 
       p.project_name 
FROM   employee e 
       JOIN department d 
         ON e.department = d.id 
       JOIN employee_project ep 
         ON e.id = ep.emp_id 
       JOIN project p 
         ON ep.project_id = p.id 
WHERE  d.dept_name = 'Sales'; 


-- 5. List only the managers that are assigned to the 'Watch paint dry' project. 

SELECT e.emp_name AS managers 
FROM   department d 
       JOIN employee e 
         ON d.manager = e.id 
       JOIN employee_project ep 
         ON e.id = ep.emp_id 
       JOIN project p 
         ON ep.project_id = p.id 
WHERE  p.project_name = 'Watch paint dry'; 