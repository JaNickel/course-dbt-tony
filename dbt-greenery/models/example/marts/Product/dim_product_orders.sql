{{
  config(
    materialized='table'
  )
}}
with source_data as (
SELECT 
    orders.order_id,
    orders.user_id,
    orders.status,
    items.product_id,
    items.quantity as item_quantity,
    products.name,
    products.price,
    products.quantity as product_quantity
FROM {{ ref('stg_orders') }} orders
    JOIN {{ ref('stg_order_items') }} items
  ON orders.order_id = items.order_id
    JOIN {{ ref('stg_products') }} products
        ON items.product_id = products.product_id
)
select * from source_data