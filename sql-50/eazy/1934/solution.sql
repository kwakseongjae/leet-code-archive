/* 
 * Author: Seong Jae, Kwak
 * Problem: 1934. Confirmation Rate
 * Problem Link: https://leetcode.com/problems/confirmation-rate/
 */

-- Solution with AVG and CASE statement
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
GROUP BY s.user_id;

-- Alternative solution with COUNT and SUM
/*
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
GROUP BY s.user_id;
*/