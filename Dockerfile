FROM docker

MAINTAINER QinWuquan <jamesqin@vip.qq.com>

COPY ./bin/pipec /bin/pipec

ENTRYPOINT ["/bin/pipec"]
