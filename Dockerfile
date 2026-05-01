FROM alpine:3.22 AS ffmpeg
RUN apk add --no-cache ffmpeg

FROM n8nio/n8n:2.18.5

USER root
COPY --from=ffmpeg /usr/bin/ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /usr/bin/ffprobe /usr/local/bin/ffprobe
USER node
