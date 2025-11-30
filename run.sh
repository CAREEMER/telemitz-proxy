#!/bin/bash

set -e

# Load variables from .env file
source .env

# Generate nginx config from template
sed -e "s|\${PROXY_DOMAIN}|$PROXY_DOMAIN|g" \
    -e "s|\${BACKEND_API_URL}|$BACKEND_API_URL|g" \
    -e "s|\${API_SECRET}|$API_SECRET|g" \
    nginx/template.nginx.custom.conf > nginx/nginx.custom.conf

docker compose up -d