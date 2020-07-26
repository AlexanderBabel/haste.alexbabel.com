FROM node:alpine-14

RUN apk --update add --no-cache git && \
    git clone https://github.com/seejohnrun/haste-server.git /opt/haste && \
    rm -rf /opt/haste/.git/ && \
    apk del git
WORKDIR /opt/haste

RUN npm install && \
    rm -rf /opt/haste/config.js && \
    ln -s /opt/haste/config.json /opt/haste/config.js
ADD conf/config.json /opt/haste/config.json

VOLUME ["/opt/haste/data"]

EXPOSE 80
CMD ["npm", "start"]