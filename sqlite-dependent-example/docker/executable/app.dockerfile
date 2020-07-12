FROM scratch

COPY ./bin/sqlite-dependent-example-exe /
CMD ["./sqlite-dependent-example-exe" ]
