SELECT
    team:"name"::STRING AS team_name,
    team:"id"::NUMBER AS team_id,
    player:"name"::STRING AS player_name,
    player:"nationality"::STRING AS player_nationality,
    player:"section"::STRING AS player_position,
    player:"lastUpdated"::TIMESTAMP_TZ as lastUpdated,
    playedmatches AS matches_played,
    goals AS goals,
    penalties AS penalties,
    assists AS assists
FROM {{ source('top_scorer_serieaA_data', 'top_scorer')}}

