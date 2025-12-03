FROM ubuntu:22.04

RUN apt-get update && apt-get install -y coturn && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3478
EXPOSE 3478/udp
EXPOSE 49152-65535/udp

CMD ["turnserver",
  "--listening-port=3478",
  "--fingerprint",
  "--lt-cred-mech",
  "--user=user:pass",
  "--realm=railway",
  "--listening-ip=0.0.0.0",
  "--relay-ip=0.0.0.0",
  "--min-port=49152",
  "--max-port=65535",
  "--no-tls",
  "--no-dtls",
  "--verbose"
]
