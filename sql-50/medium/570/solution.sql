/*
 * Author: Seong Jae, Kwak
 * Problem: 570. Managers with at Least 5 Direct Reports
 * Problem Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
 */

-- Recommended solution using subquery
SELECT name 
FROM Employee 
WHERE id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(managerId) >= 5
);

-- Alternative solution using JOIN
/*
SELECT e1.name 
FROM Employee e1
JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY e1.id 
HAVING COUNT(e1.id) >= 5;
*/