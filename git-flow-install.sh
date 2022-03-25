#!/bin/bash

# Author: Lucas Moraes da Silva
# Creation date: 24/03/2022
# E-mail: lucasmoraessilva01@gmail.com
# Description: This script uninstall old versions and install the latest version of GitFlow.
# Use example: sudo ./git-flow-install.sh

# Imports
# ---------------------------------

# Variables
# ---------------------------------

# Functions
# ---------------------------------

function main(){
    removerVersoesAntigasDoGitFlow
    instalarGitFlow
}

function removerVersoesAntigasDoGitFlow(){
    # Remove old versions of GitFlow
    apt update
    apt remove --auto-remove -y git-flow
}

function instalarGitFlow(){
    # Install GitFlow
    apt update -y
    apt install -y git-flow
}

# Execution
# ----------------------------------------------------------------------------------------------------------------

main