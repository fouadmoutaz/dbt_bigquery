{% macro dynamic_partition(order_date, interval) %}
    CASE 
        WHEN DATE({{ order_date }}) >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 {{ interval }}) THEN 'recent'
        ELSE 'historical'
    END AS partition_group
{% endmacro %}