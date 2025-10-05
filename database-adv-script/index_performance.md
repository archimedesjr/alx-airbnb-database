Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

## Index for fast lookup by user_id in User Table

User: user_id

## Index for fast lookup by property_id and name in Property Table (Composite Indexing)

Property: property_id, name

## Index for fast lookup by booking_id, user_id, property_id in Booking Table (Composite Indexing)

Booking: booking_id, user_id, property_id
