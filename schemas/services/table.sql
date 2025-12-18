CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    area INTEGER NOT NULL CHECK (area >= 10),
    service_type service_type NOT NULL,
    frequency frequency_type NOT NULL,
    no_mop BOOLEAN NOT NULL DEFAULT false,
    no_vacuum BOOLEAN NOT NULL DEFAULT false,
    has_pet BOOLEAN NOT NULL DEFAULT false
);
