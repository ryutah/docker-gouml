FROM golang:1.12-alpine as builder
RUN apk add --no-cache git
RUN go get -u github.com/kazukousen/gouml/cmd/gouml

FROM alpine:3.9
COPY --from=builder /go/bin/gouml /usr/local/bin/
WORKDIR /model
ENTRYPOINT ["/usr/local/bin/gouml", "i"]
