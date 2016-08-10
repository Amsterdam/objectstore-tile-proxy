#!/bin/bash

set -e
set -u

echo "Starting test"

# is the service up and running?
nc -z objectstore 80
echo "HTTP server up and running"

# do the tile locations work as expected?
curl -s https://ffb7a5a57dd34cc49436abc510cad162.objectstore.eu/tiles/lufo2011_rd_cache_EPSG28992/fake-tile.txt | grep 'I AM A FAKE objectstore'
echo "HTTP server serving objectstore"

