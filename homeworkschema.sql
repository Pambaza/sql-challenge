CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);
select * from "Departments";


CREATE TABLE "Dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);
select * from "Dept_emp";

CREATE TABLE "Dept_Manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" int   NOT NULL
);

select * from "Dept_Manager";

drop table "Employees"
CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

select * from "Employees";

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);
select * from "Salaries";

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);
select * from "Titles";
-- import all the csv's

SELECT * FROM Salaries;
 
--list the following details of each employee: employee number, last name, first name, sex, and salary.
select E.emp_no, E.first_name, E.last_name, E.first_name, E.sex, S.salary
from "Employees" as E 
left join "Salaries" as S on S.emp_no = E.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from "Employees" 
where hire_date like '1986%';

-- List the manager of each department with the following information: department number, department name, 
---the manager's employee number, last name, first name.

select dept.dept_no, dept.dept_name, Mgr.emp_no, E.last_name, E.first_name
from "Departments" as dept 
inner join "Dept_manager" as Mgr on Mgr.dep_no = Dept.dept_no
inner join "Employee" as E on E.dept_no = Dept.dept_no;

-- List the dept of each employee with the following inf0: employee number, last name, first name, and depart name.
select E. emp_no, E.last_name, E.first_name, D.dept_name
from "Employees" as E 
inner join "Dept_emp" as Dept on Dept.emp_no = E.emp_no
inner join "Departments" as D on D.dept_no = Dept.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from "Employees" 
where first_name = 'Hercules' and last_name like 'B%'; 

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select E. emp_no, E.last_name, E.first_name, D.dept_name
from "Employees" as E 
inner join "Dept_emp" as Dept on Dept.emp_no = E.emp_no
inner join "Departments" as D on D.dept_no = Dept.dept_no
where dept_name ='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select E. emp_no, E.last_name, E.first_name, D.dept_name
from "Employees" as E 
inner join "Dept_emp" as Dept on Dept.emp_no = E.emp_no
inner join "Departments" as D on D.dept_no = Dept.dept_no
where dept_name ='Sales' and 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
select last_name, count(first_name) as headcount
from "Employees"
group by last_name
order by last_name desc;
