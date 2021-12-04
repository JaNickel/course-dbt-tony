{% test in_pct_range(model, column_name) %}


   select *
   from {{ model }}
   where {{ (column_name) }} > 100

{% endtest %}


