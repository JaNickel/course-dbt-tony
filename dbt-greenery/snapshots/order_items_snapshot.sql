{% snapshot order_items_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='order_id',

      strategy='check',
      unique_key='id',
      check_cols=['product_id', 'quantity'],
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'order_items') }}

{% endsnapshot %}