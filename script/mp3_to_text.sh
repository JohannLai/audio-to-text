#!/bin/bash

# summary: Convert all MP3 files in a directory to text using OpenAI's API

# PROMPT
PROMPT="Include punctuation, and line breaks."

# Model
MODEL="whisper-1"

# # Language
# LANGUAGE="zh"

# Define input and output directories
INPUT_DIR="./mp3"
OUTPUT_DIR="./text"

# If not API key is defined, exit
if [[ -z $OPENAI_API_KEY ]]; then
  echo "API key is not defined. Please declare it in your .env file. Exiting.." && exit 1
fi

# If the output directory does not exist, create it.
if [ ! -d $OUTPUT_DIR ]; then
  mkdir -p $OUTPUT_DIR
fi

# Loop through all MP3 files in the input directory
for file in $INPUT_DIR/*.mp3; do
  echo "Converting $file ..."

  # Extract the filename without extension from the file name
  filename=$(basename "$file" .mp3)
  # Define the output file path
  output_file="$OUTPUT_DIR/$filename.txt"

  # If the file is exists in the output directory, skip it
  if [ -f "$output_file" ]; then
    echo "[mp3_to_text.sh]File $output_file already exists, skipping ..."
    continue
  fi

  # concat file name to PROMPT
  # PROMPT="$PROMPT The audio is about $file."

  # Call the OpenAI API to transcribe the audio file
  response=$(curl -# https://api.openai.com/v1/audio/transcriptions -X POST -H "Authorization: Bearer $OPENAI_API_KEY" -H 'Content-Type: multipart/form-data' -F file=@"$file" -F model=$MODEL -F prompt="$PROMPT")

  echo $response

  # Extract the transcription from the response
  transcription=$(echo "$response" | jq -r ".text")

  # Output the transcription to the output file
  echo "$filename: $transcription" >>"$output_file"

  # Output the name of the converted file
  echo "Converted $file to $output_file"
done
