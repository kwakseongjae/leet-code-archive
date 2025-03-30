# 584. 고객 추천인 찾기

**접근 방식**  
이 문제는 ID가 2인 고객에 의해 추천되지 않은 모든 고객을 찾는 것입니다. 여기에는 다른 고객에 의해 추천된 고객과 누구에게도 추천받지 않은(NULL 값) 고객이 포함됩니다. SQL에서 NULL 값은 일반적인 비교 연산자로 비교할 수 없으므로 특별한 처리가 필요합니다.

**코드**  
```sql
SELECT name 
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
```

**구현 방법**  
1. OR 조건을 사용한 WHERE 절:
   * `referee_id <> 2`인 행 포함 (2가 아닌 경우)
   * `referee_id IS NULL`인 행 포함 (추천인이 없는 경우)
2. name 열만 선택:
   * 문제에서 요구하는 대로 고객 이름만 반환

**복잡도 분석**  
* 시간 복잡도: O(n), n은 Customer 테이블의 행 수
* 공간 복잡도: O(m), m은 ID가 2인 고객에 의해 추천되지 않은 고객 수