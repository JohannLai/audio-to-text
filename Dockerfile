FROM alpine:3.14

LABEL maintainer="Your Name <your_email@example.com>"

# 安装依赖项
RUN apk add --no-cache build-base curl ffmpeg jq python3 py3-pip \
    && pip install --no-cache-dir you-get

RUN apk add --no-cache ca-certificates && update-ca-certificates

# 清理下载的软件包
RUN rm -rf /var/cache/apk/*

# 设置工作目录
WORKDIR /data

# 设置默认命令
CMD ["/bin/sh"]