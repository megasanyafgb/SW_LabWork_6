# Dockerfile for custom PostgreSQL image
FROM postgres

LABEL maintainer="Your Name <your.email@example.com>"
LABEL description="Custom PostgreSQL image with initialization script"
LABEL version="1.0"

ENV POSTGRES_DB=blazhkodb
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=1234

COPY db_scripts.sql /docker-entrypoint-initdb.d/

EXPOSE 5432