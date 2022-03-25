#!/bin/bash

# Author: Lucas Moraes da Silva
# Creation date: 24/03/2022
# E-mail: lucasmoraessilva01@gmail.com
# Description: This script performs the minimum configuration required for a working environment on an Ubuntu distribution.
# Use example: sudo ./main.sh

# Imports
# ---------------------------------

# Variables
# ---------------------------------

# Functions
# ---------------------------------

function main(){
    ./docker-install.sh
    ./git-install.sh
    ./git-flow-install.sh
    ./python-install.sh
    ./terminator-install.sh
    ./vscode-install.sh
}

# Execution
# ---------------------------------

main