#!/bin/bash

# 获取用户名和密码
if [ -z "$PROXY_USERNAME" ] || [ -z "$PROXY_PASSWORD" ]; then
  echo "Error: PROXY_USERNAME or PROXY_PASSWORD is not set in environment variables."
  exit 1
fi

USERNAME=$PROXY_USERNAME
PASSWORD=$PROXY_PASSWORD

# 设置代理服务器地址和端口号
PROXY_HOST=$PROXY_HOST_C
PROXY_PORT=$PROXY_PORT_C

# 如果用户名和密码不为空，则添加到代理地址中
if [ -n "$USERNAME" ] && [ -n "$PASSWORD" ]; then
  PROXY="http://$USERNAME:$PASSWORD@$PROXY_HOST:$PROXY_PORT/"
else
  PROXY="http://$PROXY_HOST:$PROXY_PORT/"
fi

# 设置代理环境变量
export http_proxy=$PROXY
export https_proxy=$PROXY
export ftp_proxy=$PROXY
export socks_proxy=$PROXY
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

# 显示代理信息
echo "Proxy settings:"
echo "http_proxy=$http_proxy"
echo "https_proxy=$https_proxy"
echo "ftp_proxy=$ftp_proxy"
echo "socks_proxy=$socks_proxy"
echo "no_proxy=$no_proxy"