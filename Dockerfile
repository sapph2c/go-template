FROM golang:latest
COPY . .

ENTRYPOINT ["top", "-b"]