-- Insert Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (gen_random_uuid(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', '08012345678', 'guest'),
  (gen_random_uuid(), 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password2', '08023456789', 'host'),
  (gen_random_uuid(), 'Michael', 'Brown', 'michael.brown@example.com', 'hashed_password3', NULL, 'guest'),
  (gen_random_uuid(), 'Sarah', 'Johnson', 'sarah.johnson@example.com', 'hashed_password4', '08034567890', 'host');

-- Insert Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM Users WHERE email = 'alice.smith@example.com'),
   'Cozy Apartment', 'A modern apartment in the heart of Lagos.', 'Lagos, Nigeria', 75.00),
  (gen_random_uuid(), (SELECT user_id FROM Users WHERE email = 'sarah.johnson@example.com'),
   'Beachside Villa', 'Luxury villa with ocean view.', 'Lekki, Nigeria', 150.00);

-- Insert Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name = 'Cozy Apartment'),
   (SELECT user_id FROM Users WHERE email = 'john.doe@example.com'),
   '2025-10-01', '2025-10-05', 300.00, 'confirmed'),
  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name = 'Beachside Villa'),
   (SELECT user_id FROM Users WHERE email = 'michael.brown@example.com'),
   '2025-11-10', '2025-11-15', 750.00, 'pending');

-- Insert Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_method)
VALUES
  (gen_random_uuid(),
   (SELECT booking_id FROM Bookings WHERE status = 'confirmed'),
   300.00, 'credit_card');

-- Insert Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name = 'Cozy Apartment'),
   (SELECT user_id FROM Users WHERE email = 'john.doe@example.com'),
   5, 'Amazing stay! Very clean and comfortable.'),
  (gen_random_uuid(),
   (SELECT property_id FROM Properties WHERE name = 'Beachside Villa'),
   (SELECT user_id FROM Users WHERE email = 'michael.brown@example.com'),
   4, 'Great view but a bit expensive.');

-- Insert Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body)
VALUES
  (gen_random_uuid(),
   (SELECT user_id FROM Users WHERE email = 'john.doe@example.com'),
   (SELECT user_id FROM Users WHERE email = 'alice.smith@example.com'),
   'Hi Alice, is the Cozy Apartment available for next weekend?'),
  (gen_random_uuid(),
   (SELECT user_id FROM Users WHERE email = 'alice.smith@example.com'),
   (SELECT user_id FROM Users WHERE email = 'john.doe@example.com'),
   'Hi John, yes it’s available! Feel free to book.');
