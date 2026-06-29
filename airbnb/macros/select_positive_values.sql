{% macro select_positive_values(model, column_name) %}
{{ log("MODEL=[" ~ model ~ "]", info=True) }}
{{ log("COLUMN=[" ~ column_name ~ "]", info=True) }}
SELECT *
  FROM {{ model }}
 WHERE {{ column_name }} > 0
{% endmacro %}