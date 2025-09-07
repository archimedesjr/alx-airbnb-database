# Database Normalization to 3NF

## Objective
Ensure the schema is normalized to Third Normal Form (3NF) by removing redundancy and enforcing dependency rules.

## Normalization Steps

### 1. First Normal Form (1NF)
- Ensured atomicity of all fields (e.g., email, phone_number, location).
- No repeating groups or arrays.

### 2. Second Normal Form (2NF)
- All tables have single-column primary keys (UUIDs).
- Non-key attributes depend on the whole primary key.

### 3. Third Normal Form (3NF)
- Removed all transitive dependencies.
- All attributes depend only on the primary key of their respective tables.
- Used foreign keys (e.g., user_id, reciepient_id) to maintain relationships without duplication.


## Conclusion
All tables meet 3NF requirements. The schema is efficient, non-redundant, and well-structured for scalable queries and data integrity.