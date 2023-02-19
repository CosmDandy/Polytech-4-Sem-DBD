FROM postgres:15.2
WORKDIR /postgres
COPY sql/library_sql.sql /docker-entrypoint-initdb.d/
EXPOSE 5432