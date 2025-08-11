USE hotel_booking;

-- Date Cleaning 

-- View the first 10 rows to understand the data

SELECT 
    *
FROM
    hotel_bookings
LIMIT 10;

-- Count how many NULL or empty values exist in each important column

SELECT 
    SUM(children IS NULL OR children = '') AS null_children,
    SUM(agent IS NULL OR agent = '') AS null_agent,
    SUM(company IS NULL OR company = '') AS null_company
FROM
    hotel_bookings;

-- Replace NULL or empty values in children with 0

UPDATE hotel_bookings 
SET 
    children = 0
WHERE
    children IS NULL OR children = '';

 -- Replace NULL or empty values in agent with 'Unknown'
 
 UPDATE hotel_bookings 
SET 
    agent = 'Unknown'
WHERE
    agent IS NULL OR agent = '';
 
 -- Replace NULL or empty values in company with 'Unknown'

UPDATE hotel_bookings 
SET 
    company = 'Unknown'
WHERE
    company IS NULL OR company = '';

-- The dataset has year, month (string), and day separately — let’s make a real DATE column for analysis
 -- Add a new column for the complete arrival date
 
 ALTER TABLE hotel_bookings
 ADD COLUMN arrival_date date ;
 
 -- Update the new column with combined date values
 
 UPDATE hotel_bookings 
SET 
    arrival_date = STR_TO_DATE(CONCAT(arrival_date_year,
                    '-',
                    arrival_date_month,
                    '-',
                    arrival_date_day_of_month),
            '%Y-%M-%d');
            
-- Find bookings with 0 adults
SELECT 
    *
FROM
    hotel_bookings
WHERE
    adults = 0;
    
    -- Delete rows with 0 adults
    
DELETE FROM hotel_bookings 
WHERE
    adults = 0;
    


