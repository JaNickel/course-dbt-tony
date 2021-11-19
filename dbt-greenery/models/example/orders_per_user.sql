
/*
    count the number of orders for each user
*/

{{ config(materialized='table') }}

with source_data as (

    select count(order_id) as order_count, 
           user_id
    from {{ source('tutorial','orders') }}
    group by user_id

)
select *
from source_data
