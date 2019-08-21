FROM node:lts-alpine
RUN npm install -g github-graphql-cli
USER 1000
ENV GITHUB_TOKEN undefined
ENTRYPOINT [ "github-graphql-cli" ]
