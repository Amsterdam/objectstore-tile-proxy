#!/bin/bash

set -e
set -u

echo "Starting test"

# is the service up and running?
nc -z objectstore 80
echo "HTTP server up and running"
