{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id,
    name,
    price,
    quantity as inventory_count,
    price * quantity as product_value
FROM {{ ref('stg_products') }}
