# 1661. 기계별 프로세스 평균 시간

**접근 방식**  
이 문제는 각 기계별 평균 처리 시간을 계산하는 것이 목표입니다. 여기서 처리 시간은 각 프로세스의 '시작'과 '종료' 활동 사이의 시간 차이로 정의됩니다. '시작'과 '종료' 활동이 Activity 테이블에 별도의 행으로 저장되어 있기 때문에, 이 행들을 조인하여 시간 차이를 계산한 다음 각 기계별로 이러한 차이의 평균을 구해야 합니다.

**코드**  
```sql
SELECT 
    start_activity.machine_id,
    ROUND(AVG(end_activity.timestamp - start_activity.timestamp), 3) AS processing_time
FROM Activity start_activity
JOIN Activity end_activity
ON 
    start_activity.machine_id = end_activity.machine_id
    AND start_activity.process_id = end_activity.process_id
    AND start_activity.activity_type = 'start'
    AND end_activity.activity_type = 'end'
GROUP BY start_activity.machine_id
```

**구현 방법**  
1. 자체 조인을 활용하여 시작과 종료 활동 쌍을 형성:
   * Activity 테이블을 자신과 조인하고 별칭을 `start_activity`와 `end_activity`로 지정
   * machine_id와 process_id가 일치하는 레코드 연결
   * 첫 번째 테이블에서는 'start' 활동, 두 번째 테이블에서는 'end' 활동만 필터링
2. 각 프로세스의 시간 차이 계산:
   * 종료 타임스탬프에서 시작 타임스탬프를 빼서 처리 시간 산출
3. 기계별 평균 처리 시간 계산:
   * machine_id로 그룹화
   * AVG 함수를 사용하여 평균 시간 차이 계산
   * ROUND 함수로 결과를 소수점 3자리까지 반올림

**복잡도 분석**  
* 시간 복잡도: O(n log n), n은 Activity 테이블의 레코드 수입니다. 자체 조인 연산이 포함되어 있기 때문입니다.
* 공간 복잡도: O(m), m은 고유한 기계의 수입니다.