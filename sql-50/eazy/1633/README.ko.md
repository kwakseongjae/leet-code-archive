# 1633. 대회에 참가한 사용자 비율

**접근 방식**  
이 문제는 각 대회에 등록한 총 사용자의 비율을 계산하는 것입니다. 핵심은 각 대회별로 고유한 사용자 등록 수를 계산하고 이를 시스템의 총 사용자 수로 나누는 것입니다. 결과는 비율을 기준으로 내림차순으로 정렬되며, 동률인 경우 contest_id를 추가 기준으로 사용합니다.

**코드**  
```sql
SELECT 
    contest_id,
    ROUND(
        COUNT(DISTINCT user_id)*100 / (SELECT COUNT(*) FROM Users)
    , 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
```

**구현 방법**  
1. contest_id로 데이터 그룹화:
   * 모든 등록 기록이 포함된 Register 테이블로 시작
   * GROUP BY contest_id를 사용하여 대회별로 등록 정보를 구성

2. 참가 비율 계산:
   * COUNT(DISTINCT user_id)를 사용하여 각 대회에 등록한 고유 사용자 수 계산
   * 100을 곱하여 백분율로 변환
   * 서브쿼리로 얻은 총 사용자 수로 나눔: (SELECT COUNT(*) FROM Users)
   * ROUND를 적용하여 결과를 소수점 이하 2자리로 형식화

3. 결과 정렬:
   * ORDER BY percentage DESC를 사용하여 참여율이 높은 대회를 먼저 나열
   * 동률을 일관되게 처리하기 위해 contest_id를 보조 정렬 키로 추가

**복잡도 분석**  
* 시간 복잡도: O(n + m), 여기서 n은 등록 수이고 m은 사용자 수입니다. Register 테이블 전체를 스캔하고 사용자 수를 계산해야 합니다.
* 공간 복잡도: O(c), 여기서 c는 대회 수입니다. 각 대회의 결과를 저장해야 하기 때문입니다.
