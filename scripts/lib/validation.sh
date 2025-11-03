#!/usr/bin/env bash

validate_environment() {
    [[ -d $SCHEMA_DIR ]] || { 
        echo "Ошибка: директория '$SCHEMA_DIR' не существует!" 
        exit 1 
    }
    
    local init_dir=$(dirname "$INIT_FILE")
    mkdir -p "$init_dir"
    
    touch "$INIT_FILE"   || { 
        echo "Ошибка: нет прав на запись в '$INIT_FILE'!" 
        exit 1 
    }
}
