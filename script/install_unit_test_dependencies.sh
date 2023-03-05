#!/bin/bash

# Check if a command exists
# Arguments: command name
# Return: 0-exists, 1-not exists
function check_command_exists() {
    if command -v $1 &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Install Bats
if ! check_command_exists bats; then
    echo "Installing Bats"
    git clone https://github.com/bats-core/bats-core.git
    cd bats-core
    sudo ./install.sh /usr/local
    cd ..
    rm -rf bats-core
fi


echo "Installation completed"