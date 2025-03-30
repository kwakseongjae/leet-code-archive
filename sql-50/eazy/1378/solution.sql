/*
 * Author: Seong Jae, Kwak
 * Problem: 1378. Replace Employee ID With The Unique Identifier
 * Problem Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
 */

SELECT eu.unique_id, e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS eu
ON e.id = eu.id;