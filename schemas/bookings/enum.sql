CREATE TYPE time_slot_type AS ENUM (
    '9-12',
    '12-15', 
    '15-18',
    '18-21'
);

CREATE TYPE booking_status AS ENUM (
    'pending',
    'confirmed', 
    'in_progress',
    'completed', 
    'cancelled'
);
