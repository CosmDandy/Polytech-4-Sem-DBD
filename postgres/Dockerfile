FROM postgres:15.2
WORKDIR /postgres
COPY sql/demo-small-20170815.sql /docker-entrypoint-initdb.d/
EXPOSE 5432