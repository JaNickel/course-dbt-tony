{{
  config(
    materialized='table'
  )
}}
--- NB: Multi users per session ignore users for this excersize
with session_ctrs as  
(
    SELECT 
        session_id,
        min(created_at) beg_created_at,
        max(created_at) end_created_at,
        to_char(max(created_at), 'YYYYmmDD') as sess_dt,
        max(created_at)-min(created_at) duration,
        count(case when event_type='page_view' then 1 end) page_views,
        count(case when event_type='add_to_cart' then 1 end) adds_to_cart,
        count(case when event_type='delete_to_cart' then 1 end) deletes_from_cart,
        count(case when event_type='checkout' then 1 end) checkouts
    FROM {{ ref('stg_events') }}
    group by session_id
)

  select  
    session_id, 
    beg_created_at,
    end_created_at,
    sess_dt,
    page_views, 
    adds_to_cart, 
    checkouts , 
    deletes_from_cart,
    (page_views + adds_to_cart + checkouts) as total_events,
    (adds_to_cart + checkouts) engagement_counts
  from session_ctrs 