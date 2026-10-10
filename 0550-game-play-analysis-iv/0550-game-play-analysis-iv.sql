SELECT ROUND(
    COUNT(DISTINCT Activity.player_id) / (
        SELECT COUNT(DISTINCT player_id) 
        FROM Activity
    ),
    2
) AS fraction
FROM Activity
JOIN (
    SELECT player_id, MIN(event_date) AS first_event
    FROM Activity
    GROUP BY player_id
) AS first_login
ON first_login.player_id = Activity.player_id
WHERE Activity.event_date = DATE_ADD(first_login.first_event, INTERVAL 1 DAY);