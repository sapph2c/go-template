FROM scratch
COPY ./go-template /
WORKDIR /
ENTRYPOINT ["/go-template"]