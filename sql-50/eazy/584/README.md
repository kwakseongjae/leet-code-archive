# 584. Find Customer Referee

**Intuition**  
The problem requires us to find customers who are not referred by the customer with ID = 2. This includes customers referred by someone else and customers not referred by anyone (NULL values). In SQL, we need to be careful when handling NULL values as they require special comparison operators.

**Code**  
```sql
SELECT name 
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
```

**Approach**  
1. Use the WHERE clause with OR condition:
   * Include rows where `referee_id <> 2` (not equal to 2)
   * Include rows where `referee_id IS NULL` (referee_id is NULL)
2. Select only the name column:
   * As required by the problem statement.

**Complexity**  
* Time complexity: O(n), where n is the number of rows in the Customer table.
* Space complexity: O(m), where m is the number of customers who were not referred by customer ID 2.