
/*
--------------------EXPERIMENT 03: (EASY LEVEL)

PS: YOU ARE GIVEN WITH EMPLOYEE TABLE WITH ONLY ONE ATTRIBUTE THAT IS EMP_ID WHICH CONTAINS VALUES AS:
										EMPLOYEE (EMP_ID)
                    						2
                                4
                                4
                                6
                                6
                                7
                                8
                                8
                                8
  TASK: FIND THE MAXIMUM VALUE FOR EMP_ID, BUT EXCLUDING THE DUPLICATE EMPLOYEE ID'S. (ONLY WITH SUB-QUERIES)
  OUTPUT: 7  
  
  EXPLAINATION: IF WE EXCLUDE DUPLICATES SUCH AS, 4, 6, AND 8, & FROM THE REST I.E., 2,7 THE MAXIMUM IS 7.
  */
  use sub_queries
  CREATE TABLE employee(emp_id INT)
INSERT INTO employee(emp_id) 
VALUES
	(2),
	(4),
	(4),
	(6),
	(6),
	(7),
	(8),
	(8)

SELECT MAX(emp_id) AS 'MAX ID' FROM employee
WHERE emp_id NOT IN
(SELECT emp_id FROM employee 
GROUP BY (emp_id) 
HAVING COUNT(*)>1)








--------------------EXPERIMENT 03: (MEDIUM LEVEL)
CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);


select*from employee_1
select*from department

select (select dept_name from department where id=e.department_id) as dept_name, [name],salary 
from employee_1 as e 
where salary in (select max(salary) from employee_1 group by department_id) 
order by department_id


select (select dept_name from department where id=e.department_id) as dept_name, [name],salary 
from employee_1 as e 
where salary = (select max(salary) from employee_1 e2 where e2.department_id =e.department_id) 
order by department_id








-----------Expriment 3 hard level
create table a(empid int,ename varchar(max),salary int )

create table b(empid int,ename varchar(max),salary int )

insert into a
values
	(1,'AA',1000),
	(2,'BB',300)

insert into b
values
	(1,'BB',400),
	(2,'CC',100)

select empid,ename,min(salary) as salary
from
(select * from a
union all
select * from b)
as u

group by empid,ename




SELECT U.empID, U.Ename, MIN(U.Salary) AS Salary
FROM 
	(
		SELECT A.empID,A.Ename, A.Salary FROM A
		UNION ALL
		SELECT B.empID,  B.Ename, B.Salary FROM B
	) as U
GROUP BY U.empID,U.Ename;
