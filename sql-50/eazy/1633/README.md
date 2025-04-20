# 1633. Percentage of Users Attended a Contest

**Intuition**  
This problem asks us to calculate the percentage of total users who registered for each contest. The key insight is that we need to count unique user registrations for each contest and divide by the total number of users in the system. The result should be sorted by percentage in descending order, with contest_id as a tiebreaker.

**Code**

```sql
SELECT 
    contest_id,
    ROUND(
        COUNT(DISTINCT user_id)*100 / (SELECT COUNT(*) FROM Users)
    , 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
```

**Approach**

1. Group data by contest_id:
   - Start with the Register table, which contains all registration records
   - GROUP BY contest_id to organize registrations by contest

2. Calculate participation percentage:
   - Use COUNT(DISTINCT user_id) to count unique users registered for each contest
   - Multiply by 100 to convert to a percentage
   - Divide by the total number of users, obtained with a subquery: (SELECT COUNT(*) FROM Users)
   - Apply ROUND to format the result to 2 decimal places

3. Sort the results:
   - Use ORDER BY percentage DESC to list contests with higher participation first
   - Add contest_id as a secondary sort key to handle ties consistently

**Complexity**

- Time complexity: O(n + m), where n is the number of registrations and m is the number of users. We need to scan the entire Register table and count the number of users.
- Space complexity: O(c), where c is the number of contests, as we need to store the result for each contest.
