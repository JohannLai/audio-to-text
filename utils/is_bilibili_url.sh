#!/bin/bash

# 判断是否是bilibili的链接
# 参数：链接
# 返回值：0-是Bilibili链接，1-不是Bilibili链接
function is_bilibili_url() {
    local url=$1
    if [[ $url =~ ^https://www.bilibili.com/video/.*$ ]]; then
        return 0
    else
        return 1
    fi
}