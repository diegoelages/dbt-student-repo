with raw_reviews as (select * from {{ source('airbnb', 'reviews') }})
select 
    LISTING_ID as listings_id,
	DATE as review_date,
	REVIEWER_NAME as reviewer_name,
	COMMENTS as review_text,
    SENTIMENT as review_sentiment
from raw_reviews