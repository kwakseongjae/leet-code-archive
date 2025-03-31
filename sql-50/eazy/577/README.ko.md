# 577. 직원 보너스

**접근 방식**  
이 문제는 보너스가 1000 미만이거나 보너스가 전혀 없는 직원들을 찾아야 합니다. 보너스 기록이 없는 직원도 포함해야 하므로, Employee 테이블과 Bonus 테이블을 연결하기 위해 LEFT JOIN을 사용해야 합니다. 그런 다음 보너스가 1000 미만이거나 NULL인 직원만 포함하도록 결과를 필터링할 수 있습니다.

**코드**

```sql
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL
```

**구현 방법**

1. LEFT JOIN을 사용하여 직원과 보너스를 연결:
   - LEFT JOIN은 보너스가 없는 직원도 포함하여 모든 직원이 결과에 포함되도록 보장
   - 조인 조건 `e.empId = b.empId`로 각 직원을 해당 보너스 기록(있는 경우)과 연결
2. 필터링 조건 적용:
   - `b.bonus < 1000`은 낮은 보너스를 받는 직원 포함
   - `b.bonus IS NULL`은 보너스가 전혀 없는 직원 포함
   - 이 두 조건을 OR로 결합하여 두 그룹 모두 결과에 포함되도록 함
3. 필요한 열 선택:
   - Employee 테이블에서 `e.name`
   - Bonus 테이블에서 `b.bonus`(보너스가 없는 직원의 경우 NULL)

**복잡도 분석**

- 시간 복잡도: O(n + m), n은 직원 수, m은 보너스 기록 수
- 공간 복잡도: O(p), p는 보너스가 1000 미만이거나 보너스가 없는 직원 수
