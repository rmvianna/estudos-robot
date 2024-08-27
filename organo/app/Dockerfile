ARG NODE_VERSION=16.13.1

FROM node:${NODE_VERSION}-alpine

WORKDIR /usr/scr/app

COPY . .

RUN npm install

EXPOSE 3000

CMD npm start