# 1075. 프로젝트 직원 I

**접근 방식**  
이 문제는 각 프로젝트의 평균 경험 연수를 계산하는 것입니다. Project 테이블과 Employee 테이블을 조인하여 각 직원의 경험 연수를 가져온 다음, 각 프로젝트별로 평균 경험 연수를 계산해야 합니다. 결과는 소수점 이하 2자리로 반올림하며, 경험 데이터가 없는 직원이 있는 프로젝트의 경우 평균은 0이 되어야 합니다.

**코드**

```sql
SELECT
    project_id,
    ROUND(AVG(IFNULL(e.experience_years, 0)), 2) AS average_years
FROM Project p
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY project_id
```

**구현 방법**

1. Project와 Employee 테이블 조인:

   - 모든 프로젝트가 결과에 포함되도록 Project를 기준 테이블로 사용
   - Employee 테이블과 LEFT JOIN을 수행하여 직원 경험 데이터 가져오기
   - 조인 조건 `p.employee_id = e.employee_id`는 각 프로젝트 항목을 해당 직원과 연결

2. 평균 경험 연수 계산:

   - AVG 함수를 사용하여 각 프로젝트의 experience_years 평균 계산
   - IFNULL을 사용하여 NULL 값을 0으로 대체
   - ROUND를 적용하여 결과를 소수점 이하 2자리로 제한

3. project_id로 결과 그룹화:
   - 이렇게 하면 프로젝트당 하나의 행과 해당 평균 경험을 얻을 수 있음

**복잡도 분석**

- 시간 복잡도: O(n), 여기서 n은 Project 테이블의 행 수입니다. 쿼리는 모든 프로젝트 레코드를 스캔하고 조인 작업을 수행해야 합니다.
- 공간 복잡도: O(p), 여기서 p는 고유한 project_id의 수입니다. 각 프로젝트의 결과를 저장해야 하기 때문입니다.
