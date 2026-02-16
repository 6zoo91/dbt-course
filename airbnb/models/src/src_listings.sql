-- view 를 생성

WITH raw_listings AS (
    SELECT * FROM {{ source('airbnb', 'listings') }}
)
SELECT    ID AS listing_id
        , name AS listing_name
        , LISTING_URL
        , ROOM_TYPE
        , MINIMUM_NIGHTS
        , HOST_ID
        , PRICE AS price_str
        , CREATED_AT
        , UPDATED_AT
FROM    raw_listings
