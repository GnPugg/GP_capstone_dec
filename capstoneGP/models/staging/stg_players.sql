WITH flattened_squad AS (
    SELECT
        id as team_id,
        squad.value:dateOfBirth::date AS player_date_of_birth,
        squad.value:id::integer AS player_id,
        squad.value:name::string AS player_name,
        squad.value:nationality::string AS player_nationality,
        squad.value:position::string AS player_position
    FROM {{ source('serieaA_data', 'serieA') }},
         LATERAL FLATTEN(input => squad) AS squad
)
SELECT * FROM flattened_squad


