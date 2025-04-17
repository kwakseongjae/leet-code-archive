# 1251. Average Selling Price

**Intuition**  
This problem asks us to calculate the average selling price for each product. The average selling price is defined as the sum of prices multiplied by units sold divided by the total number of units sold. We need to consider the price of each product during different date ranges and only include sales that occurred within those date ranges.

**Code**

```sql
SELECT 
    p.product_id,
    IFNULL(
        ROUND(
            SUM(p.price * u.units) / SUM(u.units)
        , 2)
    , 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
```

**Approach**

1. Start with the Prices table and LEFT JOIN with UnitsSold:
   - We use the Prices table as our base to ensure all products are included in the result
   - The JOIN condition matches products and ensures the purchase date falls within the valid price period
   - Using `purchase_date BETWEEN start_date AND end_date` efficiently filters dates within a range

2. Calculate the weighted average price:
   - For each matching record, multiply the price by the number of units sold: `price * units`
   - Sum these values for each product: `SUM(price * units)`
   - Divide by the total number of units sold: `SUM(units)`
   - This formula gives us the weighted average where each price is weighted by the number of units sold

3. Handle formatting and edge cases:
   - Use ROUND to limit the result to 2 decimal places
   - Use IFNULL to handle products with no sales by defaulting to 0

4. Group the results by product_id to get one row per product

**Complexity**

- Time complexity: O(n + m), where n is the number of rows in the Prices table and m is the number of rows in the UnitsSold table. The JOIN operation requires examining both tables.
- Space complexity: O(p), where p is the number of unique product IDs, as we need to store the result for each product.
