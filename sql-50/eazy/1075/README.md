# 1075. Project Employees I

**Intuition**  
This problem asks us to calculate the average years of experience for each project. We need to join the Project table with the Employee table to get the experience years for each employee, then calculate the average experience years for each project. The result should be rounded to 2 decimal places, and if a project has no employees with experience data, the average should be 0.

**Code**

```sql
SELECT
    project_id,
    ROUND(AVG(IFNULL(e.experience_years, 0)), 2) AS average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY project_id
```

**Approach**

1. Join the Project and Employee tables:

   - Use Project as the base table to ensure all projects are included in the result
   - LEFT JOIN with Employee table to get employee experience data
   - The join condition `p.employee_id = e.employee_id` matches each project entry with the corresponding employee

2. Calculate the average experience years:

   - Use AVG function to compute the average of experience_years for each project
   - Use IFNULL to handle NULL values, replacing them with 0
   - Apply ROUND to limit the result to 2 decimal places

3. Group the results by project_id:
   - This ensures we get one row per project with the average experience

**Complexity**

- Time complexity: O(n), where n is the number of rows in the Project table. The query needs to scan through all project records and perform a join operation.
- Space complexity: O(p), where p is the number of unique project_ids, as we need to store the result for each project.
