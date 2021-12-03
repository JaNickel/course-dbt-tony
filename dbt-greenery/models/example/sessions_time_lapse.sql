/*
    count the number of sesson and the time difference start and end
*/
 
{{ config(materialized='table') }}

with source_data as (

    select count(distinct session_id) as session_count, 
           max(created_at) as max_created_at,  
           min(created_at) as min_created_at,
           max(created_at) - min(created_at) as time_lapse
    from {{ source('tutorial','events') }}

)
select *
from source_data