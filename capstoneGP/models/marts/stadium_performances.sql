SELECT
    f.venue,
    f.venue_capacity,
    COUNT(CASE WHEN f.match_result = 'home_team_wins' THEN 1 END) AS home_wins,
    COUNT(*) AS total_matches,
    ROUND(
        (COUNT(CASE WHEN f.match_result = 'home_team_wins' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS home_win_percentage
FROM
    {{ ref('fact_match_results') }} f
GROUP BY
    f.venue,
    f.venue_capacity
ORDER BY
    f.venue_capacity DESC
