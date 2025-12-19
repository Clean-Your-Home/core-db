create index if not exists refresh_sessions_user_idx
    on refresh_sessions(user_id);

create index if not exists refresh_sessions_expires_idx
    on refresh_sessions(expires_at);