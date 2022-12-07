CREATE TABLE employees (
	emp_no SERIAL PRIMARY KEY,
	birth_date varchar(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(10),
	hire_date VARCHAR (40)
);

SELECT *
FROM employees

CREATE TABLE titles (
	emp_no INT,
	title varchar(30),
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM titles

CREATE TABLE salaries (
	emp_no INT,
	salary varchar(60),
	from_date VARCHAR(60),
	to_date VARCHAR(60),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no varchar(30),
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
FROM dept_emp

CREATE TABLE departments (
	dept_no varchar(30) PRIMARY KEY,
	dept_name varchar(30)
);

SELECT *
FROM departments

CREATE TABLE dept_manager (
	dept_no varchar(60),
	emp_no INT,
	from_date VARCHAR(60),
	to_date VARCHAR(60),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT *
from dept_manager