# 1148. Article Views I

**Intuition**  
The problem requires us to find all authors who have viewed at least one of their own articles. According to the description, an author views their own article when the `author_id` and `viewer_id` columns have the same value. We need to make sure we return each author only once and sort the results in ascending order.

**Code**  
```sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
```

**Approach**  
1. Filter records where an author viewed their own article:
   * Use the condition `author_id = viewer_id` to identify self-views
2. Select distinct author IDs:
   * Use `DISTINCT` to eliminate duplicate entries when an author viewed multiple of their own articles
3. Rename the column and sort:
   * Rename `author_id` to `id` as required
   * Sort the result in ascending order using `ORDER BY id`

**Complexity**  
* Time complexity: O(n log n), where n is the number of rows in the Views table (sorting adds the log n factor).
* Space complexity: O(m), where m is the number of distinct authors who viewed their own articles.