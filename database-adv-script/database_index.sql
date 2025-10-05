-- Index for fast lookup by user_id
CREATE INDEX idx_user_id ON User(user_id);

-- Index for fast lookup by property_id and name (Composite Indexing)
CREATE INDEX idx_property_name ON Property(property_id, name);

-- Index for fast lookup by booking_id, user_id, property_id
CREATE INDEX idx_booking_user_property ON Booking(booking_id, user_id, property_id);

EXPLAIN SELECT *
FROM Booking
INNER JOIN User
  ON Booking.user_id = User.user_id;


EXPLAIN SELECT * 
FROM Property
WHERE property_id in (
  SELECT property_id 
  FROM Review
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);

EXPLAIN SELECT *
FROM User
WHERE (
  SELECT COUNT(*)
  FROM Booking
  WHERE Booking.user_id = User.user_id
) > 3;

