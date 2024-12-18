{% macro test_player_age(date_of_birth_column) %}
    -- Calculate the age of the player and check if it is greater than 15
    TIMESTAMPDIFF(YEAR, {{ date_of_birth_column }}, CURRENT_DATE) > 15
{% endmacro %}
