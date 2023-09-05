FROM node:18-buster-slim

WORKDIR /fibaas
ADD . .

RUN npm install --production

CMD ["npm", "start"]
