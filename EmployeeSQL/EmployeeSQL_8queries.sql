-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no,emp.first_name,emp.last_name,emp.gender,s.salary FROM EMPLOYEES AS emp
INNER JOIN salaries AS s
ON emp.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT * FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.*,dm.emp_no,emp.last_name,emp.first_name,dm.from_date, dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
INNER JOIN employees AS emp
ON dm.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no,emp.last_name,emp.first_name,d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de
ON d.dept_no = de.dept_no
INNER JOIN employees AS emp
ON de.emp_no = emp.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT de.emp_no,emp.first_name,emp.last_name,d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de
ON d.dept_no = de.dept_no
INNER JOIN employees AS emp
ON de.emp_no = emp.emp_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT de.emp_no,emp.first_name,emp.last_name,d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de
ON d.dept_no = de.dept_no
INNER JOIN employees AS emp
ON de.emp_no = emp.emp_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT last_name, COUNT(*) As "Frequency Count"
FROM employees
GROUP BY las_tname
ORDER BY "Frequency Count" Desc;

