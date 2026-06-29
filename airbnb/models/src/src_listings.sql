with raw_listings as (select * from {{ source('airbnb', 'listings') }})
select 
    id as listings_id,
    name as listings_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price as price_str,
    created_at,
    updated_at,
from raw_listings
