SELECT
    m.match_id,
    t.venue,
    s.venue_capacity,
    m.matchday,
    m.home_team,
    m.away_team,
    m.match_result,
    m.home_score,
    m.away_score
FROM
    {{ ref('dim_matches') }} m
JOIN
    {{ ref('dim_teams') }} t
    ON m.home_team = t.team_name  
JOIN
    {{ ref('dim_stadiums') }} s
    ON t.venue = s.venue     

