FROM node

RUN git clone https://github.com/seejohnrun/haste-server.git /opt/haste

ADD config.js /opt/haste/
WORKDIR /opt/haste

RUN npm install

ENV PORT 80
EXPOSE 80

cmd ["npm", "start"]
