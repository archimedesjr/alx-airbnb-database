-- Insert User
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', '08012345678', 'guest'),
  (UUID(), 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password2', '08023456789', 'host'),
  (UUID(), 'Michael', 'Brown', 'michael.brown@example.com', 'hashed_password3', NULL, 'guest'),
  (UUID(), 'Sarah', 'Johnson', 'sarah.johnson@example.com', 'hashed_password4', '08034567890', 'host');

-- Insert Property
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'),
   'Cozy Apartment', 'A modern apartment in the heart of Lagos.', 'Lagos, Nigeria', 75.00),
  (UUID(), (SELECT user_id FROM User WHERE email = 'sarah.johnson@example.com'),
   'Beachside Villa', 'Luxury villa with ocean view.', 'Lekki, Nigeria', 150.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(),
   (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   '2025-10-01', '2025-10-05', 300.00, 'confirmed'),
  (UUID(),
   (SELECT property_id FROM Property WHERE name = 'Beachside Villa'),
   (SELECT user_id FROM User WHERE email = 'michael.brown@example.com'),
   '2025-11-10', '2025-11-15', 750.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (UUID(),
   (SELECT booking_id FROM Booking WHERE status = 'confirmed'),
   300.00, 'credit_card');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID(),
   (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   5, 'Amazing stay! Very clean and comfortable.'),
  (UUID(),
   (SELECT property_id FROM Property WHERE name = 'Beachside Villa'),
   (SELECT user_id FROM User WHERE email = 'michael.brown@example.com'),
   4, 'Great view but a bit expensive.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (UUID(),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'),
   'Hi Alice, is the Cozy Apartment available for next weekend?'),
  (UUID(),
   (SELECT user_id FROM User WHERE email = 'alice.smith@example.com'),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   'Hi John, yes it’s available! Feel free to book.');
