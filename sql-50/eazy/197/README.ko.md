# 197. 상승 온도

**접근 방식**  
이 문제는 전날보다 온도가 높은 날을 찾아야 합니다. 각 날짜의 온도를 이전 날짜와 비교해야 하므로, Weather 테이블에 자체 조인(self-join)을 사용하여 각 기록을 이전 날의 기록과 연결하는 것이 적합합니다. 이 문제의 핵심은 연속된 날짜를 올바르게 식별하고 온도를 비교하는 것입니다.

**코드**

```sql
SELECT w2.id
FROM Weather w1
JOIN Weather w2 ON DATEDIFF(w2.recordDate, w1.recordDate) = 1
WHERE w2.temperature > w1.temperature
```

**구현 방법**

1. 자체 조인을 활용하여 각 날씨 기록을 다른 기록과 연결:
   - Weather 테이블을 자신과 조인(w1과 w2로)
   - DATEDIFF 함수를 사용하여 w2의 날짜가 w1의 날짜보다 정확히 하루 뒤인지 확인
2. 온도 상승을 찾기 위한 필터 적용:
   - WHERE 절을 추가하여 w2의 온도가 w1의 온도보다 높은지 확인
3. 더 따뜻한 날의 ID만 선택:
   - 온도가 높은 날을 나타내는 w2에서 id를 반환

**복잡도 분석**

- 시간 복잡도: O(n²), n은 Weather 테이블의 기록 수입니다. 각 기록을 잠재적으로 모든 다른 기록과 비교하기 때문입니다.
- 공간 복잡도: O(m), m은 이전 날보다 온도가 높았던 날의 수입니다.

**유용한 SQL 날짜 함수들**

DATEDIFF 외에도 유사한 문제에 도움이 될 수 있는 여러 날짜 함수가 있습니다:

1. **DATE_ADD/DATE_SUB**: 날짜에 지정된 시간 간격을 더하거나 뺍니다

   ```sql
   -- DATE_ADD를 사용한 대안적 접근법
   SELECT w2.id
   FROM Weather w1
   JOIN Weather w2 ON w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL 1 DAY)
   WHERE w2.temperature > w1.temperature
   ```

2. **DATE_FORMAT**: 지정된 형식에 따라 날짜를 서식화합니다

   ```sql
   -- 예시: 월과 연도 추출
   SELECT DATE_FORMAT(recordDate, '%Y-%m') as month_year
   FROM Weather
   ```

3. **EXTRACT**: 날짜에서 부분(연도, 월, 일 등)을 추출합니다

   ```sql
   -- 예시: L으로 그룹화
   SELECT EXTRACT(MONTH FROM recordDate) as month, AVG(temperature)
   FROM Weather
   GROUP BY month
   ```

4. **TIMESTAMPDIFF**: 지정된 단위로 두 날짜 간의 차이를 계산합니다

   ```sql
   -- 시간 단위로 차이 계산
   SELECT TIMESTAMPDIFF(HOUR, start_date, end_date) as hours_difference
   FROM some_table
   ```

5. **LAST_DAY**: 주어진 날짜의 해당 월의 마지막 날을 반환합니다
   ```sql
   -- 각 월의 마지막 날 구하기
   SELECT recordDate, LAST_DAY(recordDate) as month_end
   FROM Weather
   ```
