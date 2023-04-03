FROM node:16 AS build
WORKDIR /usr/src
COPY --from=gitops node esbuild.js
COPY --from=service . .
RUN npm install --only=production
RUN npm i -g pkg
RUN npm i esbuild
RUN ["npm", "run", "build"]

FROM alpine as runtime
WORKDIR /usr/src
RUN apk add libstdc++ gcompat
COPY --from=build /usr/src/build/app .
CMD ["./app"]