#!/bin/sh
set -eux

cd /work/core-db
./scripts/init.sh
test -f ./build/init.sql
psql -v ON_ERROR_STOP=1 -f ./build/init.sql