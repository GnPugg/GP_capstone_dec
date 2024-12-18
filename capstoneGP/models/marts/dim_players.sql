
SELECT
    player_id,  
    player_name,  
    player_date_of_birth,
    player_nationality,  
    player_position
    
FROM {{ ref('stg_players') }}  

-- Example filter using the player_date_of_birth column
WHERE {{ test_player_age('player_date_of_birth') }}