--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select  e.emp_no "employee number",
		e.last_name "last name",
		e.first_name "first name",
		e.gender,
		s.salary
from employees e
join salaries s on e.emp_no = s.emp_no


--2. List employees who were hired in 1986.

select * from employees e
where to_date(to_char(e.hire_date, 'YYYY'), 'YYYY') = to_date('1986', 'YYYY')


-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

select dm.dept_no "department number",
		d.dept_name "department name",
		e.emp_no "employee number",
		e.last_name "last name",
		e.first_name "first name",
		dm.from_date "start date",
		dm.to_date "end date"
from dept_manager dm
join departments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no "employee number",
		e.last_name "last name",
		e.first_name "first name",
		dept.dept_name
from employees e
join (
		select ed.emp_no, d.dept_name from departments d
	 	join emp_dept ed on d.dept_no = ed.dept_no
	 ) dept
on e.emp_no = dept.emp_no


--5. List all employees whose first name is "Hercules" and last names begin with "B."

select * from employees
where first_name = 'Hercules'
and last_name like 'B%'


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no "employee number",
		e.last_name "last name",
		e.first_name "first name",
		dept.dept_name
from employees e
join (
		select ed.emp_no, d.dept_name from departments d
	 	join emp_dept ed on d.dept_no = ed.dept_no
	 ) dept
on e.emp_no = dept.emp_no
where dept.dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no "employee number",
		e.last_name "last name",
		e.first_name "first name",
		dept.dept_name
from employees e
join (
		select ed.emp_no, d.dept_name from departments d
	 	join emp_dept ed on d.dept_no = ed.dept_no
	 ) dept
on e.emp_no = dept.emp_no
where dept.dept_name in ('Sales', 'Development')


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name) "count"
from employees
group by last_name 
order by "count" desc



