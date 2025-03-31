# 197. Rising Temperature

**Intuition**  
This problem asks us to find days where the temperature is higher than the previous day. We need to compare each day's temperature with the day before it, which suggests using a self-join on the Weather table to connect each record with its previous day. The challenge lies in correctly identifying consecutive dates and comparing their temperatures.

**Code**

```sql
SELECT w2.id
FROM Weather w1
JOIN Weather w2 ON DATEDIFF(w2.recordDate, w1.recordDate) = 1
WHERE w2.temperature > w1.temperature
```

**Approach**

1. Use a self-join to connect each weather record with others:
   - Join the Weather table with itself (as w1 and w2)
   - Use the DATEDIFF function to ensure w2's date is exactly one day after w1's date
2. Apply a filter to find temperature increases:
   - Add a WHERE clause to check if w2's temperature is higher than w1's temperature
3. Select only the ID of the warmer days:
   - Return the id from w2, which represents the day with the higher temperature

**Complexity**

- Time complexity: O(n²), where n is the number of records in the Weather table, as we're comparing each record with potentially all others.
- Space complexity: O(m), where m is the number of days where the temperature was higher than the previous day.

**Useful Date Functions in SQL**

Beyond DATEDIFF, several other date functions can be helpful for similar problems:

1. **DATE_ADD/DATE_SUB**: Adds or subtracts a specified time interval from a date

   ```sql
   -- Alternative approach using DATE_ADD
   SELECT w2.id
   FROM Weather w1
   JOIN Weather w2 ON w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL 1 DAY)
   WHERE w2.temperature > w1.temperature
   ```

2. **DATE_FORMAT**: Formats a date according to the specified format

   ```sql
   -- Example: Extract month and year
   SELECT DATE_FORMAT(recordDate, '%Y-%m') as month_year
   FROM Weather
   ```

3. **EXTRACT**: Extracts parts of a date (year, month, day, etc.)

   ```sql
   -- Example: Group by month
   SELECT EXTRACT(MONTH FROM recordDate) as month, AVG(temperature)
   FROM Weather
   GROUP BY month
   ```

4. **TIMESTAMPDIFF**: Calculates the difference between two dates in specified units

   ```sql
   -- Calculate difference in hours
   SELECT TIMESTAMPDIFF(HOUR, start_date, end_date) as hours_difference
   FROM some_table
   ```

5. **LAST_DAY**: Returns the last day of the month for a given date
   ```sql
   -- Get the last day of each month
   SELECT recordDate, LAST_DAY(recordDate) as month_end
   FROM Weather
   ```
