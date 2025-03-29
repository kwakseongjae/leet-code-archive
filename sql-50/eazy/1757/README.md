# LeetCode Problem: 1757. Recyclable and Low Fat Products

## Problem Description

Write a SQL query to find the IDs of products that are both low fat and recyclable.

A product is low fat if `low_fats` is 'Y'.<br>
A product is recyclable if `recyclable` is 'Y'.

**Example:**

```
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+

Result:
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+
```

## Solution

```sql
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

### Explanation:

1. We directly use the `SELECT` statement to retrieve the `product_id` column from the `Products` table.
2. The `WHERE` clause filters the results to include only products that meet both criteria:
   - `low_fats = 'Y'`: The product is low fat
   - `recyclable = 'Y'`: The product is recyclable
3. The `AND` operator ensures that both conditions must be true for a product to be included in the results.

### Time Complexity:

- O(n) where n is the number of rows in the Products table, as we need to scan each row once.

### Space Complexity:

- O(m) where m is the number of products that meet both criteria (in the worst case, this could be all products).

## Key Learning Points:

1. Basic SQL filtering using the `WHERE` clause
2. Using logical operators (`AND`) to combine multiple conditions
3. Simple data retrieval with specific criteria
