# 620. Not Boring Movies

**Intuition**  
This problem asks us to find movies that have an odd-numbered ID and aren't classified as "boring," then sort them by their rating in descending order. The key insights here are identifying odd-numbered IDs using the modulo operator and filtering out movies with a "boring" description.

**Code**

```sql
SELECT *
FROM Cinema
WHERE MOD(id, 2) = 1 AND description <> "boring"
ORDER BY rating DESC
```

**Approach**

1. Identify films with odd-numbered IDs:

   - Use the MOD function (or the % operator in some SQL dialects) to find IDs where MOD(id, 2) = 1
   - This checks if the remainder when dividing the ID by 2 is 1, which is true for all odd numbers

2. Filter out boring movies:

   - Add the condition description <> "boring" to exclude movies with "boring" in their description
   - The <> operator is SQL's not-equal comparison

3. Sort the results:
   - Use ORDER BY rating DESC to arrange the movies in order of decreasing rating
   - This ensures that the highest-rated movies appear first in the results

**Complexity**

- Time complexity: O(n log n), where n is the number of rows in the Cinema table. The filter operation is O(n), but the sorting operation requires O(n log n) time.
- Space complexity: O(k), where k is the number of movies that meet our criteria (odd ID and not boring).
