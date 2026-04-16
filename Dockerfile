FROM node:18-bullseye-slim

WORKDIR /app

COPY package*.json ./
RUN apk update && apk upgrade
RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm", "start"]