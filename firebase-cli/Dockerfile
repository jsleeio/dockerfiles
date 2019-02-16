FROM node:lts-alpine
RUN npm install -g firebase-tools
USER node
VOLUME /project
WORKDIR /project
ENTRYPOINT [ "firebase" ]
