# 1068. Product Sales Analysis I

**Intuition**  
This problem requires retrieving specific information about product sales by combining data from two tables. We need the product name from the Product table and the year and price from the Sales table. Since both tables share a common field (product_id), we can use a join operation to connect the related records and extract the required information.

**Code**

```sql
SELECT p.product_name, s.year, s.price
FROM Sales s
INNER JOIN Product p
ON s.product_id = p.product_id
```

**Approach**

1. Use an INNER JOIN to combine the Sales and Product tables:
   - The join condition `s.product_id = p.product_id` links related records
   - This ensures we only get results where a product exists in both tables
2. Apply table aliases for clarity:
   - `s` for the Sales table
   - `p` for the Product table
3. Select the required columns:
   - `p.product_name` from the Product table
   - `s.year` and `s.price` from the Sales table

**Complexity**

- Time complexity: O(n + m), where n is the number of rows in the Sales table and m is the number of rows in the Product table.
- Space complexity: O(n), as we potentially return all sales records with their corresponding product information.
