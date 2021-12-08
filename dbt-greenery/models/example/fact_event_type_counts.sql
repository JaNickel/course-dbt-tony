{{
  config(
    materialized='table'
  )
}}

with session_ctrs as  
(
    SELECT 
        session_id,
        count(case when event_type='page_view' then 1 end) pgs,
        count(case when event_type='add_to_cart' then 1 end) crts,
        count(case when event_type='checkout' then 1 end) chks
    FROM {{ ref('stg_events') }}
    group by session_id
)

select * from session_ctrs