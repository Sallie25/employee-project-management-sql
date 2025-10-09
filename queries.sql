USE deeptech_employeedb;

/* 3. Group employees by department and:
Display department_name, total salary, and average salary.
Only return departments with more than 3 employees AND average salary > 100,000.
*/

SELECT
		d.department_name,
        SUM(salary) Total_salary,
        AVG(salary) Average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(d.department_id) > 3 AND Average_Salary > 100000
;

/*
4. Write a query to:
Increase the salary of employees who worked more than 40 hours on any project by 12%.
Move employees hired before 2020 and working in “Support” to a new department called “Legacy Support”.
Delete all employees who work in a department that has only one employee in total.
*/

-- 4A - Increase the salary of employees who worked more than 40 hours on any project by 12%.
UPDATE employees AS e
JOIN employee_projects AS ep
ON e.employee_id = ep.employee_id
SET e.salary = e.salary * (1 + (12 / 100))
WHERE ep.hours_worked > 40;

SELECT * FROM employees;

-- 4B - Move employees hired before 2020 and working in “Support” to a new department called “Legacy Support”.

-- Insert a new department called Legacy support to the departments Table
INSERT INTO departments (department_name)
value ('Legacy Support');

-- Find the department_id for 'Support' AND 'Legacy Support'
SELECT department_id 
FROM departments
WHERE department_name = 'Legacy Support' OR department_name = 'Support' ;

-- Moving employees hired before 2020 and working in “Support” to a new department called “Legacy Support”.

UPDATE employees
SET department_id = 6
WHERE department_id = 5
AND hire_date < '2020-01-01';

-- 4C - Delete all employees who work in a department that has only one employee in total.

-- Run this first to be sure of the department that fit the category

-- find rows that satisfy the conditions
SELECT department_id
FROM
(SELECT department_id, COUNT(*) No_of_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) = 1
)t1; 

-- Delete

DELETE 
FROM employees
WHERE department_id IN (SELECT t1.department_id
FROM
(SELECT department_id, COUNT(*) No_of_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) = 1
	)t1
);

/* 5. For every employee:
-- Show full name, department name, and total hours worked across all projects.
-- Only include employees who have worked on more than 1 project.
-- Use aliasing and at least one aggregate function.
*/

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM employee_projects;


SELECT 
	e.first_name, 
	e.last_name,
	d.department_name,
	p.project_name,
	ep.hours_worked
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN employee_projects ep
ON e.employee_id = ep.employee_id
JOIN projects p
ON ep.project_id = p.project_id
WHERE e.employee_id IN (
		SELECT employee_id
		FROM employee_projects
		GROUP BY employee_id
		HAVING COUNT(project_id) > 1
)



