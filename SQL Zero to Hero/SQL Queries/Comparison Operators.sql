Use employees;

SELECT 
    DISTINCT first_name, hire_date
FROM
    employees
WHERE 
	first_name = "Georgi";
    
#Aggregate functions

SELECT
	COUNT(*)
FROM
	employees;

#ORDER BY and GROUP BY and Having
SELECT
	 *
FROM
	employees
WHERE
	gender="F"
ORDER BY first_name, last_name;


SELECT first_name, count(first_name)
from employees
GROUP BY first_name
ORDER BY first_name;

select * from salaries;

select sum(salary) from salaries;

select emp_no, count(emp_no) as emp_count, sum(salary) as total_salary
from salaries
group by emp_no;
#order by total_salary desc;

select emp_no, Avg(salary) as Avg
from salaries
Group by emp_no
Having Avg(salary) > 80000
Limit 5;

select round(avg(salary),0) from salaries;

select max(salary) from salaries;

# Top 10 employees with the highest salary.
Select emp_no, Max(salary) as max_salary
from salaries
group by emp_no
order by max_salary desc
Limit 10;


########## STRING FUNCTIONS #############
select CONCAT(first_name, " ", last_name) as Full_name from employees;

SELECT concat_ws("-", first_name, last_name, gender) as emp_gender from employees;

SELECT DISTINCT first_name, length(first_name) as no_chars from employees
ORDER BY no_chars desc;

SELECT first_name, Left(hire_date,4) as joined_year from employees;

Select upper(first_name) from employees;

######### Proper case ###########
SELECT CONCAT(UPPER(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2))) AS proper_case
FROM employees;

Select replace(first_name, "Ge", "Ze") from employees;

# Find out name of the employee and it's birth year using substring.
Select first_name, substring(birth_date, 1, 4) as born_year from employees;

################ DATE FUNCTIONS #################
Select * from salaries;
Select *, month(from_date) as month_no, monthname(from_date) as month_name, 
year(from_date) as yr, quarter(from_date) as quarter_no, 
weekofyear(from_date) as week_year from salaries; 

Select *, date_add(from_date, interval 5 day) after5days_fromdate from salaries;

Select *, date_sub(from_date, interval 5 month) past5months_fromdate from salaries;

select*, datediff(from_date, to_date) from salaries;

# employees who are with us more than 6 months.
SELECT *, datediff(to_date, from_date) as diff FROM salaries
WHERE DATEDIFF(to_date, from_date) > 180;

SELECT *, date_format(from_date, "%d %M %Y") from salaries;
