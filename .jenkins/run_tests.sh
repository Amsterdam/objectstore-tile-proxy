#!/bin/bash

set -e
set -u

echo "Starting test"

# is the service up and running?
nc -z atlastiles 80
echo "HTTP server up and running"

# does the health check work as expected?
curl -s http://atlastiles:80/status/health/ | grep 'Atlas Tiles OK'
echo "HTTP server serving files"

# do the tile locations work as expected?
curl -s http://atlastiles:80/tms/1.0.0/topo_RD/EPSG28992/fake-tile.txt | grep 'I AM A FAKE TILE'
echo "HTTP server serving tiles"

