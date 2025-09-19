#!/bin/bash
# Minimal entrypoint for Piqueserver

cd /home/container || exit 1

# Trap SIGINT and rethrow as SIGTERM for compatibility
trap 'trap - SIGINT && kill -SIGTERM $$' SIGINT

# Replace vars like {{SERVER_PORT}} and {{OPTIONS}}
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')

echo "Starting Piqueserver with: ${MODIFIED_STARTUP}"

# Run the server
eval ${MODIFIED_STARTUP}
