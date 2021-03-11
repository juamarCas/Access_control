FROM node:14.16

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node
RUN npm install 
COPY --chown=node:node . .
EXPOSE 3000
EXPOSE 3333
CMD ["npm", "run", "start"]
