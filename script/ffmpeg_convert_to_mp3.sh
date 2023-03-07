#!/bin/bash

# summary: Convert all audio files in a directory to mp3

# Check if mp3 directory exists, if not, create it
if [ ! -d "mp3" ]; then
  mkdir mp3
fi

# Iterate over all mp4 files in audio directory, and convert them to mp3
for audio_file in ./audio/*; do
  filename=$(basename "$audio_file")
  # Check if a mp3 file with the same name already exists in mp3 directory, if so, output a message and skip
  if [ -f "./mp3/${filename%.*}.mp3" ]; then
    echo "File ./mp3/${filename%.*}.mp3 already exists, skipping ..."
    continue
  fi

  filename_without_extension="${filename%.*}"
  output_file="./mp3/${filename_without_extension}.mp3"

  echo "Converting $audio_file to $output_file ..."

  # ffmpeg
  # -i: Specifies input file name;
  # -vn: Only extract audio stream, without audio stream;
  # -acodec libmp3lame: Set audio encoder to libmp3lame;
  # -ar 44100: Set audio sampling rate to 44100 Hz;
  # -ab 192k: Set audio bitrate to 128 kbps;
  # -f mp3: Set output format to MP3.
  # -loglevel error: Only output error messages.

  ffmpeg -i "$audio_file" -loglevel error -vn -acodec libmp3lame -ab 128k -ar 44100 "$output_file" 2>&1
  if [[ "$ffmpeg_output" == *"Invalid data found when processing input"* ]]; then
    # The file cannot be converted to MP3
    echo "The file $input_file cannot be converted to MP3"
  else
    # The file can be converted to MP3
    echo "The file $input_file can be converted to MP3"
  fi

done
