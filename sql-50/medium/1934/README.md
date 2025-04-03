# 1934. Confirmation Rate

**Intuition**  
This problem asks us to calculate the confirmation rate for each user. The confirmation rate is defined as the number of 'confirmed' messages divided by the total number of confirmation messages sent to that user. If a user has no confirmation messages, their confirmation rate should be 0. We need to join the Signups table with the Confirmations table, then calculate the proportion of confirmed messages for each user.

**Code**

```sql
SELECT
    s.user_id,
    ROUND(
        IFNULL(
            AVG(
                CASE
                    WHEN c.action = 'confirmed' THEN 1
                    ELSE 0
                END
            ), 0
        ), 2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id
```

**Approach**

1. Use a LEFT JOIN between the Signups and Confirmations tables:

   - Start with the Signups table to get all users
   - LEFT JOIN with Confirmations to include all users, even those without confirmation messages
   - The join condition `s.user_id = c.user_id` connects each user with their confirmation records

2. Calculate the confirmation rate using CASE expression and AVG:

   - The CASE expression assigns 1 for 'confirmed' actions and 0 for other actions
   - AVG calculates the proportion of 'confirmed' messages (more efficient than COUNT/COUNT)
   - IFNULL handles cases where a user has no confirmation messages, setting their rate to 0
   - ROUND formats the result to 2 decimal places

3. Group the results by user_id to get the rate for each user

**Complexity**

- Time complexity: O(n), where n is the number of rows in the Confirmations table. The query needs to scan through all confirmation records.
- Space complexity: O(m), where m is the number of unique users in the Signups table, as we need to store the result for each user.

**Alternative Approaches**

Using COUNT and SUM:

```sql
SELECT
    s.user_id,
    ROUND(
        IFNULL(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) /
            COUNT(c.action),
            0
        ), 2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id
```

This approach directly calculates the ratio by dividing the count of confirmed actions by the total count of actions. However, using AVG is generally more efficient for calculating proportions.
