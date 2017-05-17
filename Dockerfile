FROM alpine:latest

MAINTAINER mrbillington

ENV FACTORIO_VERSION "0.13.20" 

ADD https://www.factorio.com/get-download/0.13.20/headless/linux64 /tmp/factorio_headless_x64.tar.gz
RUN tar xzf /tmp/factorio_headless_x64.tar.gz && \
    rm /tmp/factorio_headless_x64.tar.gz

VOLUME ["/factorio/saves", "/factorio/mods", "/factorio/config"]

EXPOSE 34197/udp

COPY start start

ENTRYPOINT ["./start"]