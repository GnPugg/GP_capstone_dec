WITH flattened_competitions AS (
    SELECT
        competition.value:id::integer AS competition_id,  -- Column alias in lowercase
        competition.value:name::string AS competition_name,
        competition.value:type::string AS competition_type
    FROM {{ source('serieaA_data', 'serieA') }},
         LATERAL FLATTEN(input => runningcompetitions) AS competition
)
SELECT DISTINCT 
    competition_id,  -- Use the correct alias in lowercase
    competition_name, 
    competition_type 
FROM flattened_competitions
