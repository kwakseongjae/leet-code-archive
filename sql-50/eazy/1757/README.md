# 1757. Recyclable and Low Fat Products

**Intuition**  
This problem asks us to find products that are both low fat and recyclable. We need to filter the Products table based on two conditions: `low_fats = 'Y'` and `recyclable = 'Y'`. This is a simple filtering operation that can be done with a WHERE clause and logical AND operator.

**Code**  
```sql
SELECT product_id 
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

**Approach**  
1. Use the WHERE clause to filter rows:
   * Check for products where `low_fats = 'Y'` AND `recyclable = 'Y'`
2. Select only the product_id column:
   * Since the problem requires us to return only the product_id, we select it explicitly.

**Complexity**  
* Time complexity: O(n), where n is the number of rows in the Products table.
* Space complexity: O(m), where m is the number of products that satisfy both conditions.