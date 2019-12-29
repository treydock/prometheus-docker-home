#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

docker-compose stop
docker run --rm --volumes-from prometheus -v ${DIR}/backup:/backup ubuntu tar cvf /backup/prometheus.tar /prometheus
docker run --rm --volumes-from grafana -v ${DIR}/backup:/backup ubuntu tar cvf /backup/grafana.tar /var/lib/grafana
docker-compose start

# Restore
# docker run --rm --volumes-from prometheus -v ${DIR}/backup:/backup ubuntu bash -c "cd /prometheus && tar xvf /backup/prometheus.tar --strip 1"
# docker run --rm --volumes-from grafana -v ${DIR}/backup:/backup ubuntu bash -c "cd /var/lib/grafana && tar xvf /backup/grafana.tar --strip 2"
