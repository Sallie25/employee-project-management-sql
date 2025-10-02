# Employee Project Management SQL

This project demonstrates the design, creation, and querying of a relational database system to manage employees, departments, and project assignments. It includes schema definitions, bulk data insertion, and advanced SQL queries for reporting and data manipulation.

## 📐 Database Schema

The system consists of four core tables:

- **employees**: Stores employee details.
  - `employee_id`, `first_name`, `last_name`, `department_id`, `hire_date`, `salary`
- **departments**: Stores department information.
  - `department_id`, `department_name`
- **projects**: Stores project details.
  - `project_id`, `project_name`, `start_date`, `end_date`
- **employee_projects**: Tracks employee assignments to projects.
  - `employee_id`, `project_id`, `hours_worked`

All tables include appropriate data types, primary keys, foreign keys, and constraints to ensure referential integrity.

## 📥 Bulk Data Insertion

The database is populated with:

- 5 departments
- 10 employees distributed across departments
- 4 projects
- 15 employee-project assignment records

## 📊 Analytical Queries

### 1. Department Salary Summary

Group employees by department and display:

- `department_name`
- `total_salary`
- `average_salary`

**Filter**: Only include departments with more than 3 employees and an average salary greater than 100,000.

### 2. Data Manipulation Queries

- **Salary Update**: Increase salary by 12% for employees who worked more than 40 hours on any project.
- **Department Reassignment**: Move employees hired before 2020 and working in “Support” to a new department called “Legacy Support”.
- **Employee Cleanup**: Delete employees who work in departments with only one employee.

### 3. Employee Work Summary

For each employee who has worked on more than one project:

- Show full name (aliased)
- Department name
- Total hours worked (using aggregate function)

## 🛠️ Technologies Used

- SQL (PostgreSQL / MySQL compatible)
- Relational database design principles
- Aggregate functions, subqueries, joins, and conditional logic

## 📂 Structure

