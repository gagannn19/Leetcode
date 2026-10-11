SELECT id
FROM Weather
JOIN (
    SELECT recordDate AS previousDate, temperature AS previousTemperature
    FROM Weather
) AS previous
ON DATE_SUB(Weather.recordDate, INTERVAL 1 DAY) = previous.previousDate
AND Weather.temperature > previousTemperature