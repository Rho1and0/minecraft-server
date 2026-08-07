#!/usr/bin/env bash
set -e

PLUGIN_DIR="/data/plugins"
mkdir -p "$PLUGIN_DIR"

if [ ! -f "$PLUGIN_DIR/SharedLife.jar" ]; then
    echo "Descargando SharedLife..."

    URL=$(curl -s https://api.modrinth.com/v2/project/sharedlife/version \
        | jq -r '.[0].files[0].url')

    curl -L "$URL" -o "$PLUGIN_DIR/SharedLife.jar"

    chown -R 1000:1000 "$PLUGIN_DIR"
fi

if [ ! -f "$PLUGIN_DIR/WorldReset.jar" ]; then
    echo "Descargando WorldReset..."

    URL=$(curl -s https://api.modrinth.com/v2/project/worldreset/version \
        | jq -r '.[0].files[0].url')

    curl -L "$URL" -o "$PLUGIN_DIR/WorldReset.jar"

    chown -R 1000:1000 "$PLUGIN_DIR"
fi