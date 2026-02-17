{{
  config(
    materialized = 'incremental',
    on_schema_change='fail' 
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
SELECT   {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_comments']) }}
    AS review_id -- utils 사용해서 review_id 유니크키값 생성 가능. 대박이군...
    , *
FROM src_reviews
WHERE review_comments is not null

-- 이게 대박임... incremental인 경우만 아래 SQL 조건을 추가하도록 하는 거임
-- this 부분은 현재 이 테이블
{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}