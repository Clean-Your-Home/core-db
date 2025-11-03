#!/usr/bin/env bash

process_ordered_tables() {
    local tbl file rel
    for tbl in "${ORDERED_TABLES[@]}"; do
        for file in table.sql seed.sql; do
            rel=$tbl/$file
            [[ -f $SCHEMA_DIR/$rel ]] || continue
            printf '\n-- Файл: %s\n' "${rel#/}"
            cat "$SCHEMA_DIR/$rel"
        done
    done
}

process_glob_files() {
    local filename=$1 file
    while IFS= read -r -d '' file; do
        printf '\n-- Файл: %s\n' "${file#$SCHEMA_DIR/}"
        cat "$file"
    done < <(find "$SCHEMA_DIR" -name "$filename" -type f -print0)
}

show_summary() {
    echo "Генерация $INIT_FILE завершена!"
    echo
    echo "Порядок выполнения:"
    local i=1 e
    for e in "${SOURCES[@]}"; do
        printf '  %d. %s\n' "$((i++))" "${e#*:}"
    done
}
