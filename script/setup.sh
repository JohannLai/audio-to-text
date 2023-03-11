#!/bin/bash

# summary: Setup script to install dependencies on CentOS and Ubuntu and macOS

# 检查下 audios_list.txt 文件是否存在，内部是否有内容
if [ ! -f audios_list.txt ]; then
  echo "audios_list.txt does not exist. Please create it and add links to audios."
  exit 1
fi

if [ ! -s audios_list.txt ]; then
  echo "audios_list.txt is empty. Please add links to audios."
  exit 1
fi

# Check if OPENAI_API_KEY environment variable is set
if [[ -z "$OPENAI_API_KEY" ]]; then
  # Check if .env file exists
  if [[ -f ".env" ]]; then
    # Load environment variables from .env file
    source .env

    # double check if OPENAI_API_KEY environment variable is set
    if [[ -z "$OPENAI_API_KEY" ]]; then
      echo "OPENAI_API_KEY environment variable is not set in .env file"
      exit 1
    fi
  else
    echo "OPENAI_API_KEY environment variable is not set and .env file does not exist"
    exit 1
  fi
fi

# Continue with the rest of the script
echo "OPENAI_API_KEY environment variable is set"

# Install dependencies
make install
