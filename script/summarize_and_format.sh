#!/bin/bash

# Set your input and output directories
INPUT_DIR="./text"
OUTPUT_DIR="./text_formatted"

if [ ! -d $OUTPUT_DIR ]; then
  mkdir -p $OUTPUT_DIR
fi

# Loop through each text file in the input directory
for file in $INPUT_DIR/*.txt; do
  # Get the file name without the extension
  filename=$(basename -- "$file")
  filename="${filename%.*}"

  # if the file in output directory, skip
  if [ -f "$OUTPUT_DIR/$filename.txt" ]; then
    echo "File $OUTPUT_DIR/$filename.txt already exists, skipping ..."
    continue
  fi

  # Read the contents of the file
  contents=$(cat "$file")

  Msgs='[{"role": "user", "content": "你是助理，我连续发送多个原文文本，你回复“收到”，然后当我说“总结”的时候，给我一个短文概括，用原文的语言回答，用 markdown 格式输出，带标题"}, {"role": "assistant", "content": "收到"}]'

  # build the request body, which is a JSON object, generate serval like b
  newUserMsg='{"role": "user", "content": "'$contents'"}'
  newAssistantMsg='{"role": "assistant", "content": "收到"}'
  # use jq to add new msg to the end of the array
  Msgs=$(echo $Msgs | jq -c '. + ['"$newUserMsg"']')
  Msgs=$(echo $Msgs | jq -c '. + ['"$newAssistantMsg"']')

  # last user msg
  lastUserMsg='{"role": "user", "content": "总结"}'
  Msgs=$(echo $Msgs | jq -c '. + ['"$lastUserMsg"']')

  # build the -d param for curl
  curlParam='{
    "model": "gpt-3.5-turbo",
    "messages": '"$Msgs"'
  }'

  # Call the OpenAI API to get a completion
  response=$(curl -# https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d "$curlParam")

  if [[ $(echo "$response" | jq -r '.error') != "null" ]]; then
    # try to use ./python-lib/contruct_index.py 's method to get the summary
    # if failed, write the error to the output file
    response=$(python3 ./script/python-lib/construct_index.py "$file" "短文总结文章的内容")

    echo "# $filename" >>"$OUTPUT_DIR/$filename.txt"
    echo "## Summary Text" >>"$OUTPUT_DIR/$filename.txt"
    echo "$response" >>"$OUTPUT_DIR/$filename.txt"
    echo "" >>"$OUTPUT_DIR/$filename.txt"
    echo "## Original text" >>"$OUTPUT_DIR/$filename.txt"
    echo "$contents" >>"$OUTPUT_DIR/$filename.txt"
  else
    # Extract the completion from the response
    completion=$(echo "$response" | jq -r '.choices[].message.content')

    # Append the completion to the output file
    echo "# $filename" >>"$OUTPUT_DIR/$filename.txt"
    echo "## Summary Text" >>"$OUTPUT_DIR/$filename.txt"
    echo "$completion" >>"$OUTPUT_DIR/$filename.txt"
    echo "" >>"$OUTPUT_DIR/$filename.txt"
    echo "## Original text" >>"$OUTPUT_DIR/$filename.txt"
    echo "$contents" >>"$OUTPUT_DIR/$filename.txt"
  fi
done

echo "Done!"
