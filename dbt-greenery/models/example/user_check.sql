{{
  config(
    materialized='table'
  )
}}

with ssns as  
(
    SELECT 
        session_id 
    FROM dbt_tony_nickel.stg_events 
    GROUP BY session_id 
    HAVING count(distinct user_id)>1
),
evts as
(   
    SELECT 
        session_id,
        user_id
    FROM dbt_tony_nickel.stg_events
    GROUP BY session_id, user_id
),
 usrs as 
 (   SELECT
        usr.user_id,
        usr.first_name,
        usr.last_name
    FROM {{ ref('stg_users') }} usr
    GROUP BY 
        usr.user_id,
        usr.first_name,
        usr.last_name
)

    select  
        evts.session_id, 
        usrs.user_id,
        usrs.first_name,
        usrs.last_name
    from usrs, evts, ssns
    where ssns.session_id = evts.session_id
      and evts.user_id=usrs.user_id