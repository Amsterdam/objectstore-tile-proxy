#!/bin/bash

set -e
set -u

echo "Starting test"

# is the service up and running?
nc -z objectstore 80
echo "HTTP server up and running"

# does the health check work as expected?
curl -s http://objectstore:80/status/health/ | grep 'objectstore OK'
echo "HTTP server serving objectstore"

# do the tile locations work as expected?
curl -s http://objectstore:80/tms/1.0.0/topo_RD/EPSG28992/fake-tile.txt | grep 'I AM A FAKE objectstore'
echo "HTTP server serving objectstore"

