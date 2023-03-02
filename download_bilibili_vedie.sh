#!/bin/bash

# 从文件中读取链接列表
input="video_list.txt"

# 逐行读取链接并下载视频
while IFS= read -r line
do
    echo "Downloading video from $line ..."
    you-get $line -o ./video
done < "$input"
