-- Fetch orders data of city_1, city_2, city_3 in November 
SELECT city, date_day, orders
FROM bicycles_indexes
WHERE city in ('city_1', 'city_2', 'city_3') AND MONTH(date_day) = 11;

-- Fetch batteries shortages data of city_1 in November
SELECT date_day, batteries_needs_1-batteries_finishs_1 as b1, batteries_needs_2-batteries_finishs_2 as b2, batteries_needs_3 - batteries_finishs_3 as b3, batteries_needs_4 - batteries_finishs_4 as b4
FROM bicycles_indexes
WHERE city = 'city_1' AND MONTH(date_day) = 11;

-- Fetch Power Switching Rate data of city_1 in November and deliver in descending order
SELECT date_day, batteries_finishs/batteries_needs as b, batteries_finishs_1/batteries_needs_1 as b1, batteries_finishs_2/batteries_needs_2 as b2, batteries_finishs_3/batteries_needs_3 as b3, batteries_finishs_4/batteries_needs_4 as b4
FROM bicycles_indexes
WHERE city = 'city_1' AND MONTH(date_day) = 11
ORDER BY b DESC;

-- Fetch each city's total active bicycles in November
SELECT city, SUM(active_bikes_1) as a1, SUM(active_bikes_2) as a2, SUM(active_bikes_3) as a3, SUM(active_bikes_4) as a4
FROM bicycles_indexes
WHERE MONTH(date_day) = 11
GROUP BY city;

-- Join table 'special_days' and table 'bicycles_indexes' for city_1
SELECT * FROM special_days LEFT JOIN
(SELECT * FROM bicycles_indexes WHERE city = 'city_1') as city_1
ON special_days.date_day = city_1.date_day
ORDER BY special_days.date_day