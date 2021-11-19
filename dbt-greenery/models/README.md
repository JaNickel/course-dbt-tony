Week 1
1. How many users do we have?
    --130
    select count(distinct user_id) from dbt_tony_nickel.stg_users;

2. On average, how many orders do we receive per hour?
    -- 8.5
    using orders_time_lapse: 
    select order_count / (extract(hour from time_lapse) + (extract(day from time_lapse)*24)) as orders_per_hour from dbt_tony_nickel.orders_time_lapse;

3. On average, how long does an order take from being placed to being delivered? 
    -- 3 days 22:13:10.504451
    select avg( delivered_at-created_at)  from dbt_tony_nickel.stg_orders; 

4. How many users have only made one purchase? Two purchases? Three+ purchases?
    Using orders_per_user:
    select count(distinct user_id) from dbt_tony_nickel.orders_per_user where order_count=1;  -- 25
    select count(distinct user_id) from dbt_tony_nickel.orders_per_user where order_count=2;  -- 22
    select count(distinct user_id) from dbt_tony_nickel.orders_per_user where order_count>=3; -- 81

5. On average, how many unique sessions do we have per hour?  
    -- 0.11395659775789366 (1108 sessons in 405 days 3 hours)
    using sessions_time_lapse:
    select session_count / (extract(hour from time_lapse) + (extract(day from time_lapse)*24)) as sessions_per_hour from dbt_tony_nickel.sessions_time_lapse;

Self Review
1.Were you able to create schema.yml files with model names and descriptions?
Yes

2.Were you able to run your dbt models and snapshots against the data warehouse? 
Yes

3.Could you run the queries to answer key questions from the project instructions? 
Yes

4.What was most challenging/surprising in completing this week’s project?
Getting used to the version of vs code.

5.Is there anywhere you are still stuck or confused? Or Is there a particular part of the project where you want focused feedback from your reviewers?
No