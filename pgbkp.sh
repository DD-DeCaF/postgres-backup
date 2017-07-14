#!/usr/bin/env bash

set -e

# create compressed archive suitable for pg_restore
pg_dump --format=custom --compress=9 --verbose > \
    "${BACKUP_DIR}/${PGHOST}_${PGDATABASE}_$(date +%F_%T).dump"
