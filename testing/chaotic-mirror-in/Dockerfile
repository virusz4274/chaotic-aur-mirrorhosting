FROM ubuntu:latest
RUN apt-get update && apt-get install -y apt-transport-https curl ca-certificates tzdata wget
RUN curl -s -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list
RUN printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | tee /etc/apt/preferences.d/syncthing
RUN apt-get update && apt-get install -y syncthing
RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
RUN dpkg -i cloudflared-linux-amd64.deb
RUN rm cloudflared-linux-amd64.deb
EXPOSE 8384 22000/tcp 22000/udp 21027/udp
ENV STGUIADDRESS=0.0.0.0:8384
COPY 2eb44747-8c77-4ea5-a0f8-f23885737818.json /root/.cloudflared/
COPY config.yml.development /root/.cloudflared/config.yml
RUN apt update && apt install -y nginx
RUN grep -n -e $'^[ \t]*location / {$' /etc/nginx/http.d/default.conf \
        | cut -d : -f 1 \
        | xargs -i expr 1 + {} \
        | xargs -i sed -ie '{} s/return 404;$/autoindex on;/' /etc/nginx/http.d/default.conf \
      && sed -ie '/# Everything is a 404/d' /etc/nginx/http.d/default.conf \
      && rm -f /etc/nginx/http.d/default.confe
