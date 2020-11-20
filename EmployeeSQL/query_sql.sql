-- DATA ANALYSIS (SQL Challenge)

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT emp_no, first_name, last_name, hire_date from employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d
	ON dm.dept_no=d.dept_no
LEFT JOIN employees AS e
	ON dm.emp_no=e.emp_no;
	
-- 4. List the department of each employee with the following information: 
-- 	employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN departments as d
	ON de.dept_no=d.dept_no
LEFT JOIN employees AS e
	ON de.emp_no=e.emp_no;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex from employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e 
LEFT JOIN dept_emp as de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e 
LEFT JOIN dept_emp as de
	ON e.emp_no=de.emp_no
INNER JOIN departments AS d
	ON de.dept_no=d.dept_no
WHERE d.dept_name in ('Sales', 'Development');

-- 8.  In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS freqency_count
FROM employees
GROUP BY last_name
ORDER BY freqency_count DESC;