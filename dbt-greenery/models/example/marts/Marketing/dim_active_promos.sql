{{
  config(
    materialized='table'
  )
}}

SELECT 
    promo_id,
    discout as discount,
    status
FROM {{ ref('stg_promos') }}
WHERE status = 'active'