#!/bin/bash


text=$(cat issue.txt | tr -d ' \r \n')

# If text is more than 1000 chars, error
if [[ ${#text} -gt 1000 ]]; then
  echo "The text is too long. Please make sure the text is less than 1000 characters."
  exit 1
fi

# OpenAI API parameters
param='{
    "model": "gpt-3.5-turbo",
    "messages": [
        {
            "role": "user",
            "content": "You are a filter. I will send you the following text, and you just need to reply with only the pure links (not change proto) that contain in each line. Do you understand?"
        },
        {
            "role": "assistant",
            "content": "Understand"
        },
        {
            "role": "user",
            "content": "'$text'"
        }
  ]}'

echo "request params: $param"

# Call the OpenAI API to get a completion
response=$(curl -# https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d "$param")

echo "response: $response"

# Parse the response result returned by the API
audio_url=$(echo "$response" | jq -r '.choices[].message.content' | tr -d '"')

# if audio_url is empty or "null" string, exit
if [[ -z $audio_url || $audio_url == "null" ]]; then
  echo "audio_url is empty. Exiting.."
  exit 1 
fi

# write audio links to audios_list.txt
echo "$audio_url" > audios_list.txt
echo "" >> audios_list.txt