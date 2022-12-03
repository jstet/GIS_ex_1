FROM postgis/postgis:14-3.3
RUN apt-get update && apt-get -y install \
    osm2pgsql wget
RUN mkdir /data
RUN wget -O /data/data.osm.pbf https://download.geofabrik.de/europe/germany/baden-wuerttemberg/freiburg-regbez-latest.osm.pbf
# copy init.sh to container
COPY ./init.sh docker-entrypoint-initdb.d/init.sh
