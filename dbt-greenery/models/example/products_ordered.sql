{{
  config(
    materialized='table'
  )
}}

with source_data as (
    select
        orders.user_id
        ,product.product_id
        ,product.name
        ,product.price
        ,item.quantity
        ,item.order_id
    FROM {{ ref('stg_orders') }} orders
        JOIN {{ ref('stg_order_items') }} item
            ON orders.order_id = item.order_id
        JOIN {{ ref('stg_products') }} product
            ON product.product_id = item.product_id
)
select * from source_data