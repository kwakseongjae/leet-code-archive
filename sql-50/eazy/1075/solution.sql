/* 
 * Author: Seong Jae, Kwak
 * Problem: 1075. Project Employees I
 * Problem Link: https://leetcode.com/problems/project-employees-i/
 */

SELECT 
    project_id,
    ROUND(AVG(IFNULL(e.experience_years, 0)), 2) AS average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY project_id;