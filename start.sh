#!/bin/bash

set -eu

if [[ ! -f /app/data/env.sh ]]; then
cat > /app/data/env.sh << EOF
# Add custom ENV configuration in this file
# For more information about Shields.io environment variables
# visit https://github.com/badges/shields/blob/master/doc/server-secrets.md

EOF
fi

source /app/data/env.sh

cd /app/code

echo "==> Changing ownership"
chown -R cloudron:cloudron /app/data

echo "==> Starting Shields.io"
exec gosu cloudron:cloudron node server

