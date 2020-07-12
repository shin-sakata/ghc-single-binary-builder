FROM ubuntu:18.04

COPY ./bin/sqlite-dependent-example-exe /
COPY ./docker/executable/schema.sql /
COPY ./docker/executable/seed.sql /

RUN apt update -y && apt upgrade -y

RUN apt install -y sqlite3

RUN sqlite3 sqlite-dependent-example.db < schema.sql
RUN sqlite3 sqlite-dependent-example.db < seed.sql

COPY ./bin/sqlite-dependent-example-exe /
CMD ["./sqlite-dependent-example-exe" ]
