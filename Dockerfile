FROM node

RUN git clone https://github.com/seejohnrun/haste-server.git /opt/haste

ADD config.js /opt/haste/
WORKDIR /opt/haste

RUN npm install

expose 7070

cmd ["npm", "start"]
