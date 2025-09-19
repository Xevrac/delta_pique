#!/bin/bash
# Entry point for Piqueserver in Pterodactyl

# Export Pterodactyl variables
export PORT=${SERVER_PORT}
export OPTIONS="${OPTIONS}"

# Make Python modules in /mnt/server visible
export PYTHONPATH=/mnt/server:$PYTHONPATH

# Change to server working directory
cd /mnt/server || exit 1

# Run Piqueserver in foreground
python3.12 -m piqueserver
