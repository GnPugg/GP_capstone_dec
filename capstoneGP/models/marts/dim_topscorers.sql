{{ config(materialized='incremental') }}

WITH source AS (
    SELECT
        team_name,         
        team_id,            
        player_name,        
        player_position,    
        lastUpdated,        
        matches_played,
        goals
    FROM {{ ref('stg_topscorers') }}  -- Reference the stg_topscorer model
    
    {% if is_incremental() %}
        -- Only extract records where the lastUpdated date is greater than the max date in dim_topscorer
        WHERE lastUpdated > (SELECT MAX(lastUpdated) FROM {{ this }})
    {% endif %}
)

SELECT * 
FROM source

