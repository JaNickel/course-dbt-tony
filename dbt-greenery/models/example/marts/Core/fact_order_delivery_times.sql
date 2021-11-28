{{
  config(
    materialized='table'
  )
}}

with source_data as (
SELECT 
    orders.order_id,
    orders.promo_id,
    orders.user_id,
    orders.address_id,
    orders.created_at,
    orders.order_cost,
    orders.shipping_cost,
    orders.order_total,
    orders.tracking_id,
    orders.shipping_service,
    orders.estimated_delivery_at,
    orders.delivered_at,
    orders.status,    
    coalesce(promos.discount, 0) as discount,
    coalesce(promos.discount, 0) / 100.0 as discount_pct,
    orders.order_total - (orders.order_cost * (coalesce(promos.discount, 0) / 100.0)) as discounted_cost
FROM {{ ref('stg_orders') }} orders
LEFT JOIN {{ ref('dim_active_promos') }} promos
  ON orders.promo_id = promos.promo_id
)
select * from source_data