select l.*
  from {{ref('fct_reviews')}} r
  inner join {{ref('dim_listings_cleansed')}} l on l.listings_id = r.listings_id and l.created_at > r.review_date