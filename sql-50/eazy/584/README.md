# LeetCode Problem: 584. Find Customer Referee

## Problem Description

Table: `Customer`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
```

In this table, id is the primary key column for the table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.

Write a SQL query to report the names of the customer who are not referred by the customer with id = 2.

Return the result table in any order.

**Example:**

```
Input:
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

Output:
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
```

## Solution

```sql
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
```

## Explanation

This problem asks us to find all customers who are not referred by the customer with id = 2. There are two cases we need to handle:

1. Customers who are referred by someone other than customer id = 2
2. Customers who are not referred by anyone (i.e., their referee_id is NULL)

The solution uses a simple WHERE clause with two conditions combined with an OR operator:

- `referee_id <> 2`: This selects customers whose referee_id is not equal to 2
- `referee_id IS NULL`: This selects customers whose referee_id is NULL

It's important to note that in SQL, NULL values require special handling. They cannot be compared using standard comparison operators like `=`, `<>`, `>`, `<`. Instead, we must use `IS NULL` or `IS NOT NULL` to check for NULL values.

### Alternative Approaches

We could also use the IFNULL or COALESCE function to handle NULL values:

```sql
SELECT name
FROM Customer
WHERE IFNULL(referee_id, 0) <> 2;
```

This approach replaces NULL values with 0 (or any other value different from 2) before making the comparison. However, the original solution is more readable and follows SQL best practices for handling NULL values.

## Time Complexity

- O(n) where n is the number of rows in the Customer table.

## Space Complexity

- O(m) where m is the number of customers who are not referred by customer id = 2.

## Key Learning Points

1. Proper handling of NULL values in SQL queries
2. Using logical operators (OR) to combine multiple conditions
3. Understanding how comparison operators work with NULL values in SQL
