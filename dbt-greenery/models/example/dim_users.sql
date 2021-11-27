{{
  config(
    materialized='table'
  )
}}

SELECT 
    user_id,
    first_name,
    last_name,
    first_name||' '||last_name as user_name,
    email,
    phone_number,
    created_at,
    updated_at,
    address_id
FROM {{ ref('stg_users') }}