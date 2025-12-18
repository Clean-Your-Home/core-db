CREATE TABLE bookings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    service_id INTEGER NOT NULL REFERENCES services(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(id),

    scheduled_date TIMESTAMPTZ NOT NULL CHECK (scheduled_date >= NOW()),
    time_slot time_slot_type NOT NULL,
    address TEXT NOT NULL,
    comment TEXT DEFAULT '',

    status booking_status NOT NULL DEFAULT 'pending',
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
