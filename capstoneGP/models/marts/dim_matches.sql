{{ config(materialized='incremental') }}

WITH source AS (
    SELECT 
        match_id,
        home_score,
        away_score,
        matchday,
        match_date,
        home_team,
        away_team,
        CASE 
            WHEN home_score > away_score THEN 'home_team_wins'
            WHEN home_score < away_score THEN 'away_team_wins'
            ELSE 'Draw'
        END AS match_result
    FROM {{ ref('stg_matches') }}  -- Using ref to reference the stg_matches model
    
    {% if is_incremental() %}
        -- Only get matches with a match_date greater than the max match_date in dim_matches
        WHERE match_date > (SELECT MAX(match_date) FROM {{ this }})
    {% endif %}
)

SELECT * 
FROM source
