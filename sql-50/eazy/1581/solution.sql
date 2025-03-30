/*
 * Author: Seong Jae, Kwak
 * Problem: 1581. Customer Who Visited but Did Not Make Any Transactions
 * Problem Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
 */

-- Solution using NOT EXISTS
SELECT customer_id, COUNT(visit_id) as count_no_trans 
FROM Visits v
WHERE NOT EXISTS (
    SELECT visit_id FROM Transactions t 
    WHERE t.visit_id = v.visit_id
)
GROUP BY customer_id;

-- Alternative solution using LEFT JOIN
/*
SELECT customer_id, COUNT(v.visit_id) as count_no_trans 
FROM Visits v 
LEFT JOIN Transactions t 
ON v.visit_id = t.visit_id 
WHERE transaction_id IS NULL 
GROUP BY customer_id;
*/

-- Alternative solution using NOT IN
/*
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits as v
WHERE v.visit_id NOT IN (
    SELECT DISTINCT visit_id
    FROM Transactions
)
GROUP BY customer_id;
*/