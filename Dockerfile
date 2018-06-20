FROM golang AS builder
WORKDIR /go/src/github.com/jamesqin-cn/docker-pipec
RUN go get -v github.com/cncd/pipeline \
  && cd /go/src/github.com/cncd/pipeline/pipec \
  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o pipec .

FROM docker
MAINTAINER QinWuquan <jamesqin@vip.qq.com>
COPY --from=builder /go/src/github.com/cncd/pipeline/pipec/pipec /bin/pipec
ENTRYPOINT ["/bin/pipec"]
