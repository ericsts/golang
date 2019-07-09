FROM golang:alpine3.10 AS builder

RUN apk update && apk add --no-cache git

WORKDIR $GOPATH/src/mypackage/myapp/

ADD main.go .

RUN go get -d -v

RUN go build -o /go/bin/codeeducation

FROM scratch

COPY --from=builder /go/bin/codeeducation /go/bin/codeeducation

ENTRYPOINT ["/go/bin/codeeducation"]

