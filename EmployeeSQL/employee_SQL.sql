--Data Engineering #2

create table departments (
	departments_ID VARCHAR   NOT NULL,
	departments_Name VARCHAR NOT NULL,
	primary key (departments_ID)
);


create table titles (
	titel_ID VARCHAR   NOT NULL,
	titel VARCHAR NOT NULL,
	primary key (titel_ID)
);


create table employees (
	employee_ID INTEGER   NOT NULL,
	titel_ID VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	primary key (employee_ID),
	FOREIGN KEY (titel_ID) references titles(titel_ID)
);


create table department_employees (
	employee_ID INTEGER   NOT NULL,
	departments_ID VARCHAR NOT NULL, 
	FOREIGN KEY (employee_ID) references employees(employee_ID),
	FOREIGN KEY (departments_ID) references departments(departments_ID),
	primary key (employee_ID,departments_ID)
);


create table salaries (
	employee_ID INTEGER   NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (employee_ID) references employees(employee_ID),
	primary key (employee_ID)
);


create table department_manager (
	departments_ID VARCHAR NOT NULL,
	employee_ID INTEGER   NOT NULL,
	FOREIGN KEY (employee_ID) references employees(employee_ID),
	FOREIGN KEY (departments_ID) references departments(departments_ID),
	primary key (employee_ID)
);


--Data Analysis
--Number 1: List the employee number, last name, first name, sex, and salary of each employee.
select employees.employee_ID,employees.last_name,employees.first_name,employees.sex,salaries.salary
from employees
INNER JOIN salaries on employees.employee_ID=salaries.employee_ID;

--Number 2:List the first name, last name, and hire date for the employees who were hired in 1986
select employees.first_name,employees.last_name,employees.hire_date
from employees
where hire_date Like '%/1986';

--Number 3:List the manager of each department along with their department number, department name, employee number, last name, and first name
select department_manager.departments_ID,departments.departments_Name,department_manager.employee_ID,employees.last_name,employees.first_name
from department_manager
LEFT JOIN employees on employees.employee_ID=department_manager.employee_ID
LEFT JOIN departments on departments.departments_ID=department_manager.departments_ID;

--Number 4:List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select department_employees.departments_ID,department_employees.employee_ID,employees.last_name,employees.first_name,departments.departments_Name
from department_employees
LEFT JOIN employees on employees.employee_ID=department_employees.employee_ID
LEFT JOIN departments on departments.departments_ID=department_employees.departments_ID;

--Number 5:List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select employees.first_name,employees.last_name,employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%' ;

--Number 6:List each employee in the Sales department, including their employee number, last name, and first name
select department_employees.employee_ID,employees.last_name,employees.first_name
from department_employees
LEFT JOIN employees on employees.employee_ID=department_employees.employee_ID
LEFT JOIN departments on departments.departments_ID=department_employees.departments_ID
where  departments_Name='Sales';

--Number 7:List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select department_employees.employee_ID,employees.last_name,employees.first_name,departments.departments_Name
from department_employees
LEFT JOIN employees on employees.employee_ID=department_employees.employee_ID
LEFT JOIN departments on departments.departments_ID=department_employees.departments_ID
where  departments_Name='Sales' or departments_Name='Development';

--Number 8:List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select count (last_name) as frequency, last_name
from employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;