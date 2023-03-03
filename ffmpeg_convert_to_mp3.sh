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

    # Determine whether the current file can be converted by ffmpeg. If not, skip it
    ffmpeg -i "$audio_file" -vn -acodec libmp3lame -ab 192k -ar 44100 -f mp3 /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "File $audio_file cannot be converted, skipping ..."
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
    # -ab 192k: Set audio bitrate to 192 kbps;
    # -f mp3: Set output format to MP3.

    ffmpeg -i "$audio_file" -vn -acodec libmp3lame -ab 192k -ar 44100 "$output_file"
done
