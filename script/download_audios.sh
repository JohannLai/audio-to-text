#!/bin/bash

# summary: Download all audios from a list of links

# download function
function download() {
    echo "Downloading audio from $1 ..."
    url=$1

    # Get video info
    info=$(you-get --json "$url" --debug)

    # 解析 JSON 数据，找到 size 最小的 itag
    min_size=$(echo $info | jq -r '.streams[].size | select(. != null)' | sort -n | head -n 1)
    min_itag=$(echo $info | jq -r ".streams[] | select(.size == $min_size) | .itag")
    echo "Found min_size: $min_size"
    echo "Found min_itag: $min_itag"

    # Download video or $min_itag === "null"
    if [[ -n "$min_itag" ]] && [[ "$min_itag" != "null" ]]; then
        you-get --itag "$min_itag" "$url" -o ./audio --debug
    else
        you-get "$url" -o ./audio --debug
    fi
}

echo "Downloading audios from audios_list.txt ..."
cat audios_list.txt

# read links and download audios line by line
while IFS=$' \t\n\r' read -r line || [[ -n "$line" ]]; do
  if [[ -n "$line" ]]; then
    download "$line"
    last_line="$line"
  fi
done < audios_list.txt

# If the last line does not have a blank line, download the audio file of the last line again
if [[ -n "$last_line" ]]; then
    download "$last_line"
fi
