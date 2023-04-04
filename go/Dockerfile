FROM golang:1.17-alpine AS build
WORKDIR /usr/src/app
COPY --from=service . .
RUN go mod download
RUN go build -o adminsdk cmd/adminsdk/main.go 

FROM alpine as runtime
WORKDIR /
COPY --from=build /usr/src/app/adminsdk .
ENV GOOGLE_APPLICATION_CREDENTIALS=/usr/src/app/credentials.json
EXPOSE 8010
CMD ["./adminsdk"]