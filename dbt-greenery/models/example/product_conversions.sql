{{
  config(
    materialized='table'
  )
}}

with source_data as (
    select
        product.product_id,
        product.name,
        product.price,
        product.quantity,
        sum(case when events.event_type='add_to_cart' then 1 end) as order_ctr,
        count(distinct events.session_id) as session_ctr
    FROM  {{ ref('dim_events') }} events
      JOIN {{ ref('stg_products') }} product
            ON product.product_id = events.page_id  -- limit to sessions of customers who buy things
    GROUP BY 
        product.product_id,
        product.name,
        product.price,
        product.quantity

)
select * from source_data
