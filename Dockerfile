FROM alpine:latest

MAINTAINER mrbillington

ADD https://www.factorio.com/get-download/0.15.11/headless/linux64 /tmp/factorio_headless_x64.tar.xz
RUN tar xf /tmp/factorio_headless_x64.tar.xz && \
    rm /tmp/factorio_headless_x64.tar.xz

VOLUME ["/factorio/saves", "/factorio/mods", "/factorio/config"]

EXPOSE 34197/udp

COPY start start

CMD ["./start"]