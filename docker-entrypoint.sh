#!/bin/sh
# Render / production: set GATEWAY_PROXY_* and UAM_FRONTEND_URL in the host dashboard.
# Local Compose: defaults below match the `gateway` service on port 8080.
set -e

export GATEWAY_PROXY_URL="${GATEWAY_PROXY_URL:-http://gateway:8080}"
export GATEWAY_PROXY_HOST="${GATEWAY_PROXY_HOST:-gateway}"

envsubst '${GATEWAY_PROXY_URL} ${GATEWAY_PROXY_HOST}' \
    < /etc/nginx/nginx.conf.template \
    > /etc/nginx/nginx.conf

# UAM sign-in links — production URL from env; local dev uses uam-link.js port fallback.
{
    echo '// Generated at container start — do not commit'
    if [ -n "${UAM_FRONTEND_URL:-}" ]; then
        esc=$(printf '%s' "$UAM_FRONTEND_URL" | sed "s/'/\\\\'/g")
        echo "window.UAM_FRONTEND_URL = '${esc}';"
    fi
} > /usr/share/nginx/html/runtime-config.js

exec nginx -g 'daemon off;'
