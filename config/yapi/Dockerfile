FROM node:10.16.0-alpine
LABEL maintainer="kaka996.com"

ARG YAPI_VERSION
ARG YAPI_HOST_PORT

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV YAPI_DIR="/home"
ENV VENDORS="${YAPI_DIR}/vendors"
ENV VERSION="${YAPI_VERSION}"
ENV GIT_URL=https://github.com/YMFE/yapi.git
ENV GIT_MIRROR_URL=https://gitee.com/mirrors/YApi.git

WORKDIR ${YAPI_DIR}

COPY entrypoint.sh /bin
COPY wait-for-it.sh /

RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories
RUN apk update \
        && apk upgrade \
        && apk add --no-cache git curl python make openssl tar gcc bash \
        && rm -rf /var/cache/apk/*

RUN rm -rf node && \
    ret=`curl -s  https://api.ip.sb/geoip | grep China | wc -l` && \
    if [ $ret -ne 0 ]; then \
        GIT_URL=${GIT_MIRROR_URL} && npm config set registry https://registry.npm.taobao.org; \
    fi; \
    echo ${GIT_URL} && \
	git clone --depth 1 ${GIT_URL} vendors && \
	cd vendors && \
	npm install -g node-gyp yapi-cli && \
	npm install --production && \
 	chmod +x /bin/entrypoint.sh && \
 	chmod +x /wait-for-it.sh

#COPY config.json ${VENDORS}

EXPOSE ${YAPI_HOST_PORT}
ENTRYPOINT ["entrypoint.sh"]