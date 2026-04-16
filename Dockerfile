FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN apk update && apk upgrade

COPY . .

EXPOSE 5000

CMD ["npm", "start"]