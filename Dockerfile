FROM node:8-alpine

RUN apk --update add --no-cache git && \
    git clone https://github.com/AlexanderBabel/haste-server.git /opt/haste && \
    rm -rf /opt/haste/.git/ && \
    apk del git
WORKDIR /opt/haste

RUN npm ci && \
    rm -rf /opt/haste/config.js && \
    ln -s /opt/haste/config.json /opt/haste/config.js
ADD conf/config.json /opt/haste/config.json

EXPOSE 80
CMD ["node", "server.js"]

LABEL org.opencontainers.image.source="https://github.com/alexanderbabel/haste.alexbabel.com/"