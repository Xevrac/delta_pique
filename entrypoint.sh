#!/bin/bash
set -e

# The `piqueserver` package was installed here using --target=/mnt/server
export PYTHONPATH="/mnt/server:$PYTHONPATH"

# Run piqueserver using the system's python3 binary.
exec python3 -m piqueserver
