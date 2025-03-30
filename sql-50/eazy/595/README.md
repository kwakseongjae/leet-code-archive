# 595. Big Countries

**Intuition**  
This problem asks us to find "big countries" based on two criteria: either having an area of at least 3 million square km OR having a population of at least 25 million. Since a country needs to satisfy only one of these conditions to be considered "big", we can use the OR operator in our WHERE clause.

**Code**  
```sql
SELECT name, population, area 
FROM World
WHERE area >= 3000000 OR population >= 25000000;
```

**Approach**  
1. Select the required columns from the World table:
   * `name`, `population`, and `area` as specified in the problem
2. Apply the filtering conditions with OR:
   * Include countries where `area >= 3000000` (area at least 3 million)
   * Include countries where `population >= 25000000` (population at least 25 million)

**Complexity**  
* Time complexity: O(n), where n is the number of rows in the World table.
* Space complexity: O(m), where m is the number of countries that satisfy at least one condition.