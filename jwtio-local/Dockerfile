FROM node:9-alpine AS build
RUN apk add --no-cache git && git clone https://github.com/jsonwebtoken/jsonwebtoken.github.io.git /tmp/src
WORKDIR /tmp/src
RUN npm install && node_modules/grunt-cli/bin/grunt build

FROM nginx:1

COPY --from=build /tmp/src/dist/website /usr/share/nginx/html
