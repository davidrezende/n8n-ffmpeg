# n8n + FFmpeg
FROM n8nio/n8n:latest

# Ganhar permissão para instalar pacotes
USER root

# Instala ffmpeg em Alpine OU Debian/Ubuntu
RUN set -eux; \
    if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache ffmpeg; \
    else \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ffmpeg; \
        rm -rf /var/lib/apt/lists/*; \
    fi

# (opcional) ajustar permissões
RUN chown -R node:node /home/node /data || true

# Volta a rodar como 'node' (como a imagem oficial)
USER node
