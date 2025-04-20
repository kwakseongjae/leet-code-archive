/* 
 * Author: Seong Jae, Kwak
 * Problem: 1633. Percentage of Users Attended a Contest
 * Problem Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
 */

SELECT 
    contest_id,
    ROUND(
        COUNT(DISTINCT user_id)*100 / (SELECT COUNT(*) FROM Users)
    , 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;