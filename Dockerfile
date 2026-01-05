FROM node:22-alpine@sha256:e4c735aba1a0c90730d57cd90bc48e93eecb9e6bae0fda139d43dcd824746fbb

WORKDIR /repo

COPY src/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
