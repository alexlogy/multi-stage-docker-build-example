FROM golang:1.18.4-bullseye as builder

LABEL maintainer="alex@alexlogy.io"

ADD . /src
WORKDIR /src

RUN go build helloworld.go

FROM alpine:latest

LABEL maintainer="alex@alexlogy.io"

WORKDIR /app

COPY --from=builder /src/helloworld /app

ENTRYPOINT ["/app/helloworld"]
