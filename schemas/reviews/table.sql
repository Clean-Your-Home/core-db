CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    booking_id UUID NOT NULL UNIQUE REFERENCES bookings(id),
    user_id uuid NOT NULL REFERENCES users(id),
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment VARCHAR(300),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
