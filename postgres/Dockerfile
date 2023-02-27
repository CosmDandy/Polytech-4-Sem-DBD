FROM postgres:15.2
WORKDIR /postgres
COPY sql/library.sql /docker-entrypoint-initdb.d/
EXPOSE 5432