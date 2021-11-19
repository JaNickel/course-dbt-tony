{% snapshot order_items_snapshot %}

  {{
    config(
      target_schema='snapshots',
      strategy='check',
      unique_key='order_id',
      check_cols=['product_id', 'quantity'],
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'order_items') }}

{% endsnapshot %}