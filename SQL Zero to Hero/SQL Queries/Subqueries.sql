# find out the first_name, last_name of the employees who are managers
# Using subquery
SELECT 
    first_name, last_name FROM employees
WHERE
    emp_no IN (SELECT emp_no FROM dept_manager);

# Using join
Select e.first_name, e.last_name from employees e 
JOIN dept_manager d ON e.emp_no = dm.emp_no;

# Find out the employees whose salary is less than the average salary of the employees
Select avg(salary) from salaries;
Select distinct emp_no from salaries where salary < (Select avg(salary) from salaries);

select * from employees;
select * from salaries;

########## Views #############
CREATE OR REPLACE VIEW avgsalary_gender AS
select a.gender, avg(b.salary)
from employees a JOIN salaries b
ON a.emp_no = b.emp_no
WHERE a.hire_date > 2000-01-01
group by a.gender;

select * from avgsalary_gender;