{{
  config(
    materialized='table'
  )
}}

with source_data as (
    select
        product.user_id,
        product.product_id,
        product.name,
        product.price,
        product.quantity,
        product.order_id,
        events.session_id,
        events.page_url,
        events.event_type
    FROM {{ ref('products_ordered') }} product
        JOIN {{ ref('stg_events') }} events
            ON product.user_id = events.user_id  -- limit to sessions of customers who buy things
)
select * from source_data

