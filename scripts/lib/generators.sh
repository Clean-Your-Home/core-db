#!/usr/bin/env bash

generate_init_file() {
    {
        write_header
        local entry
        for entry in "${SOURCES[@]}"; do
            generate_section "${entry%:*}" "${entry#*:}"
        done
        write_footer
    } > "$INIT_FILE"
}

write_header() {
    cat <<'EOF'
-- Автоматически сгенерированный init.sql
-- Не редактировать вручную! Генерируется скриптом

BEGIN;

EOF
}

write_footer() {
    printf '\nCOMMIT;\n\n-- Сгенерировано %s\n' "$(date +'%Y-%m-%d %H:%M:%S')"
}

generate_section() {
    local filename=$1 title=$2
    printf '\n-- %s\n' "$title"

    case "$filename" in
        table.sql) process_ordered_tables ;;
        *)         process_glob_files "$filename" ;;
    esac
}
