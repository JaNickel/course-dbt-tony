
{% macro get_page_part(url_str) %}
   (reverse(left(reverse({{url_str}}), position('/' in reverse({{url_str}}))-1)))
{% endmacro %}
