FROM postgres:15-alpine

COPY --from=service postgres/schema.sql /docker-entrypoint-initdb.d/1-schema.sql
COPY --from=service postgres/data.sql /docker-entrypoint-initdb.d/2-data.sql
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_USER=postgres