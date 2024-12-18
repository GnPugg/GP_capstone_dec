SELECT
    team_id AS team_id,
    team_name AS team_name,
    year_founded AS year_founded,
    stadium_name AS venue,
    team_address AS team_address

FROM {{ source('serieaA_teams_data', 'serie_a_teams') }}

