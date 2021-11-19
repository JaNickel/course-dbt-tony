{% snapshot promos_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='promo_id',

      strategy='check',
      unique_key='id',
      check_cols=['discount', 'status'],
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'promos') }}

{% endsnapshot %}