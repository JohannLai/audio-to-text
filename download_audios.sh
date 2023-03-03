#!/bin/bash

# summary: Download all audios from a list of links

# read links from file
input="audios_list.txt"

# read links and download audios line by line
while IFS= read -r line
do
    echo "Downloading audio from $line ..."
    you-get $line -o ./audio
done < "$input"
