-- 모든 review_date가 listings의 created_at보다 최신인지 확인

SELECT * FROM {{ ref('dim_listings_cleansed') }} l
INNER JOIN {{ ref('fct_reviews') }} r
USING (listing_id)
WHERE l.created_at > r.review_date