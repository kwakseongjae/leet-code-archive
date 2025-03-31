# 1280. 학생과 시험

**접근 방식**  
이 문제는 각 학생이 각 시험에 참석한 횟수를 보고해야 합니다. 일부 과목에 대해 학생이 시험에 참석하지 않았더라도 모든 학생과 과목 조합을 보여주어야 합니다. 이는 Students와 Subjects 테이블 간에 CROSS JOIN을 사용하여 모든 가능한 조합을 생성한 다음, Examinations 테이블에서 시험 참석 횟수를 계산하는 방식을 제안합니다.

**코드**

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

**구현 방법**

1. 모든 학생-과목 조합 생성:
   - Students와 Subjects 테이블 간의 CROSS JOIN을 사용하여 모든 가능한 쌍을 생성
   - 이렇게 하면 학생이 특정 과목의 시험을 치르지 않았더라도 조합이 포함됨
2. 시험 기록과 연결:
   - Examinations 테이블과 LEFT JOIN하여 일치하는 시험 기록 찾기
   - 조인 조건은 student_id와 subject_name 모두에 연결
   - LEFT JOIN은 시험 기록이 없는 학생-과목 쌍도 보존
3. 시험 참석 횟수 계산:
   - student_id, student_name, subject_name으로 GROUP BY하여 시험 기록 집계
   - COUNT(e.subject_name)을 사용하여 참석한 시험 횟수 계산
   - 시험에 참석하지 않은 경우 COUNT는 0을 반환
4. 결과 정렬:
   - 요구사항대로 student_id와 subject_name으로 ORDER BY

**복잡도 분석**

- 시간 복잡도: O(n×m + e), n은 학생 수, m은 과목 수, e는 시험 기록 수입니다.
- 공간 복잡도: O(n×m), 결과에 모든 학생-과목 조합을 저장하기 위함입니다.
