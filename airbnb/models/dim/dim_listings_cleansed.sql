{{
    config(
        materialized='view',
    )
}}
with src_listings as (
    select * from {{ ref('src_listings') }}
)
select
    listings_id,
    listings_name,
    room_type,
    case 
        when minimum_nights = 0 then 1 
        else minimum_nights 
    end as minimum_nights,
    host_id,
    replace(price_str, '$', '')::number(10, 2) as price,
    price_str,
    created_at,
    updated_at
from src_listings