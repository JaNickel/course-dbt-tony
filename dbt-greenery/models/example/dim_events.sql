{{
  config(
    materialized='table'
  )
}}
 
SELECT 
    event_id,
    session_id,
    user_id,
    page_url,
    reverse(left(reverse(page_url), position('/' in reverse(page_url))-1)) as page_id,
    created_at,
    event_type
FROM {{ ref('stg_events') }}