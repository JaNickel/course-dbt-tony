{% snapshot promos_snapshot %}

  {{
    config(
      target_schema='snapshots',
      strategy='check',
      unique_key='promo_id',
      check_cols=['discount', 'status'],
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'promos') }}

{% endsnapshot %}