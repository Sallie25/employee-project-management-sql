-- CREATE DATABASE AND DROP IT IF ALREADY EXIST
DROP DATABASE IF EXISTS `Deeptech_employeeDB`;
CREATE DATABASE `Deeptech_employeeDB`;
USE `Deeptech_employeeDB`;

-- CREATING SCHEMAS

DROP TABLE IF EXISTS employee_projects;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- departments
CREATE TABLE departments (
  department_id INT AUTO_INCREMENT PRIMARY KEY,
  department_name VARCHAR(100)
);

-- Employees table
CREATE TABLE employees (
employee_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(100),
Last_name VARCHAR(100),
department_id INT,
hire_date DATE,
salary INT,
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);



-- projects projects(project_id, project_name, start_date, end_date)
CREATE TABLE projects(
project_id INT NOT NULL PRIMARY KEY,
project_name VARCHAR(100),
start_date date,
end_date date
);



-- employee_projects
CREATE TABLE employee_projects(
project_id INT NOT NULL,
employee_id INT NOT NULL,
hours_worked INT,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


-- departments
INSERT INTO departments (department_name)
VALUES
('Data Engineering'),
('Data Science'),
('Business Intelligence'),
('Machine Learning'),
('Support'),
('Legacy Support');

-- employees
INSERT INTO employees (employee_id, first_name, last_name, department_id, hire_date, salary) 
VALUES
(101, 'Salome', 'Okoro', 1, '2022-03-15', 95000),
(102, 'Ada', 'Nwosu', 2, '2021-06-01', 135000),
(103, 'Chidi', 'Eze', 3, '2020-11-20', 88000),
(104, 'Tunde', 'Adebayo', 4, '2023-01-10', 160000),
(105, 'Ngozi', 'Obi', 5, '2019-08-05', 102000), 
(106, 'Kemi', 'Balogun', 1, '2021-09-12', 125000),
(107, 'Ifeanyi', 'Okafor', 2, '2020-05-25', 99000),
(108, 'Zainab', 'Abdullahi', 3, '2023-04-18', 130000),
(109, 'Emeka', 'Umeh', 4, '2022-12-01', 78000),
(110, 'Fatima', 'Yusuf', 5, '2018-07-30', 115000), 
(111, 'Bola', 'Akin', 5, '2023-02-10', 105000),
(112, 'David', 'Ojo', 2, '2022-10-01', 140000),
(113, 'Grace', 'Ibrahim', 2, '2023-03-22', 108000);

-- projects
INSERT INTO projects (project_id, project_name, start_date, end_date)
VALUES
(201, 'SQL Mastery Bootcamp', '2023-09-01', '2023-10-15'),
(202, 'Python for Data Science', '2023-08-01', '2023-09-30'),
(203, 'Power BI Dashboarding', '2023-07-01', '2023-08-15'),
(204, 'Machine Learning Fundamentals', '2023-10-01', '2023-11-30');

-- employee-projects
INSERT INTO employee_projects (employee_id, project_id, hours_worked) 
VALUES
(101, 201, 40),
(102, 202, 35),
(103, 203, 30),
(104, 204, 45), 
(105, 201, 25),
(106, 202, 40),
(107, 203, 38),
(108, 204, 42),
(109, 201, 36),
(110, 202, 33),
(101, 203, 20),
(102, 204, 28),
(103, 201, 32),
(104, 202, 37), 
(105, 204, 29);

-- QA
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM employee_projects;

-- Updating the employees table






