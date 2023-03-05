#!/bin/bash

# Get input parameter
url=$1

# Determine whether the link is a bilibili vidio link
if [[ $url == "https://www.bilibili.com/video/"* && ($url == *"/BV"* || $url == *"/av"*) ]]; then
    exit 0 # Return 0 if it is a bilibili vidio link
else
    exit 1 # Return 1 if it is not a bilibili vidio link
fi