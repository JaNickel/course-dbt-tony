/*
    list the products and orders_per_user
*/

{{ config(materialized='table') }}

with source_data as (

select orders_per_user.order_count, 
      products.name, 
      count(1) as ctr 
FROM {{ ref('orders_per_user') }} orders_per_user
JOIN {{ ref('stg_orders') }} orders
  ON orders_per_user.user_id = orders.user_id 
JOIN {{ ref('stg_order_items') }} items
  ON orders.order_id =items.order_id
JOIN {{ ref('stg_products') }} products
  ON items.product_id = products.product_id
group by orders_per_user.order_count, products.name

)
select *
from source_data
