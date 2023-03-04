FROM alpine:latest

RUN apk add --no-cache \
  curl \
  ffmpeg \
  jq \
  python3 \
  py3-pip && \
  pip3 install you-get && \
  rm -rf /var/cache/apk/*


CMD ["/bin/sh"]