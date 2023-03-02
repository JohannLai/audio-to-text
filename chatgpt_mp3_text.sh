#!/bin/bash

# 定义 API 认证参数
API_KEY="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"

# PROMPT
PROMPT="给输出的文字增加标点符号，分成几个段落，并且在最后增加一个短文来总结这段音频的内容。"

# Model
MODEL="whisper-1"

# 语言
LANGUAGE="zh"

# 定义输入和输出目录
INPUT_DIR="./mp3"
OUTPUT_DIR="./text"

# 如果输出目录不存在，就创建它
if [ ! -d $OUTPUT_DIR ]; then
  mkdir -p $OUTPUT_DIR
fi

# 循环处理输入目录下的所有 MP3 文件
for file in $INPUT_DIR/*.mp3; do
  echo "Converting $file ..."
  
  # 从文件名中提取出不带扩展名的文件名
  filename=$(basename "$file" .mp3)
  # 定义输出文件路径
  output_file="$OUTPUT_DIR/$filename.txt"

  # Call the OpenAI API to transcribe the audio file
  response=$(curl -s https://api.openai.com/v1/audio/transcriptions -X POST -H "Authorization: Bearer $API_KEY" -H 'Content-Type: multipart/form-data' -F file=@"$file" -F model=$MODEL -F language=$LANGUAGE -F prompt="$PROMPT")
  
  # echo $response
  
  # Extract the transcription from the response
  transcription=$(echo "$response" | jq -r ".text")

  # Output the transcription to the output file
  echo "$filename: $transcription" >> "$output_file"

  # 输出转换完成的文件名
  echo "Converted $file to $output_file"
done
