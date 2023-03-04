#!/bin/bash


# Cat the comment.txt file and curl it to the OpenAI API
text=$(cat comment.txt | tr -d ' \r \s \n')

# If text is more than 500 chars, error
if [[ ${#text} -gt 500 ]]; then
  echo "The text is too long. Please make sure the text is less than 500 characters."
  exit 1
fi

# OpenAI API parameters
param='{
    "model": "gpt-3.5-turbo",
    "messages": [
        {
            "role": "user",
            "content": "'$text'"
        }
  ]}'

# Call the OpenAI API to get a completion
response=$(curl -# https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d "$param")

echo $response

# Parse the response result returned by the API
result=$(echo "$response" | jq -r '.choices[].message.content' | tr -d '"')

echo "$result" >> comment_result.txt
echo "" >> comment_result.txt
