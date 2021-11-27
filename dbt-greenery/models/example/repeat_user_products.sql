/*
    list the products and orders_per_user
*/

{{ config(materialized='table') }}

with source_data as (

select dbt_tony_nickel.orders_per_user.order_count, dbt_tony_nickel.stg_products.name, count(1) as ctr 
from dbt_tony_nickel.orders_per_user, 
     dbt_tony_nickel.stg_products, 
     dbt_tony_nickel.stg_orders, 
     dbt_tony_nickel.stg_order_items 
where dbt_tony_nickel.orders_per_user.user_id=dbt_tony_nickel.stg_orders.user_id 
  and dbt_tony_nickel.stg_orders.order_id=dbt_tony_nickel.stg_order_items.order_id 
  and dbt_tony_nickel.stg_order_items.product_id=dbt_tony_nickel.stg_products.product_id 
group by orders_per_user.order_count, dbt_tony_nickel.stg_products.name

)
select *
from source_data
