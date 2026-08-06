#!/usr/bin/env bash
set -e

PLUGIN_DIR="/data/plugins"
mkdir -p "$PLUGIN_DIR"

if [ ! -f "$PLUGIN_DIR/Heartbound.jar" ]; then
    echo "Descargando Heartbound..."

    URL=$(curl -s https://api.modrinth.com/v2/project/heartbound/version \
        | jq -r '.[0].files[0].url')

    curl -L "$URL" -o "$PLUGIN_DIR/Heartbound.jar"

    chown -R 1000:1000 "$PLUGIN_DIR"
fi

if [ ! -f "$PLUGIN_DIR/WorldReset.jar" ]; then
    echo "Descargando WorldReset..."

    URL=$(curl -s https://api.modrinth.com/v2/project/worldreset/version \
        | jq -r '.[0].files[0].url')

    curl -L "$URL" -o "$PLUGIN_DIR/WorldReset.jar"

    chown -R 1000:1000 "$PLUGIN_DIR"
fi