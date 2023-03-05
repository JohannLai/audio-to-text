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
  
  # Read the contents of the file
  contents=$(cat "$file")

  # Split the contents into chunks
  chunks=$(echo "$contents"  | sed 's/ //g' | fold -w 1000 -s)

  Msgs='[{"role": "user", "content": "你是助理，我连续发送多个原文文本，你回复“收到”，然后当我说“总结”的时候，给我一个短文概括，用原文的语言回答，用 markdown 格式输出，带标题"}, {"role": "assistant", "content": "收到"}]'
  
  # Loop through each chunk and call the OpenAI API
  for chunk in $chunks; do
    # build the request body, which is a JSON object, generate serval like b
    newUserMsg='{"role": "user", "content": "'$chunk'"}'
    newAssistantMsg='{"role": "assistant", "content": "收到"}'

    # use jq to add new msg to the end of the array
    Msgs=$(echo $Msgs | jq -c '. + ['"$newUserMsg"']')
    Msgs=$(echo $Msgs | jq -c '. + ['"$newAssistantMsg"']')
  done
  
  # last user msg
  lastUserMsg='{"role": "user", "content": "总结"}'
  Msgs=$(echo $Msgs | jq -c '. + ['"$lastUserMsg"']')

  # build the -d param for curl
  curlParam='{
    "model": "gpt-3.5-turbo",
    "messages": '"$Msgs"'
  }'

  echo $curlParam

  # Call the OpenAI API to get a completion
  response=$(curl -# https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $API_KEY" \
    -d "$curlParam")

  echo $response
    
  # Extract the completion from the response
  completion=$(echo "$response" | jq -r '.choices[].message.content')

  # if error, print the  contents of the file
  if [[ $completion == *"error"* ]]; then
    echo "## Error $completion" >> "$OUTPUT_DIR/$filename.txt"
    echo "## Contents $contents" >> "$OUTPUT_DIR/$filename.txt"
    exit 1
  fi
  
  # Append the completion to the output file
  echo "## Summary Text" >> "$OUTPUT_DIR/$filename.txt"
  echo "$completion" >> "$OUTPUT_DIR/$filename.txt"
  echo "" >> "$OUTPUT_DIR/$filename.txt"
  echo "## Original text" >> "$OUTPUT_DIR/$filename.txt"
  echo "$contents" >> "$OUTPUT_DIR/$filename.txt"

done

echo "Done!"