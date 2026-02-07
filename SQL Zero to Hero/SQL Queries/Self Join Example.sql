/*Find out the emp_no, latest department, latest department manager in a single view */

SELECT 
    d.first_name,
    d.emp_no,
    d.manager_no,
    f.first_name AS manager_name
FROM
    (SELECT 
        e.first_name, de.emp_no, de.dept_no, c.emp_no AS manager_no
    FROM
        dept_emp de
    JOIN employees e ON e.emp_no = de.emp_no
    JOIN (SELECT 
        emp_no, MAX(from_date) AS latest_date
    FROM
        dept_emp
    GROUP BY emp_no) AS a ON de.emp_no = a.emp_no
        AND de.from_date = a.latest_date
    JOIN (SELECT 
        dm.dept_no, dm.emp_no
    FROM
        dept_manager dm
    JOIN (SELECT 
        dept_no, MAX(from_date) AS latest_date
    FROM
        dept_manager
    GROUP BY dept_no) AS b ON dm.dept_no = b.dept_no
        AND dm.from_date = b.latest_Date) AS C ON de.dept_no = c.dept_no) AS D
        JOIN
    (SELECT 
        e.first_name, de.emp_no, de.dept_no, c.emp_no AS manager_no
    FROM
        dept_emp de
    JOIN employees e ON e.emp_no = de.emp_no
    JOIN (SELECT 
        emp_no, MAX(from_date) AS latest_date
    FROM
        dept_emp
    GROUP BY emp_no) AS a ON de.emp_no = a.emp_no
        AND de.from_date = a.latest_date
    JOIN (SELECT 
        dm.dept_no, dm.emp_no
    FROM
        dept_manager dm
    JOIN (SELECT 
        dept_no, MAX(from_date) AS latest_date
    FROM
        dept_manager
    GROUP BY dept_no) AS b ON dm.dept_no = b.dept_no
        AND dm.from_date = b.latest_Date) AS C ON de.dept_no = c.dept_no) AS f ON d.manager_no = f.emp_no;