-- models/staging/stg_team_competitions.sql
WITH team_competitions AS (
    SELECT
        team.id AS team_id,
        competition.value:id::integer AS competition_id
    FROM {{ source('serieaA_data', 'serieA') }} team,
         LATERAL FLATTEN(input => team.runningcompetitions) AS competition
)
SELECT DISTINCT
    team_id,
    competition_id
FROM team_competitions
