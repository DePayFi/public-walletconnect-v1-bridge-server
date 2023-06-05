FROM node:19-slim

WORKDIR /root
COPY package.json ./
COPY package-lock.json ./
RUN npm install --no-optional && npm cache clean --force
ENV PATH /root/node_modules/.bin/:$PATH

COPY . .
RUN npm run build

CMD ["node", "/root/build"]
