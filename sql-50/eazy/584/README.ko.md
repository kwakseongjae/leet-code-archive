# LeetCode 문제: 584. 고객의 추천인 찾기

## 문제 설명

테이블: `Customer`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
```

이 테이블에서 id는 테이블의 기본 키 열입니다.
각 행은 고객의 id, 이름, 그리고 그들을 추천한 고객의 id를 나타냅니다.

id = 2인 고객에 의해 추천되지 않은 고객의 이름을 반환하는 SQL 쿼리를 작성하세요.

결과 테이블은 임의의 순서로 반환할 수 있습니다.

**예시:**

```
입력:
Customer 테이블:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

출력:
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
```

## 풀이

```sql
SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
```

## 설명

이 문제는 OR 연산자를 사용하여 두 가지 조건을 결합한 간단한 WHERE 절로 해결할 수 있습니다:

1. id = 2가 아닌 다른 고객에 의해 추천된 고객들

- `referee_id <> 2`: referee_id가 2가 아닌 고객을 선택합니다

2. 누구에게도 추천받지 않은 고객들 (즉, referee_id가 NULL인 경우)

- `referee_id IS NULL`: referee_id가 NULL인 고객을 선택합니다

SQL에서 NULL 값은 특별한 처리가 필요합니다. NULL 값은 `=`, `<>`, `>`, `<`와 같은 표준 비교 연산자로 비교할 수 없습니다. 대신 NULL 값을 확인하기 위해 `IS NULL` 또는 `IS NOT NULL`을 사용해야 합니다.

### 대안적 접근법

NULL 값을 처리하기 위해 IFNULL 또는 COALESCE 함수를 사용할 수도 있습니다:

```sql
SELECT name
FROM Customer
WHERE IFNULL(referee_id, 0) <> 2;
```

## 시간 복잡도

- O(n): n은 Customer 테이블의 행 수입니다.

## 공간 복잡도

- O(m): m은 고객 id = 2에 의해 추천되지 않은 고객의 수입니다.

## 주요 학습 포인트

1. SQL 쿼리에서 NULL 값의 적절한 처리
2. 여러 조건을 결합하기 위한 논리 연산자(OR) 사용
3. SQL에서 NULL 값과 비교 연산자의 작동 방식 이해
