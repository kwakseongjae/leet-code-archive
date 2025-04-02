# 570. 최소 5명의 직속 부하를 가진 관리자

**접근 방식**  
이 문제는 최소 5명 이상의 직속 부하를 가진 관리자를 찾아야 합니다. Employee 테이블에서 각 직원은 ID와 잠재적인 관리자 ID(다른 직원의 ID)를 가지고 있습니다. 각 관리자에게 보고하는 직원 수를 계산하고 최소 5명의 직속 부하를 가진 관리자의 이름을 반환해야 합니다.

**코드**

```sql
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
);
```

**구현 방법**

1. 최소 5명의 직속 부하를 가진 관리자 식별:
   - 서브쿼리를 사용하여 Employee 테이블 분석
   - managerId로 GROUP BY하여 같은 관리자 아래 모든 직원 그룹화
   - HAVING COUNT(managerId) >= 5를 사용하여 최소 5명의 직속 부하를 가진 관리자 필터링
   - 이 서브쿼리는 조건을 충족하는 관리자 ID 목록을 반환
2. 관리자 이름 찾기:
   - Employee 테이블에서 이름 조회
   - WHERE id IN (...)을 사용하여 직원 ID와 서브쿼리의 관리자 ID 매칭
   - 이는 최소 5명의 직속 부하를 가진 관리자의 이름을 반환

**복잡도 분석**

- 시간 복잡도: O(n), n은 테이블의 직원 수입니다.
- 공간 복잡도: O(m), m은 테이블의 관리자 수입니다.

**대안적 접근법과의 비교**

JOIN을 사용한 대안적 접근법:

```sql
SELECT e1.name
FROM Employee e1
JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY e1.id HAVING COUNT(e1.id) >= 5
```

두 해결책 모두 가능하지만, 서브쿼리 접근법이 일반적으로 더 효율적입니다:

1. 더 작은 중간 결과 집합을 처리합니다
2. 두 가지 논리적 단계를 명확히 분리합니다: 조건을 충족하는 관리자 ID 찾기, 그 다음 이름 검색
3. 특히 대용량 데이터셋에서 메모리 효율성이 더 높을 수 있습니다

JOIN 접근법은 필터링 전에 잠재적으로 큰 중간 조인 테이블을 생성하는 반면, 서브쿼리 접근법은 먼저 관련 관리자 ID(일반적으로 작은 집합)를 식별한 다음 필요한 정보만 검색합니다.
