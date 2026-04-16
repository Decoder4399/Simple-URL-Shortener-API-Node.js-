FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN apt-get update && apt-get upgrade -y

COPY . .

EXPOSE 5000

CMD ["npm", "start"]