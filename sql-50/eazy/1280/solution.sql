/*
 * Author: Seong Jae, Kwak
 * Problem: 1280. Students and Examinations
 * Problem Link: https://leetcode.com/problems/students-and-examinations/
 */

-- Solution with LEFT JOIN and GROUP BY
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

-- Alternative solution with correlated subquery
/*
SELECT 
    student_id,
    student_name,
    subject_name,
    (
        SELECT COUNT(student_id)
        FROM Examinations e
        WHERE stu.student_id = e.student_id
            AND sub.subject_name = e.subject_name
    ) AS attended_exams
FROM Students stu
CROSS JOIN Subjects sub
ORDER BY student_id, subject_name;
*/