{{
  config(
    materialized='table'
  )
}}

with source_data as 
(
    select  
        count(1) as session_ctr, 
        sum(case when checkouts>0 then 1 else 0 end) as checkout_ctr,
        sum(case when adds_to_cart>0 then 1 else 0 end) as cart_add_ctr,
--        sum(case when (adds_to_cart-deletes_from_cart)>0 then 1 else 0 end) as net_add_evt_ctr,
        sum(case when deletes_from_cart>0 then 1 else 0 end) deletes_ctr
    from {{ ref('session_events') }} 
)

select  session_ctr, 
        checkout_ctr, 
        cart_add_ctr, 
--        net_add_evt_ctr, 
--        deletes_ctr,
        (cart_add_ctr*1.0)/session_ctr as add_to_cart_rate, 
--        (net_add_evt_ctr*1.0)/session_ctr as net_add_to_cart_rate,
        (checkout_ctr*1.0)/session_ctr as conversion_rate
from source_data 
