FROM postgis/postgis:15-3.3
WORKDIR /postgres
COPY SQL/library.sql /docker-entrypoint-initdb.d/
EXPOSE 5432