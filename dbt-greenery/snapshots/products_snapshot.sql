{% snapshot products_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='product_id',

      strategy='check',
      unique_key='id',
      check_cols=['name', 'price', 'quantity'],
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'products') }}

{% endsnapshot %}