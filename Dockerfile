FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install express

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]