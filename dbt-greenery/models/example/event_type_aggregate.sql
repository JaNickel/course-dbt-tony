{{
  config(
    materialized='table'
  )
}}

SELECT 
     event_type,
    count(1)
FROM  {{ ref('stg_events') }}
group by event_type
