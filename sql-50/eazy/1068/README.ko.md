# 1068. 제품 판매 분석 I

**접근 방식**  
이 문제는 두 테이블의 데이터를 결합하여 제품 판매에 관한 특정 정보를 추출해야 합니다. Product 테이블에서는 제품 이름을, Sales 테이블에서는 판매 연도와 가격 정보를 가져와야 합니다. 두 테이블이 공통 필드(product_id)를 공유하고 있으므로, 조인 연산을 활용하여 관련 레코드를 연결하고 필요한 정보를 추출할 수 있습니다.

**코드**

```sql
SELECT p.product_name, s.year, s.price
FROM Sales s
INNER JOIN Product p
ON s.product_id = p.product_id
```

**구현 방법**

1. INNER JOIN을 사용하여 Sales와 Product 테이블 결합:
   - 조인 조건 `s.product_id = p.product_id`로 관련 레코드 연결
   - 이를 통해 두 테이블 모두에 존재하는 제품의 결과만 얻을 수 있음
2. 명확성을 위한 테이블 별칭 적용:
   - Sales 테이블은 `s`로 표기
   - Product 테이블은 `p`로 표기
3. 필요한 열 선택:
   - Product 테이블에서 `p.product_name` 가져오기
   - Sales 테이블에서 `s.year`와 `s.price` 가져오기

**복잡도 분석**

- 시간 복잡도: O(n + m), n은 Sales 테이블의 행 수, m은 Product 테이블의 행 수입니다.
- 공간 복잡도: O(n), 모든 판매 기록과 해당 제품 정보를 반환할 가능성이 있기 때문입니다.
