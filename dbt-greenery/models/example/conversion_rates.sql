{{
  config(
    materialized='table'
  )
}}

with source_data as (

select sum(case when events.event_type='page_view' then 1 end) as page_views
--,
--       sum(case when events.event_type='checkout' then 1 end) as checkouts,
--       count(distinct events.session_id) as sessions,
--       count(distinct orders.order_id) as order_count
      
FROM {{ ref('stg_events') }} events
--,
--     {{ ref('stg_orders') }} orders

)
select * 
--select page_views, 
--       checkouts, 
--       sessions,
--       order_count,
--       (checkouts*1.0)/(page_views*1.0) as view_conversions,
--       (order_count*1.0)/(sessions*1.0) as sesion_conversions
from source_data
