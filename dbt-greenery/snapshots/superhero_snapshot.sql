{% snapshot superheroes_snapshot %}

  {{
    config(
      target_schema='snapshots',
      strategy='timestamp',
      unique_key='id',
      updated_at='updated_at'
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'superheroes') }}

{% endsnapshot %}
