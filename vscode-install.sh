#!/bin/bash

# Author: Lucas Moraes da Silva
# Creation date: 24/03/2022
# E-mail: lucasmoraessilva01@gmail.com
# Description: This script uninstall old versions and install VS Code latest version.
# Use example: sudo ./vscode-install.sh

# Imports
# ---------------------------------

# Variables
# ---------------------------------

MICROSOFT_PACKAGE_URL="https://packages.microsoft.com"
GPG_KEY_DIRECTORY="/etc/apt/trusted.gpg.d"
GPG_PACKAGE="packages.microsoft.gpg"

# Functions
# ---------------------------------

function main(){
    desinstalarVersoesAntigasDoVSCode
    preConfigurarDependenciasDoVSCode
    instalarVersaoMaisRecenteDoVSCode
}

function desinstalarVersoesAntigasDoVSCode(){
    # Removing installed versions
    apt update -y
    apt remove code code-insiders -y
}

function preConfigurarDependenciasDoVSCode(){
    # Installing helper programs
    apt update -y
    apt install wget gpg -y

    # Getting GPG key
    wget -qO- ${MICROSOFT_PACKAGE_URL}/keys/microsoft.asc | gpg --dearmor > $GPG_PACKAGE

    # Copy GPG key to selected directory
    install -o root -g root -m 644 $GPG_PACKAGE ${GPG_KEY_DIRECTORY}/

    # Insert Microsoft repository in the given path
    sh -c `echo "deb [arch=amd64,arm64,armhf signed-by=$GPG_KEY_DIRECTORY/$GPG_PACKAGE] $MICROSOFT_PACKAGE_URL/repos/code stable main" > /etc/apt/sources.list.d/vscode.list`

    # Remove GPG key
    rm -f $GPG_PACKAGE
}

function instalarVersaoMaisRecenteDoVSCode(){
    # Install VS Code
    apt update -y
    apt install code -y
}

# Execution
# ---------------------------------

main