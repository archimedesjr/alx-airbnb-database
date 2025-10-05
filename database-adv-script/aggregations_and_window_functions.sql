-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT 
  user_id, 
  COUNT(*) as total_booking
FROM Booking
GROUP BY user_id;

-- Using RANK to rank properties based on the total number of bookings they have received.
SELECT 
	property_id, 
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY property_id DESC) AS book_rank
FROM BOOKING
GROUP BY property_id;

-- Using ROW_NUMBER to rank properties based on the total number of bookings they have received.
SELECT 
	property_id, 
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY property_id DESC) AS book_rank
FROM BOOKING
GROUP BY property_id;