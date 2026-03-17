# SQL-assignment

DATABASE AND TABLE MANAGEMENT
-------------------------------

1. Create a new database called company_db.
   ```
   CREATE DATABASE IF NOT EXISTS company_db;
   ```

3. Select the company_db database for use.
   ```
   USE company_db;
   ```

5. Create a table named skills with columns: skill_id (auto-incremented primary key), skill_name (varchar, not null), and category (varchar).
   ```
   CREATE TABLE IF NOT EXISTS skills (
       skill_id INT AUTO_INCREMENT PRIMARY KEY,
       skill_name VARCHAR(100) NOT NULL,
       category VARCHAR(100)
   );
   ```

6. Show all databases available on the SQL server.
  ```
  SHOW DATABASES;
  ```

8. Show all tables in the company_db database.
   ```
   SHOW TABLES;
   ```

10. Rename the employee table to staff.
   ```
RENAME TABLE employee TO staff;
```


DATA INSERTION
-------------------------------

7. Insert a new record into the employee table for an employee named "Alice Green" with email "alice.green@company.com", hire date "2024-01-10", salary 62000.00, dept_id 4, and gender "Female".
   ```
   INSERT INTO employee (first_name, last_name, email, hire_date, salary, dept_id, gender)
   VALUES ('Alice', 'Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');
   ```

8. Insert multiple records into the project table.
   ```
   INSERT INTO project (project_name, budget, dept_id)
   VALUES 
   ('Mobile App', 60000.00, 2),
   ('Training Program', 25000.00, 1);
   ```

9. Add a new department "Sales" located in "Boston".
   ```
   INSERT INTO department (dept_name, location)
   VALUES ('Sales', 'Boston');
   ```

10. Insert an employee named "Tom" with only first name and email.
    ```
    INSERT INTO employee (first_name, email)
    VALUES ('Tom', 'tom@company.com');
    ```



DATA RETRIEVAL
-------------------------------

11. Retrieve all records from the employee table.
    ```
    SELECT * FROM employee;
    ```

13. Display employee ID, first name, and email with column aliases.
    ```
    SELECT emp_id AS "Employee ID",
           first_name AS "Name",
           email AS "Email Address"
    FROM employee;
    ```

14. List employees hired after January 1, 2023.
    ```
    SELECT * FROM employee
    WHERE hire_date > '2023-01-01';
    ```

15. Retrieve all projects with a budget greater than 40000 and sort them in descending order.
    ```
    SELECT * FROM project
    WHERE budget > 40000
    ORDER BY budget DESC;
    ```

16. Show distinct locations from the department table.
    ```
    SELECT DISTINCT location FROM department;
    ```



DATA MODIFICATION
-------------------------------

16. Add a new column phone_number to the employee table.
    ```
    ALTER TABLE employee
    ADD phone_number VARCHAR(15);
    ```

17. Update the salary of employee "John Doe" to 65000.
    ```
    UPDATE employee
    SET salary = 65000
    WHERE first_name = 'John' AND last_name = 'Doe';
    ```

18. Set gender = 'Other' for all employees in department 2.
   ```
    UPDATE employee
    SET gender = 'Other'
    WHERE dept_id = 2;
```

19. Remove the phone_number column from employee table.
    ```
    ALTER TABLE employee
    DROP COLUMN phone_number;
    ```



FILTERING AND CONDITIONS
-------------------------------

20. Find employees whose salary is between 60000 and 80000.
    ```
    SELECT * FROM employee
    WHERE salary BETWEEN 60000 AND 80000;
    ```

21. Retrieve employees whose first name starts with 'J'.
    ```
    SELECT * FROM employee
    WHERE first_name LIKE 'J%';
    ```

22. Show all projects belonging to departments 1 or 2.
   ```
    SELECT * FROM project
    WHERE dept_id IN (1, 2);
```

23. Retrieve employees whose email is not NULL.
  ```
    SELECT * FROM employee
    WHERE email IS NOT NULL;
```

24. Find departments not located in "New York" or "Chicago".
   ```
    SELECT * FROM department
    WHERE location NOT IN ('New York', 'Chicago');
   ```

25. Retrieve employees hired in the year 2023.
    ```
    SELECT * FROM employee
    WHERE YEAR(hire_date) = 2023;
    ```



AGGREGATE FUNCTIONS
-------------------------------

26. Find the total salary of all employees.
    ```
    SELECT SUM(salary) FROM employee;
    ```

28. Calculate the average project budget.
    ```
    SELECT AVG(budget) FROM project;
    ```

30. Find the highest salary in the employee table.
    ```
    SELECT MAX(salary) FROM employee;
    ```

32. Count the number of employees in department 2.
    ```
    SELECT COUNT(*) FROM employee
    WHERE dept_id = 2;
    ```

33. Find the minimum project budget.
    ```
    SELECT MIN(budget) FROM project;
    ```


JOINS
-------------------------------

31. Retrieve employee names along with their department names.
    ```
    SELECT e.*, d.dept_name
    FROM employee e
    JOIN department d ON e.dept_id = d.dept_id;
    ```

32. Display departments along with the number of employees in each.
    ```
    SELECT d.dept_name, COUNT(e.emp_id)
    FROM department d
    LEFT JOIN employee e ON d.dept_id = e.dept_id
    GROUP BY d.dept_name;
    ```

33. Show project names along with their department names.
    ```
    SELECT p.*, d.dept_name
    FROM project p
    JOIN department d ON p.dept_id = d.dept_id;
    ```

34. Retrieve employees working in departments located in "San Francisco".
    ```
    SELECT e.*
    FROM employee e
    JOIN department d ON e.dept_id = d.dept_id
    WHERE d.location = 'San Francisco';
    ```

35. Find departments with no assigned projects.
    ```
    SELECT d.*
    FROM department d
    LEFT JOIN project p ON d.dept_id = p.dept_id
    WHERE p.dept_id IS NULL;
    ```


STRING AND NUMERIC FUNCTIONS
-------------------------------

36. Display full names of employees by combining first_name and last_name.
   ```
   SELECT CONCAT(first_name, ' ', last_name) FROM employee;
   ```

38. Convert all department names to uppercase.
    ```
    SELECT UPPER(dept_name) FROM department;
    ```

40. Extract the first 3 characters of each employee's email.
    ```
    SELECT SUBSTRING(email, 1, 3) FROM employee;
    ```

42. Display the absolute value of -50000.
    ```
    SELECT ABS(-50000);
    ```

44. Round the average salary to 2 decimal places.
    ```
    SELECT ROUND(AVG(salary), 2) FROM employee;
    ```


ADVANCED QUERIES
-------------------------------

41. Retrieve the first 3 records from employee table sorted by hire_date descending.
    ```
    SELECT * FROM employee
    ORDER BY hire_date DESC
    LIMIT 3;
    ```

42. Retrieve records from 4th to 6th position using LIMIT and OFFSET.
    ```
    SELECT * FROM employee
    ORDER BY emp_id
    LIMIT 3 OFFSET 3;
    ```

43. Classify employees as 'High' or 'Low' salary based on salary >= 70000.
    ```
    SELECT first_name, salary,
    CASE 
        WHEN salary >= 70000 THEN 'High'
        ELSE 'Low'
    END
    FROM employee;
    ```

44. Categorize projects as Large, Medium, or Small based on budget.
    ```
    SELECT project_name, budget,
    CASE
        WHEN budget >= 60000 THEN 'Large'
        WHEN budget >= 40000 THEN 'Medium'
        ELSE 'Small'
    END
    FROM project;
    ```

45. Show total budget for each department.
    ```
    SELECT dept_id, SUM(budget)
    FROM project
    GROUP BY dept_id;
    ```

46. Retrieve the employee with the longest first name.
    ```
    SELECT * FROM employee
    ORDER BY LENGTH(first_name) DESC
    LIMIT 1;
    ```

47. Find employees hired in the last 90 days.
    ```
    SELECT * FROM employee
    WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY);
    ```


DELETION AND CLEANUP
-------------------------------

48. Delete employees with salary less than 60000.
    ```
    DELETE FROM employee
    WHERE salary < 60000;
    ```

49. Drop the project table.
    ```
    DROP TABLE project;
    ```

50. Backup the company_db database and then delete it.
    ```
    -- Backup:
    -- mysqldump -u username -p company_db > backup.sql
    -- Delete:
    DROP DATABASE company_db;
    ```
