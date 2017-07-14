# Backup a Postgres Database

When started this service will link to a database defined by environment
variables and backup the contents to a mounted volume.

## Usage

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

## Example

The given `docker-compose.yml` is an example of how this service can be used. It
defines some default values for the environment variables discussed above and
contains an example `db` service (with an empty database).

You can try it out with the following steps:

1. `docker-compose up -d --build` will create the containers. At the time of
   start up, the `pgbkp` service cannot connect to the database. Thus you will
   find a directory `data/` owned by root which contains an empty backup file.
2. Once the database is ready (`docker-compose logs`), you can run the backup
   service again with `docker-compose run --rm pgbkp`. After it is finished you
   should find a new file in the `data/` directory. It is very small, though,
   since the database is empty.
3. If you want to adjust the environment variables, we suggest creating an
   [`.env`](https://docs.docker.com/compose/env-file/) file.
