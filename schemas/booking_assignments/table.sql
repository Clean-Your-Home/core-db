CREATE TABLE booking_assignments (
    id SERIAL PRIMARY KEY,
    booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    cleaner_id INTEGER NOT NULL REFERENCES cleaners(id),
    assigned_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(booking_id, cleaner_id)
);
