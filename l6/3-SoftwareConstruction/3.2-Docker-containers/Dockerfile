# Dockerfile для Java + PostgreSQL клієнта
# Laboratory Work #6

FROM openjdk:17-jdk-slim

LABEL author="[Чорномор Олександр]"
LABEL description="Java client for Lab 6 - Software Construction"
LABEL version="1.0"

WORKDIR /app

COPY ProgramClientCode.java .
COPY . .

RUN javac ProgramClientCode.java

CMD ["java", "PostgreSQLClient"]
