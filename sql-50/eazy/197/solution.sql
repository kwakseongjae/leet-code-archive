/*
 * Author: Seong Jae, Kwak
 * Problem: 197. Rising Temperature
 * Problem Link: https://leetcode.com/problems/rising-temperature/
 */

-- Solution using explicit JOIN syntax
SELECT w2.id
FROM Weather w1
JOIN Weather w2 ON DATEDIFF(w2.recordDate, w1.recordDate) = 1
WHERE w2.temperature > w1.temperature;

-- Alternative solution using implicit join syntax
/*
SELECT w2.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w2.recordDate, w1.recordDate) = 1
    AND w2.temperature - w1.temperature > 0;
*/