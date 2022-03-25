#!/bin/bash

# Author: Lucas Moraes da Silva
# Creation date: 24/03/2022
# E-mail: lucasmoraessilva01@gmail.com
# Description: This script uninstall old versions and install the latest version of Terminator.
# Use example: sudo ./terminator-install.sh

# Imports
# ---------------------------------

# Variables
# ---------------------------------

# Functions
# ---------------------------------

function main(){
    removerVersoesAntigasDoTerminator
    instalarTerminator
}

function removerVersoesAntigasDoTerminator(){
    # Remove old versions of Terminator
    apt update -y
    apt remove --auto-remove -y terminator
}

function instalarTerminator(){
    # Install Terminator
    apt update -y
    apt install -y terminator
}

# Execution
# ----------------------------------------------------------------------------------------------------------------

main