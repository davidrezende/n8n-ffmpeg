# Dockerfile: n8n com FFmpeg
FROM n8nio/n8n:latest

USER root

# Tenta instalar pelo Alpine; se falhar, usa apt (Debian/Ubuntu).
RUN set -eux; \
    if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache ffmpeg; \
    else \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ffmpeg; \
        rm -rf /var/lib/apt/lists/*; \
    fi

# Garantir permissões padrão do n8n
RUN chown -R node:node /home/node /data || true

USER node
