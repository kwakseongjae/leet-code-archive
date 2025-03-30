# 1757. 재활용 가능하며 저지방인 제품

**접근 방식**  
이 문제는 저지방이면서 동시에 재활용 가능한 제품을 찾아내는 것입니다. 두 가지 조건을 모두 만족하는 제품을 필터링하기 위해 `low_fats = 'Y'`와 `recyclable = 'Y'` 조건을 사용하면 됩니다. 간단한 WHERE 절과 논리 연산자 AND를 활용하여 쉽게 해결할 수 있습니다.

**코드**  
```sql
SELECT product_id 
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

**구현 방법**  
1. WHERE 절을 사용한 행 필터링:
   * `low_fats = 'Y'`이면서 동시에 `recyclable = 'Y'`인 제품만 선택
2. product_id 열만 선택:
   * 문제에서 요구하는 대로 product_id만 반환

**복잡도 분석**  
* 시간 복잡도: O(n), n은 Products 테이블의 행 수
* 공간 복잡도: O(m), m은 두 조건을 모두 만족하는 제품의 수