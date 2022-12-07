-- 1. Create a view that holds the retirement eligibile employees.

CREATE VIEW retirement_info
AS
select emp_no, first_name, last_name
from "Employees"
where birth_date BETWEEN '1952-01-01' and'1955-12-31'
and hire_date BETWEEN '1985-01-01' and '1988-12-31'
ORDER BY emp_no ASC;

select * from retirement_info;



-- 2. Create a view that holds a list of all the current employees, include the employee number, first and last name.

CREATE VIEW current_employees
AS
select r.emp_no, r.first_name, r.last_name,d.to_date
from retirement_info as r
join "Department_Employee" as d ON d.emp_no = r.emp_no
where to_date = '9999-1-01'
ORDER BY r.emp_no ASC;

select * from current_employees;


-- 3. Get the average salary by title for the current employees. 

select sa.title, round(avg(sa.salary),2) as avg_salary
from current_employees as ce
join(select s.salary, ti.title, s.emp_no
	from "Salaries" as s
	join "Title" as ti ON ti.emp_no = s.emp_no) as sa ON sa.emp_no = ce.emp_no
GROUP BY sa.title
ORDER BY avg_salary asc;


-- 4. Get the average salary by department for the current employees. 

select sa.dept_name, round(avg (sa.salary),3) as avg_salary
from current_employees as ce
join(select dn.dept_name, s.salary, s.emp_no
 	from "Salaries" as s
 	join(select de.emp_no, de.dept_no, d.dept_name
 		from "Department_Employee" as de
 		join "Departments" as d 
		ON d.dept_no = de.dept_no) as dn 
	 ON dn.emp_no = s.emp_no) as sa 
ON sa.emp_no = ce.emp_no
GROUP BY sa.dept_name
ORDER BY avg_salary asc;
 

-- 5. Compare the average salary by title for each department for the current employees.

select es.dept_name, es.title, round(avg (es.salary),2) as avg_salary
from current_employees as ce
join(select ti.title, ds.dept_name, ds.salary, ds.emp_no
	from "Title" as ti
	join (select dn.dept_name, s.salary, s.emp_no
		from "Salaries" as s
		join(select de.emp_no, de.dept_no, d.dept_name
			from "Department_Employee" as de
			join "Departments" as d 
			ON d.dept_no = de.dept_no) as dn 
		 ON dn.emp_no = s.emp_no) as ds ON ds.emp_no = ti.emp_no)as es
	ON es.emp_no = ce.emp_no
Group BY es.title,es.dept_name 
ORDER BY es.title, avg_salary asc
;


-- 6. Determine the number of current employees by title and grouped within departments. 
-- And, rank the results by title within each department. 

select es.title, es.dept_name, count(es.emp_no) as employee_count,
	RANK() OVER(
		PARTITION BY es.dept_name
		ORDER BY count(es.emp_no) desc
	) rank
from current_employees as ce
join(select ti.title, ds.dept_name, ds.salary, ds.emp_no
	from "Title" as ti
	join (select dn.dept_name, s.salary, s.emp_no
		from "Salaries" as s
		join(select de.emp_no, de.dept_no, d.dept_name
			from "Department_Employee" as de
			join "Departments" as d 
			ON d.dept_no = de.dept_no) as dn 
		 ON dn.emp_no = s.emp_no) as ds ON ds.emp_no = ti.emp_no)as es
	ON es.emp_no = ce.emp_no
Group BY es.title,es.dept_name
ORDER BY es.dept_name, employee_count desc;
;
