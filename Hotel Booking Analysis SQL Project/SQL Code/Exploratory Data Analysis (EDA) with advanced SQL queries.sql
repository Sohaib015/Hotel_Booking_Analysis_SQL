-- Count total bookings for each hotel type (City Hotel, Resort Hotel) 
select * from hotel_bookings;
SELECT 
    hotel, COUNT(*) AS total_bookings
FROM
    hotel_bookings
GROUP BY hotel
ORDER BY total_bookings DESC;

-- Calculate cancellation rate per arrival month

SELECT 
    arrival_date_month,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_canceled,
    ROUND(SUM(is_canceled) / COUNT(*) * 100, 2) AS cancellation_rate_percent
FROM
    hotel_bookings
GROUP BY arrival_date_month
ORDER BY arrival_date_month;

-- Calculate average stay length combining weekend and week nights

SELECT 
    hotel,
    ROUND(AVG(stays_in_weekend_nights + stays_in_week_nights),
            2) AS avg_length_of_stay
FROM
    hotel_bookings
GROUP BY hotel
ORDER BY avg_length_of_stay DESC;

-- Top 10 countries by number of bookings
SELECT
    country,
    COUNT(*) AS total_bookings
FROM
    hotel_bookings
GROUP BY
    country
ORDER BY
    total_bookings DESC
LIMIT 10;

-- Analyze cancellation rate based on lead time buckets
SELECT 
    CASE
        WHEN lead_time <= 7 THEN '0-7 days'
        WHEN lead_time BETWEEN 8 AND 30 THEN '8-30 days'
        WHEN lead_time BETWEEN 31 AND 90 THEN '31-90 days'
        WHEN lead_time > 90 THEN '90+ days'
        ELSE 'Unknown'
    END AS lead_time_range,
    COUNT(*) AS total_bookings,
    SUM(is_canceled) AS total_canceled,
    ROUND(SUM(is_canceled) / COUNT(*) * 100, 2) AS cancellation_rate_percent
FROM
    hotel_bookings
GROUP BY lead_time_range
ORDER BY lead_time_range;

--  Rank countries by total bookings with ties handled

SELECT country ,
count(*) as total_bookings,
rank() over (order by count(*) desc ) as booking_rank
from hotel_bookings
group by country 
order by booking_rank
limit 20;

-- Calculate monthly total bookings and compare with previous month

SELECT
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS total_bookings,
    LAG(COUNT(*)) OVER (PARTITION BY arrival_date_year ORDER BY STR_TO_DATE(arrival_date_month, '%M')) AS prev_month_bookings,
    ROUND(((COUNT(*) - LAG(COUNT(*)) OVER (PARTITION BY arrival_date_year ORDER BY STR_TO_DATE(arrival_date_month, '%M'))) / LAG(COUNT(*)) OVER (PARTITION BY arrival_date_year ORDER BY STR_TO_DATE(arrival_date_month, '%M'))) * 100, 2) AS mom_growth_percent
FROM
    hotel_bookings
GROUP BY
    arrival_date_year,
    arrival_date_month
ORDER BY
    arrival_date_year,
    STR_TO_DATE(arrival_date_month, '%M');
    
-- Calculate running total of bookings over months within each year

SELECT
    arrival_date_year,
    arrival_date_month,
    COUNT(*) AS monthly_bookings,
    SUM(COUNT(*)) OVER (PARTITION BY arrival_date_year ORDER BY STR_TO_DATE(arrival_date_month, '%M') ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_bookings
FROM
    hotel_bookings
GROUP BY
    arrival_date_year,
    arrival_date_month
ORDER BY
    arrival_date_year,
    STR_TO_DATE(arrival_date_month, '%M');
    
    


