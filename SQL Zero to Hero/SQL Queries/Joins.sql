set sql_safe_updates =0;
####INNER JOIN ON SINGLE COLUMN ######
################dept2######################################
Create table department2 as select * from departments;

select * from department2 order by dept_no;

delete from department2 where dept_no="d001";

alter table department2 modify dept_no char(4);

update department2 set dept_no=NULL where dept_no="d002";

###################dept_manager2###################################
Create table dept_manager2 as select * from dept_manager;
select * from dept_manager2;
alter table dept_manager2 modify dept_no char(4);
update dept_manager2 set dept_no=NULL where dept_no="d008";
###################################################################
select * from department2;
select * from dept_manager2;

select A.dept_no, A.dept_name, B.emp_no
from department2 as A
INNER JOIN dept_manager2 as B ON A.dept_no = B.dept_no;

#####INNER JOIN ON MULTIPLE COLUMNS#######
Create table Marketting(
	Month char(4),
    Year int,
    MarkettingSpeed INT
);

Create table Revenue(
		Month char(4),
        Year int,
        Revenue int
); 

INSERT INTO Marketting
Values ("Jan", 2020, 20000),
("Jan", 2021, 10000),
("Feb",2020,30000),
("Feb",2021,40000);

INSERT INTO Revenue
Values ("Jan", 2020, 30000),
("Jan", 2021, 15000),
("Feb",2020,20000),
("Feb",2021,50000);

/*
INSERT INTO Marketting (Month, Year, MarkettingSpeed)
Values ("Mar", 2020, 22000),
("Feb",2022, 85000);

INSERT INTO Revenue (Year, Revenue)
Values (2020, 20000),
(2022, 88000);

INSERT INTO Revenue (Month, Revenue)
Values ("Jan", 35000),
("Mar", 55000);

INSERT INTO Revenue (Revenue)
Values (50000),
(28000);
*/


Select * from Marketting;
Select * from Revenue;

Select M.Month, M.Year, M.MarkettingSpeed, R.Revenue
From Marketting as M
INNER JOIN Revenue as R ON M.month=R.month AND M.Year=R.Year;

#########LEFT JOIN on 2 columns########
Select M.Month, M.Year, M.MarkettingSpeed, R.Revenue
From Marketting as M
Left Join Revenue as R on M.month=R.month AND M.Year=R.Year;

#########RIGHT JOIN on 2 columns########
Select R.Month, R.Year, M.MarkettingSpeed, R.Revenue
From Marketting as M
Right Join Revenue as R on M.month=R.month AND M.Year=R.Year;

#########MULTIPLE JOINS#################
# I want to fetch employee's first_name, last_name, from_date, dept_name
# from employees join dept_manager join departments
Select e.first_name, e.last_name, de.from_date, d.dept_name
FROM employees e
JOIN dept_manager de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

##########Example of Join##############
/* Average salary of female managers by department having average salary more than 60000 */
Select d.dept_name, Avg(salary) as avg_salary
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN salaries s ON dm.emp_no = s.emp_no
JOIN employees e ON s.emp_no = e.emp_no
WHERE e.gender = "F"
GROUP by d.dept_name
having avg_salary > 60000
order by avg_salary;

############# UNION & UNION ALL ###############
drop table if exists sales1;

CREATE TABLE sales1(sales int, month varchar(15));
CREATE TABLE sales2(sales int, month varchar(15));

INSERT INTO sales1 Values(200, "JAN"), (300, "FEB");
INSERT INTO sales2 Values(300, "FEB"), (100, "MAR");

Select * from sales1 UNION ALL select * from sales2;