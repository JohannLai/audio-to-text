#!/bin/bash

# 检查mp3目录是否存在，不存在则创建它
if [ ! -d "mp3" ]; then
    mkdir mp3
fi

# 遍历video目录中的所有mp4文件，并将它们转换为mp3文件
for video_file in ./video/*.mp4; do
    filename=$(basename "$video_file")
    # 检查 mp3 目录中是否已经存在同名文件，如果存在则输出提示并跳过
    if [ -f "./mp3/${filename%.*}.mp3" ]; then
        echo "File ./mp3/${filename%.*}.mp3 already exists, skipping ..."
        continue
    fi
    filename_without_extension="${filename%.*}"
    output_file="./mp3/${filename_without_extension}.mp3"

    echo "Converting $video_file to $output_file ..."

    ffmpeg -i "$video_file" -vn -acodec libmp3lame -ab 128k -ar 44100 "$output_file"
done
