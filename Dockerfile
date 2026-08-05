FROM itzg/minecraft-server:latest

USER root
RUN apt-get update && \
    apt-get install -y curl jq && \
    rm -rf /var/lib/apt/lists/*

COPY download-plugins.sh /usr/local/bin/download-plugins.sh
RUN chmod +x /usr/local/bin/download-plugins.sh

ENTRYPOINT ["/usr/local/bin/download-plugins.sh"]