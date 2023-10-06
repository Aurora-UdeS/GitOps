# use this temporarly to build node images.
# change back to alpine when the solution to include the pdfkit fonts in the bundled and package node app is found.

FROM node:16 AS build
WORKDIR /usr/src
COPY --from=service . .
RUN npm install --only=production
CMD ["node", "app.js"]