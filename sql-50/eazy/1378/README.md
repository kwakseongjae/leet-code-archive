# 1378. Replace Employee ID With The Unique Identifier

**Intuition**  
This problem requires us to retrieve the unique identifier and name of each employee. The challenge is that the data is split across two tables: `Employees` contains the names while `EmployeeUNI` contains the unique identifiers. Since some employees might not have a unique identifier assigned yet, we need to ensure all employees are included in our result, even those without a unique ID.

**Code**  
```sql
SELECT eu.unique_id, e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS eu
ON e.id = eu.id
```

**Approach**  
1. Use a LEFT JOIN operation:
   * Start with the `Employees` table as the base table to ensure all employees are included
   * LEFT JOIN with the `EmployeeUNI` table to retrieve matching unique IDs
   * The join condition `e.id = eu.id` connects the records based on employee ID
2. Select the required columns:
   * `eu.unique_id` gives us the unique identifier (will be NULL for employees without a matching record)
   * `e.name` gives us the employee name from the base table

**Complexity**  
* Time complexity: O(n + m), where n is the number of rows in the Employees table and m is the number of rows in the EmployeeUNI table.
* Space complexity: O(n), as we need to return all employees from the Employees table.