FROM keymetrics/pm2:10-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    git \
    curl \
    openssh

MAINTAINER Benedikta Anya

RUN mkdir -p /usr/src/apps
WORKDIR /usr/src/apps

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]