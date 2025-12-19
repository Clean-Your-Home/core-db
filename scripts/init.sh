#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/config.sh"
source "$SCRIPT_DIR/lib/validation.sh"
source "$SCRIPT_DIR/lib/generators.sh"
source "$SCRIPT_DIR/lib/utils.sh"

main() {
    validate_environment
    echo "Начинаю генерацию $INIT_FILE..."
    generate_init_file
    show_summary
}

main "$@"
