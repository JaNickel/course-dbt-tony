
/*
    count the number of users with more than one order / total users
*/
 
{{ config(materialized='table') }}

with source_data as (

select
sum(case when order_count > 1 then 1 end) as repeat_users,
sum(case when order_count = 1 then 1 end) as single_order_users,
sum(1) as total_users,
sum(case when order_count > 1 then 1.0 end)/sum(1.0) repeat_rate
from {{ ref('orders_per_user') }} orders_per_user
group by user_id
)
select repeat_users, single_order_users, total_users
from source_data