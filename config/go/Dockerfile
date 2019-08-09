ARG GO_VERSION
FROM golang:${GO_VERSION}
LABEL maintainer="kaka996.com"

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#更新Alpine的软件源为国内（清华大学）
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories
RUN apk update \
        && apk upgrade \
        && apk add --no-cache git \
        && rm -rf /var/cache/apk/*

WORKDIR /go