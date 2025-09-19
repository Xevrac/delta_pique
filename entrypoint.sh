#!/bin/bash
# Entry point for Piqueserver
# Make Python modules in /mnt/server visible
export PYTHONPATH=/mnt/server:$PYTHONPATH

# Run Piqueserver in foreground.
#exec python3 -m piqueserver
exec python3.12 -m piqueserver