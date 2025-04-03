# 1934. 확인율

**접근 방식**  
이 문제는 각 사용자의 확인율을 계산하는 것입니다. 확인율은 '확인됨(confirmed)' 메시지 수를 해당 사용자에게 보낸 총 확인 메시지 수로 나눈 값으로 정의됩니다. 사용자에게 확인 메시지가 없는 경우 확인율은 0이 되어야 합니다. 이를 해결하기 위해 Signups 테이블과 Confirmations 테이블을 조인한 다음, 각 사용자에 대해 확인된 메시지의 비율을 계산해야 합니다.

**코드**

```sql
SELECT
    s.user_id,
    ROUND(
        IFNULL(
            AVG(
                CASE
                    WHEN c.action = 'confirmed' THEN 1
                    ELSE 0
                END
            ), 0
        ), 2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id
```

**구현 방법**

1. Signups와 Confirmations 테이블 간의 LEFT JOIN 활용:

   - Signups 테이블로 시작하여 모든 사용자를 가져옵니다
   - Confirmations 테이블과 LEFT JOIN을 수행하여 확인 메시지가 없는 사용자도 포함합니다
   - 조인 조건 `s.user_id = c.user_id`는 각 사용자를 자신의 확인 기록과 연결합니다

2. CASE 표현식과 AVG를 사용하여 확인율 계산:

   - CASE 표현식은 'confirmed' 작업에는 1을, 다른 작업에는 0을 할당합니다
   - AVG는 '확인됨' 메시지의 비율을 계산합니다(COUNT/COUNT보다 효율적)
   - IFNULL은 사용자에게 확인 메시지가 없는 경우를 처리하고 그 비율을 0으로 설정합니다
   - ROUND는 결과를 소수점 이하 2자리로 형식화합니다

3. user_id로 결과를 그룹화하여 각 사용자의 확인율을 얻습니다

**복잡도 분석**

- 시간 복잡도: O(n), 여기서 n은 Confirmations 테이블의 행 수입니다. 쿼리는 모든 확인 기록을 스캔해야 합니다.
- 공간 복잡도: O(m), 여기서 m은 Signups 테이블의 고유 사용자 수입니다. 각 사용자의 결과를 저장해야 하기 때문입니다.

**대안적 접근법**

COUNT와 SUM을 사용한 방법:

```sql
SELECT
    s.user_id,
    ROUND(
        IFNULL(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) /
            COUNT(c.action),
            0
        ), 2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id
```

이 접근법은 확인된 작업의 수를 총 작업 수로 나누어 직접적으로 비율을 계산합니다. 하지만 일반적으로 비율을 계산할 때는 AVG를 사용하는 것이 더 효율적입니다.
