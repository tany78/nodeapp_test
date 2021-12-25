FROM node:latest

WORKDIR /usr/src/app

COPY package.json ./

# setup proxies
RUN git config --global http.proxy http://172.1.10.21:3128/ && \
    npm config set strict-ssl=false \
    npm config set registry=http://registry.npmjs.org/ \
    npm config set proxy=http://172.1.10.21:3128/ && \
    npm config set https-proxy=http://172.1.10.21:3128/

RUN npm install

COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]
