#!/usr/bin/env bash

readonly INIT_FILE="build/init.sql"
readonly SCHEMA_DIR="schemas"

readonly ORDERED_TABLES=(
    users
    services
    cleaners
    bookings
    reviews
    payments
    additional_services
    booking_assignments
)

readonly SOURCES=(
    enum.sql:ENUM_ТИПЫ
    table.sql:ТАБЛИЦЫ
    function.sql:ФУНКЦИИ
    data.sql:СПРАВОЧНЫЕ_ДАННЫЕ
    views.sql:ПРЕДСТАВЛЕНИЯ
    index.sql:ИНДЕКСЫ
    rls.sql:ПОЛИТИКИ_RLS
    trigger.sql:ТРИГГЕРЫ
    seed.sql:ТЕСТОВЫЕ_ДАННЫЕ
)
