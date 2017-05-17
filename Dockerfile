FROM frolvlad/alpine-glibc:alpine-3.5

MAINTAINER mrbillington

ENV VERSION=0.15.11

ADD https://www.factorio.com/get-download/${VERSION}/headless/linux64 /tmp/factorio_headless_x64.tar.xz
RUN tar xf /tmp/factorio_headless_x64.tar.xz && rm /tmp/factorio_headless_x64.tar.xz

VOLUME ["/saves", "/mods", "/config"]

EXPOSE 34197/udp

COPY start start

CMD ["./start"]