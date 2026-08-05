#!/bin/bash
set -e

PLUGIN_DIR="/data/plugins"

mkdir -p "$PLUGIN_DIR"

URL=$(curl -s https://api.modrinth.com/v2/project/heartbound/version \
    | jq -r '.[0].files[0].url')

curl -L "$URL" -o "$PLUGIN_DIR/Heartbound.jar"

chown -R minecraft:minecraft /data

exec su-exec minecraft /start