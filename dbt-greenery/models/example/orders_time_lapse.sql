/*
    count the number of orders and divide by number of hours
*/

{{ config(materialized='table') }}

with source_data as (

    select 
        count(order_id) as order_count, 
        max(created_at) as max_created_at,  
        min(created_at) as min_created_at,
        max(created_at) - min(created_at) as time_lapse
    from {{ source('tutorial','orders') }}
)
select *
from source_data