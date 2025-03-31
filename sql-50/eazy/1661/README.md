# 1661. Average Time of Process per Machine

**Intuition**  
This problem asks us to calculate the average processing time for each machine, where the processing time is defined as the time difference between the 'start' and 'end' activities of each process. Since the 'start' and 'end' activities are stored as separate rows in the Activity table, we need to join these rows together to calculate the time difference, and then average these differences for each machine.

**Code**

```sql
SELECT
    start_activity.machine_id,
    ROUND(AVG(end_activity.timestamp - start_activity.timestamp), 3) AS processing_time
FROM Activity start_activity
JOIN Activity end_activity
ON
    start_activity.machine_id = end_activity.machine_id
    AND start_activity.process_id = end_activity.process_id
    AND start_activity.activity_type = 'start'
    AND end_activity.activity_type = 'end'
GROUP BY start_activity.machine_id
```

**Approach**

1. Use a self-join to pair start and end activities:
   - Join the Activity table with itself, creating aliases `start_activity` and `end_activity`
   - Join on matching machine_id and process_id
   - Filter to match only 'start' activities from the first table with 'end' activities from the second
2. Calculate the time difference for each process:
   - Subtract the start timestamp from the end timestamp to get the processing time
3. Calculate the average processing time per machine:
   - Group by machine_id
   - Use AVG to compute the average time difference
   - Round the result to 3 decimal places using ROUND function

**Complexity**

- Time complexity: O(n log n), where n is the number of records in the Activity table, due to the self-join operation.
- Space complexity: O(m), where m is the number of distinct machines.
