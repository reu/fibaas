FROM node:20-buster-slim

WORKDIR /fibaas
ADD . .

RUN yarn && yarn build

CMD ["node", "dist/main"]
