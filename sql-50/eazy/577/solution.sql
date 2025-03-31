/*
 * Author: Seong Jae, Kwak
 * Problem: 577. Employee Bonus
 * Problem Link: https://leetcode.com/problems/employee-bonus/
 */

-- Improved solution with explicit table aliases
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;