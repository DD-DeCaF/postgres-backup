# Backup a Postgres Database

This container assumes the following:

1. There is a volume mounted at the directory given by `BACKUP_DIR` and this
   variable is passed into the container's environment.
2. Non-default connection parameters are controlled by the following environment
   variables:

   ```
   PGHOST
   PGUSER
   PGPORT
   PGDATABASE
   PGPASSWORD
   ```

   at the very least, `PGHOST` should probably be a linked postgres container
   that hosts the database.
