# LeetCode Problem: 595. Big Countries

## Problem Description

Table: `World`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | int     |
+-------------+---------+
```

name is the primary key column for this table.
Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.

A country is big if:

- it has an area of at least 3,000,000 square km, or
- it has a population of at least 25,000,000.

Write a SQL query to report the name, population, and area of the big countries.

Return the result table in any order.

**Example:**

```
Input:
World table:
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+

Output:
+-------------+------------+---------+
| name        | population | area    |
+-------------+------------+---------+
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
+-------------+------------+---------+
```

## Solution

```sql
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
```

## Explanation

This problem asks us to find countries that are considered "big" based on two criteria:

- Countries with an area of at least 3 million square km, OR
- Countries with a population of at least 25 million people

Our solution is straightforward:

1. We select the required columns: `name`, `population`, and `area` from the `World` table
2. We use the `WHERE` clause with an `OR` operator to filter for countries that meet either of the two conditions:
   - `area >= 3000000`: Countries with an area of at least 3 million square km
   - `population >= 25000000`: Countries with a population of at least 25 million

The `OR` operator ensures that countries meeting either condition (or both) will be included in the results.

## Time Complexity

- O(n) where n is the number of rows in the World table.

## Space Complexity

- O(m) where m is the number of countries that meet either of the criteria (in the worst case, this could be all countries).

## Key Learning Points

1. Using the `OR` operator to combine multiple filter conditions
2. Selecting specific columns from a table
