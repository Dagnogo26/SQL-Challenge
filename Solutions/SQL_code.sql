SELECT * FROM public."Salaries"
--List the following details of each employee: employee number, last name, first name, sex, and salary
CREATE VIEW Employees_info AS
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM public."Employees" AS e
INNER JOIN public."Salaries" AS s
ON e.emp_no= s.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW Hire_in_1986 AS
SELECT first_name, last_name, hire_date
FROM public."Employees" 
WHERE hire_date LIKE '%1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name

CREATE VIEW Manager_info AS
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM public."Department" AS d
INNER JOIN public."Dept_Manager" AS m
ON d.dept_no= m.dept_no
INNER JOIN public."Employees" AS e
ON e.emp_no= m.emp_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM public."Employees"
SELECT * FROM public."Dept_emp"

CREATE VIEW Employee_dept_info AS
SELECT e.emp_no, e.last_name, e.first_name, d_.dept_name
FROM public."Dept_emp" AS d
INNER JOIN public."Department" AS d_
ON d.dept_no= d_.dept_no
INNER JOIN public."Employees" AS e
ON e.emp_no= d.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

CREATE VIEW last_name_B AS
SELECT first_name, last_name, sex
FROM public."Employees" 
WHERE first_name= 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
 CREATE VIEW Sales_employees AS
 SELECT emp_no, last_name, first_name, dept_name
 FROM employee_dept_info
 WHERE dept_name= 'Sales';
 
-- employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
 SELECT * FROM employee_dept_info
 
 CREATE VIEW Sales_dept_employees AS
 SELECT emp_no, last_name, first_name, dept_name
 FROM employee_dept_info
 WHERE dept_name= 'Sales' OR  dept_name= 'Development';
 
 --In descending order, list the frequency count of employee last names
 
 CREATE VIEW name_count AS 
  SELECT last_name, COUNT(last_name) AS count_name
  FROM public."Employees" 
  GROUP BY last_name
  ORDER BY count_name DESC;