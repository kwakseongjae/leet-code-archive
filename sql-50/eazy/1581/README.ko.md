# 1581. 방문만 하고 거래하지 않은 고객

**접근 방식**  
이 문제는 매장을 방문했지만 어떠한 거래도 하지 않은 고객과 각 고객별 그런 방문 횟수를 찾아야 합니다. 해결하기 위해서는 Transactions 테이블에 해당 항목이 없는 방문을 식별한 다음, 각 고객별로 이러한 방문 횟수를 계산해야 합니다.

**코드**

```sql
SELECT customer_id, COUNT(visit_id) as count_no_trans
FROM Visits v
WHERE NOT EXISTS (
    SELECT visit_id FROM Transactions t
    WHERE t.visit_id = v.visit_id
)
GROUP BY customer_id
```

**구현 방법**

1. 상관 서브쿼리와 함께 NOT EXISTS 연산자 활용:
   - Visits 테이블의 각 행에 대해 일치하는 거래가 있는지 확인
   - 상관 서브쿼리 `SELECT visit_id FROM Transactions t WHERE t.visit_id = v.visit_id`는 동일한 visit_id를 가진 거래 기록을 찾음
   - 방문에 대한 일치하는 거래가 없을 때 NOT EXISTS는 true를 반환
2. 각 고객별로 해당하는 방문 횟수 계산:
   - 필터링된 방문을 customer_id로 그룹화
   - COUNT(visit_id)를 사용하여 각 고객별 거래 없는 방문 횟수 계산

**복잡도 분석**

- 시간 복잡도: O(n × m), n은 Visits 테이블의 행 수, m은 Transactions 테이블의 행 수입니다.
- 공간 복잡도: O(k), k는 거래 없이 방문만 한 고객 수입니다.

**대안적 접근법**

1. LEFT JOIN 사용:

```sql
SELECT customer_id, COUNT(v.visit_id) as count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
```

2. NOT IN 사용:

```sql
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits as v
WHERE v.visit_id NOT IN (
    SELECT DISTINCT visit_id
    FROM Transactions
)
GROUP BY customer_id
```

각 접근법은 저마다 장점이 있지만, 이러한 유형의 쿼리에서는 일반적으로 NOT EXISTS가 가장 우수한 성능을 제공합니다.
