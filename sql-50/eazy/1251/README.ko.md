# 1251. 평균 판매 가격

**접근 방식**  
이 문제는 각 제품의 평균 판매 가격을 계산하는 것입니다. 평균 판매 가격은 가격과 판매된 단위 수를 곱한 값의 합계를 판매된 총 단위 수로 나눈 것으로 정의됩니다. 우리는 각 제품의 서로 다른, 특정 날짜 범위 동안의 가격을 고려해야 하며, 해당 날짜 범위 내에서 발생한 판매만 포함해야 합니다.

**코드**

```sql
SELECT
    p.product_id,
    IFNULL(
        ROUND(
            SUM(p.price * u.units) / SUM(u.units)
        , 2)
    , 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
```

**구현 방법**

1. Prices 테이블을 시작점으로 하여 UnitsSold와 LEFT JOIN:

   - 모든 제품이 결과에 포함되도록 Prices 테이블을 기준 테이블로 사용
   - JOIN 조건은 제품을 매칭하고 구매 날짜가 유효한 가격 기간 내에 있는지 확인
   - `purchase_date BETWEEN start_date AND end_date`를 사용하여 날짜 범위 내의 데이터를 효율적으로 필터링

2. 가중 평균 가격 계산:

   - 각 매칭 레코드에 대해 가격과 판매된 단위 수를 곱함: `price * units`
   - 각 제품에 대해 이 값들의 합계 계산: `SUM(price * units)`
   - 판매된 총 단위 수로 나눔: `SUM(units)`
   - 이 공식은 각 가격이 판매된 단위 수에 따라 가중치가 부여된 가중 평균을 제공

3. 형식 지정 및 예외 상황 처리:

   - ROUND를 사용하여 결과를 소수점 이하 2자리로 제한
   - IFNULL을 사용하여 판매가 없는 제품의 경우 0으로 기본값 설정

4. product_id로 결과를 그룹화하여 제품당 하나의 행을 얻음

**복잡도 분석**

- 시간 복잡도: O(n + m), 여기서 n은 Prices 테이블의 행 수이고 m은 UnitsSold 테이블의 행 수입니다. JOIN 작업은 두 테이블을 모두 검사해야 합니다.
- 공간 복잡도: O(p), 여기서 p는 고유한 제품 ID의 수입니다. 각 제품에 대한 결과를 저장해야 하기 때문입니다.
