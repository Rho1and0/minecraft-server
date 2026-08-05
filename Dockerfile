FROM itzg/minecraft-server:latest

USER root

RUN apt-get update && \
    apt-get install -y curl jq && \
    rm -rf /var/lib/apt/lists/*

COPY download-plugins.sh /etc/cont-init.d/20-download-plugins

RUN chmod +x /etc/cont-init.d/20-download-plugins