CREATE TABLE cleaners (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    hire_date DATE NOT NULL,
    salary_rate DECIMAL(10,2) NOT NULL CHECK (salary_rate > 0),
    specialization specialization_type[] NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
