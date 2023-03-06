#!/bin/bash

if [ -z "$PROXY_USERNAME" ] || [ -z "$PROXY_PASSWORD" ]; then
  echo "Error: PROXY_USERNAME or PROXY_PASSWORD is not set in environment variables."
  exit 1
fi

USERNAME=$PROXY_USERNAME
PASSWORD=$PROXY_PASSWORD

PROXY_HOST=$PROXY_HOST
PROXY_PORT=$PROXY_PORT

if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then
  PROXY="http://$USERNAME:$PASSWORD@$PROXY_HOST:$PROXY_PORT/"
else
  echo "Error: PROXY_USERNAME or PROXY_PASSWORD is not set in environment variables."
  exit 1
fi

export http_proxy=$PROXY
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

# 显示代理信息
echo "Proxy settings:"
echo "http_proxy=$http_proxy"
echo "no_proxy=$no_proxy"