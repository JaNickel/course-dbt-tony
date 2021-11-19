{% snapshot orders_snapshot %}

  {{
    config(
      target_schema='snapshots',
      strategy='timestamp',
      unique_key='order_id',
      updated_at='delivered_at'
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'orders') }}

{% endsnapshot %}