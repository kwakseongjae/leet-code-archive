# 570. Managers with at Least 5 Direct Reports

**Intuition**  
This problem asks us to find managers who have at least 5 direct reports. In the Employee table, each employee has an ID and potentially a manager ID (which is another employee's ID). We need to count how many employees report to each manager and return the names of managers with at least 5 direct reports.

**Code**  
```sql
SELECT name 
FROM Employee 
WHERE id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(managerId) >= 5
);
```

**Approach**  
1. Identify managers with at least 5 direct reports:
   * Use a subquery to analyze the Employee table
   * GROUP BY managerId to group all employees under the same manager
   * Use HAVING COUNT(managerId) >= 5 to filter for managers with at least 5 direct reports
   * This subquery returns a list of manager IDs that meet our criteria
2. Find manager names:
   * Query the Employee table for names
   * Use WHERE id IN (...) to match employee IDs with the manager IDs from the subquery
   * This returns the names of managers who have at least 5 direct reports

**Complexity**  
* Time complexity: O(n), where n is the number of employees in the table.
* Space complexity: O(m), where m is the number of managers in the table.

**Comparison with Alternative Approach**

An alternative approach using JOIN:
```sql
SELECT e1.name 
FROM Employee e1
JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY e1.id HAVING COUNT(e1.id) >= 5
```

Both solutions are correct, but the subquery approach is generally more efficient because:
1. It processes a smaller intermediate result set
2. It clearly separates the two logical steps: finding qualifying manager IDs, then retrieving their names
3. It can be more memory-efficient, especially with large datasets

The JOIN approach creates a potentially large intermediate joined table before filtering, while the subquery approach first identifies the relevant manager IDs (typically a small set) and then retrieves only the necessary information.