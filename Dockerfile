FROM alpine:latest
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O /bin/cloudflared
RUN chmod +x /bin/cloudflared
ENTRYPOINT cloudflared --no-autoupdate tunnel run
