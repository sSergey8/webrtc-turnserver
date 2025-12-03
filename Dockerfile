FROM ubuntu:22.04

RUN apt-get update && apt-get install -y coturn curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3478 3478/udp
EXPOSE 49152-65535/udp

CMD turnserver \
    --no-auth \
    --fingerprint \
    --listening-port=3478 \
    --min-port=49152 \
    --max-port=65535 \
    --listening-ip=0.0.0.0 \
    --relay-ip=0.0.0.0 \
    --external-ip=$(curl -s ifconfig.me) \
    --verbose
