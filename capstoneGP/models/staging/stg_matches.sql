WITH match_data AS (
    SELECT 
        value:id::STRING AS match_id,
        value:area:name::STRING AS country_name,
        value:homeTeam:name::STRING AS home_team,
        value:awayTeam:name::STRING AS away_team,
        value:score:fullTime:home::NUMBER AS home_score,
        value:score:fullTime:away::NUMBER AS away_score,
        value:matchday::NUMBER AS matchday,
        value:utcDate::TIMESTAMP AS match_date
    FROM 
        {{ source('matches_data', 'matches') }},
        LATERAL FLATTEN(input => matches)
)
SELECT * FROM match_data
