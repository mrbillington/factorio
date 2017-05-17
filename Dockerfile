FROM alpine:latest

MAINTAINER mrbillington

ENV FACTORIO_VERSION "0.13.20" 

ADD https://www.factorio.com/get-download/$FACTORIO_VERSION/headless/linux64 /tmp/factorio_headless_x64_$FACTORIO_VERSION.tar.gz
RUN tar xzf /tmp/factorio_headless_x64_$FACTORIO_VERSION.tar.gz && \
    rm /tmp/factorio_headless_x64_$FACTORIO_VERSION.tar.gz

WORKDIR /factorio

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp

COPY start start

ENTRYPOINT ["./start"]