FROM docker
COPY ./bin/pipec /bin/pipec
ENTRYPOINT ["/bin/pipec"]
