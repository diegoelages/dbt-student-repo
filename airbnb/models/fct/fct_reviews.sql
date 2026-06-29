{{
    config(
        materialized='incremental',
        on_schema_change='fail',
        event_time='review_date'
    )
}}
with src_reviews as (
    select * from {{ ref('src_reviews') }}
)
select 
    {{dbt_utils.generate_surrogate_key(['listings_id','review_date','reviewer_name','review_text'])}} as review_id,
       * 
  from src_reviews
where review_text is not null
{% if is_incremental() %}
    {% if var('start_date',False) and var('end_date', False) %}
        AND review_date >= '{{ var("start_date") }}'
        AND review_date <= '{{ var("end_date") }}'
        {{ log('Loading ' ~ this ~ 'incrementally (start_date: ' ~ var('start_date') ~ ', end_date: ' ~ var('end_date'),info=True) }}
    {% else %}
        AND review_date > (SELECT max(review_date) FROM {{ this }})
        {{ log('Loading ' ~ this ~ 'incrementally (all missing dates)', info=True) }}
    {% endif %}
{% endif %}