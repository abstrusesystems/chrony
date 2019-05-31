#!/bin/bash

# exit on error
set -e

echo ${DATA}

# run CMD
exec "$@"
