/*-- using SQLite Studio
Print the company_name field. Find the number of taxi rides for each taxi company for November 15-16, 2017. Sort results in descending order. */
SELECT
    cabs.company_name AS company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM 
    cabs
    JOIN trips ON cabs.cab_id = trips.cab_id
WHERE
    CAST(trips.start_ts AS DATE) BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY 
    company_name
ORDER BY
    trips_amount DESC;


/*
Find the number of rides for every taxi company whose name contains the words "Yellow" or "Blue" for November 1-7, 2017. Group the results by the company_name */
SELECT
    SUBQ.company_name AS company_name,
    COUNT(trips.trip_id) as trips_amount
FROM
    trips
    INNER JOIN
    (SELECT
        company_name,
         cab_id
     FROM
         cabs
     WHERE
         company_name LIKE '%Yellow%'
     OR company_name LIKE '%Blue%') AS SUBQ
     ON SUBQ.cab_id = trips.cab_id
WHERE
    trips.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY
    company_name;

/*
For November 1-7, 2017, the most popular taxi companies were Flash Cab and Taxi Affiliation Services. Find the number of rides for these two companies and name the resulting variable trips_amount. Join the rides for all other companies in the group "Other." Group the data by taxi company names. Name the field with taxi company names company. Sort the result in descending order by trips_amount. */
SELECT
    (CASE WHEN company_name = 'Flash Cab' OR
    company_name = 'Taxi Affiliation Services' THEN
        company_name
    ELSE
    'Other'
    END) AS company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM
    cabs
    INNER JOIN trips ON trips.cab_id = cabs.cab_id
WHERE
    trips.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY CASE
    WHEN company_name = 'Flash Cab' OR
    company_name = 'Taxi Affiliation Services' THEN
        company_name
    ELSE
    'Other'
    END
ORDER BY
    trips_amount DESC;

/*
Retrieve the identifiers of the O'Hare and Loop neighborhoods  from the neighborhoods table. */
SELECT
    *
FROM
    neighborhoods
WHERE
    name LIKE '%Hare'
    OR name LIKE 'Loop';
    
/*
For each hour, retrieve the weather condition records from the weather_records table. Using the CASE operator, break all hours into two groups: Bad if the description field contains the words rain or storm, and Good for others. Name the resulting field weather_conditions. The final table must include two fields: date and hour (ts) and weather_conditions. */
SELECT
    DATE_TRUNC('hour', ts) AS ts,
    CASE WHEN description LIKE '%rain%'
    OR description LIKE '%storm%' THEN
        'Bad'
    ELSE
        'Good'
    END AS weather_conditions
FROM
    weather_records
GROUP BY
    ts,
    weather_conditions
ORDER BY
    ts;

/*
Retrieve from the trips table all the rides that started in the Loop (pickup_location_id: 50) on a Saturday and ended at O'Hare (dropoff_location_id: 63). Get the weather conditions for each ride. Use the method you applied in the previous task. Also, retrieve the duration of each ride. Ignore rides for which data on weather conditions is not available. */
SELECT
    start_ts,
    T.weather_conditions,
    duration_seconds
FROM
    trips
    INNER JOIN (
    SELECT
        ts,
        CASE WHEN description LIKE '%rain%'
        OR description LIKE '%storm%' THEN
            'Bad'
        ELSE
            'Good'
        END AS weather_conditions
    FROM 
        weather_records) T ON T.ts= trips.start_ts
WHERE
    pickup_location_id = 50
    AND dropoff_location_id = 63
    AND EXTRACT(DOW from trips.start_ts) = 6
ORDER BY trip_id

/*
SQL results were saved as .csv to be explored further in Python. */