# LeetCode Problem: 1148. Article Views I

## Problem Description

Table: `Views`

```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
```

There is no primary key for this table, it may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.

Write a SQL query to find all the authors that viewed at least one of their own articles.

Return the result table sorted by `id` in ascending order.

**Example:**

```
Input: 
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+

Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+
```

## Solution

```sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
```

## Explanation

This problem asks us to find all authors who have viewed at least one of their own articles. We need to:
1. Find records where the author and viewer are the same person
2. Return the distinct author IDs
3. Order the results by ID in ascending order

Our solution breaks down as follows:

1. `SELECT DISTINCT author_id AS id`: We select the author_id column and rename it to 'id' as required by the problem. The DISTINCT keyword ensures we only get each author once, even if they viewed their own articles multiple times.

2. `FROM Views`: We're querying the Views table.

3. `WHERE author_id = viewer_id`: This is the key condition that identifies when an author has viewed their own article. When author_id equals viewer_id, it means the same person who wrote the article also viewed it.

4. `ORDER BY id`: Finally, we sort the results by the author's ID in ascending order as required.

### Why We Need DISTINCT

Notice in the example data that author 4 viewed their own article twice on the same date. Without the DISTINCT keyword, this author would appear twice in our results. Using DISTINCT ensures each author appears only once in our output, regardless of how many times they viewed their own articles.

### Alternative Approaches

Another way to solve this problem would be to use GROUP BY instead of DISTINCT:

```sql
SELECT author_id AS id
FROM Views
WHERE author_id = viewer_id
GROUP BY author_id
ORDER BY id;
```

This approach would also eliminate duplicates, but DISTINCT is more straightforward and commonly used for simple deduplication tasks.

## Time Complexity

- O(n log n) where n is the number of rows in the Views table. This includes the sorting operation.

## Space Complexity

- O(m) where m is the number of distinct authors who viewed their own articles.

## Key Learning Points

1. Using the DISTINCT keyword to eliminate duplicates
2. Applying equality conditions in the WHERE clause
3. Renaming columns with the AS keyword
4. Ordering results with ORDER BY