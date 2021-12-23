--1. List employee number, last name, first name, sex, and salary.
SELECT  emp_no, last_name, first_name, sex, (select salary from "Salaries" where  "Employee".emp_no = "Salaries".emp_no) as Salary
FROM 
public."Employee";

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT   first_name, last_name,  hire_date
FROM 
public."Employee"
WHERE extract(year from hire_date) = 1986;
--hire_date between '1985-12-31' and '1986-12-31'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no , dp.dept_name, em.emp_no, em.last_name,em.first_name
FROM public."Employee" em
JOIN "Dept_Manager" dm on em.emp_no = dm.emp_no
JOIN "Departments" dp on dm.dept_no = dp.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT  emp.emp_no, emp.last_name,emp.first_name,  dp.dept_name
FROM public."Employee" emp
JOIN "Dept_emp" dpe on dpe.emp_no = emp.emp_no
JOIN "Departments" dp on dpe.dept_no = dp.dept_no ;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM public."Employee"
WHERE first_name = 'Hercules' and last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT  emp.emp_no, emp.last_name,emp.first_name,  dp.dept_name
FROM public."Employee" emp
JOIN "Dept_emp" dpe on dpe.emp_no = emp.emp_no
JOIN "Departments" dp on dpe.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  emp.emp_no, emp.last_name,emp.first_name,  dp.dept_name
FROM public."Employee" emp
JOIN "Dept_emp" dpe on dpe.emp_no = emp.emp_no
JOIN "Departments" dp on dpe.dept_no = dp.dept_no
WHERE dp.dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name , count(*) as Same_Last_N
FROM public."Employee"
GROUP BY last_name
ORDER BY Same_Last_N DESC

--SELECT "Employee".last_name
--FROM public."Employee"
--WHERE "Employee".last_name = 'Baba'

