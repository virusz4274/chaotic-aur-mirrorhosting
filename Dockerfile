FROM alpine:latest
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O /bin/cloudflared
RUN chmod +x /bin/cloudflared
EXPOSE 80 443
ENTRYPOINT cloudflared --no-autoupdate
CMD tunnel run
