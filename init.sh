#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD;
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB"<<-EOSQL
  CREATE EXTENSION hstore
EOSQL
osm2pgsql -d $POSTGRES_DB --username $POSTGRES_USER --create --slim --drop --latlong --hstore-all /data/data.osm.pbf
