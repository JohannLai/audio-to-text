#!/bin/bash

# Summary: Setup script to install dependencies on CentOS and Ubuntu and macOS

# echo the what the script is doing
echo "Setting up dependencies ..."
echo "It will take a few minutes to install dependencies."

# Check OS type
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Check if CentOS or Ubuntu
    if [[ -f "/etc/redhat-release" ]]; then
        # Check if dependencies are installed on CentOS
        if ! command -v jq &> /dev/null || ! command -v curl &> /dev/null || ! command -v ffmpeg &> /dev/null || ! command -v you-get &> /dev/null
        then
            # Install dependencies on CentOS
            sudo yum install -y jq curl
            sudo yum install -y epel-release
            sudo yum install -y python3-pip ffmpeg
            sudo pip3 install you-get
            sudo yum install -y whois
        else
            echo "Dependencies are already installed on CentOS."
        fi
    elif [[ -f "/etc/lsb-release" ]]; then
        # Check if dependencies are installed on Ubuntu
        if ! command -v jq &> /dev/null || ! command -v curl &> /dev/null || ! command -v ffmpeg &> /dev/null || ! command -v you-get &> /dev/null
        then
            # Install dependencies on Ubuntu
            sudo apt-get update
            sudo apt-get install -y jq curl python3-pip ffmpeg
            sudo pip3 install you-get
            sudo apt-get install -y whois
        else
            echo "Dependencies are already installed on Ubuntu."
        fi
    else
        echo "Unsupported Linux distribution. Please install dependencies manually."
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Check if dependencies are installed on macOS
    if ! command -v jq &> /dev/null || ! command -v curl &> /dev/null || ! command -v ffmpeg &> /dev/null || ! command -v you-get &> /dev/null
    then
        # Install dependencies on macOS
        brew install jq curl python3 ffmpeg you-get whois
    else
        echo "Dependencies are already installed on macOS."
    fi
else
    echo "Unsupported OS. Please install dependencies manually."
fi

# Check if dependencies are installed successfully
if ! command -v jq &> /dev/null || ! command -v curl &> /dev/null || ! command -v ffmpeg &> /dev/null || ! command -v you-get &> /dev/null || ! command -v whois &> /dev/null
then
    echo "Failed to install dependencies. Please check your system environment."
    exit 1
fi