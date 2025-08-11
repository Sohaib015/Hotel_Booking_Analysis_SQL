-- Create a new database to store Hotel Booking Data

CREATE DATABASE hotel_booking;

-- Switch to the hotel_booking database to run all further queries here

USE hotel_booking;

-- Create a table to store all hotel booking records
CREATE TABLE hotel_bookings (

    
    -- Type of hotel: 'City Hotel' or 'Resort Hotel'
    hotel VARCHAR(50),

    -- 1 if booking was canceled, 0 if not
    is_canceled INT,

    -- Number of days between booking date and arrival date
    lead_time INT,

    -- Year of arrival
    arrival_date_year INT,

    -- Month of arrival (as a string: 'January', 'February', etc.)
    arrival_date_month VARCHAR(20),

    -- Week number of the year
    arrival_date_week_number INT,

    -- Day of the month the guest arrives
    arrival_date_day_of_month INT,

    -- Nights spent during the weekend (Saturday or Sunday)
    stays_in_weekend_nights INT,

    -- Nights spent during the week (Monday to Friday)
    stays_in_week_nights INT,

    -- Number of adults
    adults INT,

    -- Number of children
    children INT,

    -- Number of babies
    babies INT,

    -- Type of meal booked (e.g., BB = Bed & Breakfast)
    meal VARCHAR(50),

    -- Country code of the guest (e.g., 'PRT', 'GBR')
    country VARCHAR(5),

    -- Market segment (e.g., 'Online TA', 'Groups')
    market_segment VARCHAR(50),

    -- Channel through which booking was made (e.g., 'Direct', 'TA/TO')
    distribution_channel VARCHAR(50),

    -- 1 if the guest is a repeated guest
    is_repeated_guest INT,

    -- Number of previous cancellations by the guest
    previous_cancellations INT,

    -- Number of previous bookings that were not canceled
    previous_bookings_not_canceled INT,

    -- Room type the guest initially reserved
    reserved_room_type VARCHAR(5),

    -- Room type the guest was actually assigned
    assigned_room_type VARCHAR(5),

    -- Number of booking changes made
    booking_changes INT,

    -- Type of deposit made (e.g., 'No Deposit', 'Non Refund')
    deposit_type VARCHAR(20),

    -- ID of the travel agency (can be NULL)
    agent VARCHAR(10),

    -- ID of the company (can be NULL)
    company VARCHAR(10),

    -- Number of days on the waiting list
    days_in_waiting_list INT,

    -- Type of customer (e.g., 'Transient', 'Contract')
    customer_type VARCHAR(30),

    -- Average Daily Rate (price per night)
    adr DECIMAL(10,2),

    -- Number of car parking spaces required
    required_car_parking_spaces INT,

    -- Number of special requests made (e.g., high floor, late check-in)
    total_of_special_requests INT,

    -- Current status of the reservation (e.g., 'Check-Out', 'Canceled')
    reservation_status VARCHAR(20),

    -- Date when the reservation status was last updated
    reservation_status_date DATE
);

select * from hotel_bookings;