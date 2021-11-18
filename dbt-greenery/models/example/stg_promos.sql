{{
  config(
    materialized='table'
  )
}}

SELECT 
    promo_id,
    discout,
    status
FROM {{ source('tutorial', 'promos') }}