#!/bin/bash

# summary: Download all audios from a list of links

source ./proxy/check.sh

# download function
function download() {
    echo "Checking proxy for $1 ..."

    if [[ $(check "$1") == "1" ]]; then
        echo "Using proxy c..."
        session_id="s$RANDOM"
        proxy_url="http://customer-$PROXY_USERNAME-sessid-$session_id:$PROXY_PASSWORD@$PROXY_HOST_C:$PROXY_PORT_C"
        echo "proxy url $proxy_url"
        alias you-get="you-get -x "
    else
        echo "Using proxy ..."
        alias you-get="you-get -x "http://$PROXY_USERNAME:$PROXY_PASSWORD@$PROXY_HOST:$PROXY_PORT""
    fi

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
while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ -n "$line" ]]; then
        # echo "prepare download for $line ..."
        download "$line"
        last_line="$line"
    fi
done <audios_list.txt

# If the last line does not have a blank line, download the audio file of the last line again
if [[ -n "$last_line" ]]; then
    download "$last_line"
fi
