{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id,
    name,
    price,
    quantity,
    price * quantity as product_value
FROM {{ ref('stg_products') }}
