{% macro get_page_part(page_url) %}

   reverse(
      (left(reverse(page_url), position('/' in reverse(page_url))-1))
   )
{% endmacro %}