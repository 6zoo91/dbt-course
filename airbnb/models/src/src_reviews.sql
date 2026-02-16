-- view 생성
WITH raw_reviews AS (
    SELECT * FROM {{ source('airbnb', 'reviews') }}
)
SELECT
          LISTING_ID
        , DATE AS review_date
        , REVIEWER_NAME
        , COMMENTS AS review_comments
        , SENTIMENT AS review_sentiment
FROM      raw_reviews