create extension if not exists pgcrypto;

CREATE TABLE users (
    id uuid primary key default gen_random_uuid(),
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) not null,--Добавил ограничение для упрощения отладки -- NULL для гостей
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone VARCHAR(12),
    role user_role NOT NULL DEFAULT 'client',

    is_active BOOLEAN NOT NULL DEFAULT true,
    is_verified BOOLEAN NOT NULL DEFAULT false,
    email_verification_token_hash VARCHAR(100),
    password_reset_token_hash VARCHAR(100),
    password_reset_expires TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

create table if not exists refresh_sessions (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references users(id) on delete cascade,

    refresh_token_hash text not null,
    user_agent text,
    ip inet,

    expires_at timestamptz not null,
    revoked_at timestamptz,

    created_at timestamptz not null default now()
);
