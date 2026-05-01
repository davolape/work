FROM ubuntu:22.04 AS builder

RUN apt-get update && \
    apt-get install -y \
        gcc \
        libfcgi-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY server/server.c .
RUN gcc server.c -o server -lfcgi


FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
        spawn-fcgi \
        nginx \
        curl \
        libfcgi0ldbl && \
    rm -rf /var/lib/apt/lists/*
    
RUN useradd -r -s /bin/false appuser
USER appuser

WORKDIR /app

COPY --from=builder /app/server /app/server
COPY server/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s \
    CMD curl -f http://localhost || exit 1

CMD spawn-fcgi -n -p 81 -- /app/server

