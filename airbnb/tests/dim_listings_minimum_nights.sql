-- Singular test : tests 경로 하위에 개별 SQL 파일로 작성

-- 만일 테스트가 실패할 경우 출력할 결과값. 뭐가 1보다 작은지 보여주는 쿼리 작성
-- dbt test -s dim_listings_minimum_nights << 특정 test 파일만 실행하는 명령어

SELECT * FROM {{ ref('dim_listings_cleansed') }}
WHERE minimum_nights < 1
LIMIT 10