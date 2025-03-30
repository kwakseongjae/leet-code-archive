# 1378. 직원 ID를 고유 식별자로 대체하기

**접근 방식**  
이 문제는 각 직원의 고유 식별자와 이름을 함께 조회하는 것입니다. 이 문제의 핵심은 데이터가 두 테이블에 분산되어 있다는 점입니다. `Employees` 테이블에는 이름이 있고, `EmployeeUNI` 테이블에는 고유 식별자가 있습니다. 일부 직원들은 아직 고유 식별자가 할당되지 않았을 수 있으므로, 고유 ID가 없는 직원도 포함하여 모든 직원이 결과에 포함되도록 해야 합니다.

**코드**  
```sql
SELECT eu.unique_id, e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS eu
ON e.id = eu.id
```

**구현 방법**  
1. LEFT JOIN 연산 활용:
   * `Employees` 테이블을 기준 테이블로 사용하여 모든 직원이 결과에 포함되도록 합니다
   * `EmployeeUNI` 테이블과 LEFT JOIN을 수행하여 매칭되는 고유 ID를 가져옵니다
   * 조인 조건 `e.id = eu.id`는 직원 ID를 기준으로 레코드를 연결합니다
2. 필요한 열 선택:
   * `eu.unique_id`는 고유 식별자를 제공합니다 (매칭 레코드가 없는 직원의 경우 NULL)
   * `e.name`은 기준 테이블에서 직원 이름을 가져옵니다

**복잡도 분석**  
* 시간 복잡도: O(n + m), n은 Employees 테이블의 행 수, m은 EmployeeUNI 테이블의 행 수입니다.
* 공간 복잡도: O(n), Employees 테이블의 모든 직원을 반환해야 하기 때문입니다.