#!/bin/bash

set -e

PLUGIN_DIR="/data/plugins"
mkdir -p "$PLUGIN_DIR"

download_modrinth_plugin() {

    PROJECT_ID="$1"
    OUTPUT_NAME="$2"

    echo "Buscando última versión de $PROJECT_ID..."

    URL=$(curl -s "https://api.modrinth.com/v2/project/${PROJECT_ID}/version" \
        | jq -r '.[0].files[0].url')

    if [[ "$URL" == "null" || -z "$URL" ]]; then
        echo "No se pudo obtener $PROJECT_ID"
        exit 1
    fi

    if [ ! -f "$PLUGIN_DIR/$OUTPUT_NAME.jar" ]; then
        echo "Descargando $OUTPUT_NAME..."
        curl -L "$URL" -o "$PLUGIN_DIR/$OUTPUT_NAME.jar"
    else
        echo "$OUTPUT_NAME ya existe."
    fi
}

download_modrinth_plugin "heartbound" "Heartbound"

echo "Plugins listos."

exec /start