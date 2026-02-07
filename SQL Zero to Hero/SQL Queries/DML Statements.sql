USE employees;

#SELECT WITH WHERE
SELECT 
    first_name, last_name, gender, hire_date
FROM
    employees
WHERE
	gender ="M";

#SELECT WITH WHERE AND
SELECT 
    first_name, last_name, gender, hire_date
FROM
    employees
WHERE
	gender ="M" AND hire_date >= "2000-01-01";

select * from employees;

#SELECT WITH WHERE AND, OR
SELECT 
    first_name, last_name, gender, hire_date
FROM
    employees
WHERE
	gender ="F" AND (first_name="Bezalel" OR first_name="Chirstian");
    
#SELECT WITH WHERE IN

SELECT 
    first_name, last_name, gender, hire_date
FROM
    employees
WHERE
	first_name IN("Bezalel","Parto","Chirstian");
    
#SELECT WITH WHERE LIKE
SELECT 
    first_name, last_name, gender, hire_date
FROM
    employees
WHERE
	first_name LIKE "_E%";
    
#SELECT WITH WHERE BETWEEN AND
SELECT 
    first_name, last_name, gender, hire_date
FROM
    employees
WHERE
	hire_date BETWEEN "1999-01-01" AND "1999-02-01";



