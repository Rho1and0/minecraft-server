FROM itzg/minecraft-server:latest

USER root
RUN apt-get update && \
    apt-get install -y curl jq && \
    rm -rf /var/lib/apt/lists/*

COPY download-plugins.sh /download-plugins.sh
RUN chmod +x /download-plugins.sh

USER minecraft

ENTRYPOINT ["/download-plugins.sh"]