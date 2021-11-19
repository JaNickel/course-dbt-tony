{% snapshot orders_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='order_id',

      strategy='timestamp',
      updated_at='delivered_at'
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'orders') }}

{% endsnapshot %}