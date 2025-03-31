# 1280. Students and Examinations

**Intuition**  
This problem requires us to report the number of times each student attended each exam. We need to show all student and subject combinations, even if a student didn't attend any exams for some subjects. This suggests using a CROSS JOIN between Students and Subjects to generate all possible combinations, and then counting the exam attendances from the Examinations table.

**Code**

```sql
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name
```

**Approach**

1. Create all student-subject combinations:
   - Use a CROSS JOIN between Students and Subjects tables to generate all possible pairs
   - This ensures we include combinations even when a student hasn't taken a particular subject's exam
2. Connect with exam records:
   - LEFT JOIN with the Examinations table to find matching exam records
   - The join condition connects on both student_id and subject_name
   - The LEFT JOIN preserves all student-subject pairs, even without matching exam records
3. Count exam attendances:
   - GROUP BY student_id, student_name, and subject_name to aggregate exam records
   - Use COUNT(e.subject_name) to count the number of exams attended
   - When no exams were attended, COUNT returns 0
4. Sort the results:
   - ORDER BY student_id and subject_name as required

**Complexity**

- Time complexity: O(n×m + e), where n is the number of students, m is the number of subjects, and e is the number of examination records.
- Space complexity: O(n×m), for storing all student-subject combinations in the result.
