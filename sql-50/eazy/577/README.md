# 577. Employee Bonus

**Intuition**  
This problem asks us to find employees who either have a bonus less than 1000 or no bonus at all. Since we need to include employees who don't have a bonus record, we need to use a LEFT JOIN to connect the Employee table with the Bonus table. Then we can filter the results to include only those with a bonus less than 1000 or NULL.

**Code**

```sql
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL
```

**Approach**

1. Use a LEFT JOIN to connect employees with their bonuses:
   - The LEFT JOIN ensures all employees are included in the result, even those without a bonus
   - The join condition `e.empId = b.empId` links each employee to their corresponding bonus record (if any)
2. Apply filtering conditions:
   - `b.bonus < 1000` captures employees with a low bonus
   - `b.bonus IS NULL` captures employees with no bonus at all
   - Combining these with OR ensures both groups are included in the result
3. Select the required columns:
   - `e.name` from the Employee table
   - `b.bonus` from the Bonus table (will be NULL for employees without a bonus)

**Complexity**

- Time complexity: O(n + m), where n is the number of employees and m is the number of bonus records.
- Space complexity: O(p), where p is the number of employees who either have a bonus less than 1000 or no bonus.
