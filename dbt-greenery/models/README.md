Week 1
How many users do we have?
    select count(distinct user_id) from dbt_tony_nickel.stg_users;  --130

On average, how many orders do we receive per hour?

On average, how long does an order take from being placed to being delivered?

How many users have only made one purchase? Two purchases? Three+ purchases?
    Using:
    {{ config(materialized='table') }}
    with source_data as (
        select count(order_id) as order_count, 
               user_id
        from {{ source('tutorial','orders') }}
        group by user_id
    )
    select *
    from source_data

    select count(1) from dbt_tony_nickel.orders_per_user where order_count=1;
    select count(1) from dbt_tony_nickel.orders_per_user where order_count=2;
    select count(1) from dbt_tony_nickel.orders_per_user where order_count>2;

On average, how many unique sessions do we have per hour?  --- number of unique sessions / (days*24)
