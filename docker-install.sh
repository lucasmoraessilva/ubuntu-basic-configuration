#!/bin/bash

# Author: Lucas Moraes da Silva
# Creation date: 24/03/2022
# E-mail: lucasmoraessilva01@gmail.com
# Description: This script uninstall old versions and install the latest version of Docker.
# Use example: sudo ./docker-install.sh

# Imports
# ---------------------------------

# Variables
# ---------------------------------
DOCKER_DOWNLOAD_URL="https://download.docker.com/linux/ubuntu"
GPG_KEY_DIRECTORY="/usr/share/keyrings/docker-archive-keyring.gpg"

# Functions
# ---------------------------------

function main(){
    desinstalarVersoesAntigasDoDocker
    preConfigurarDependenciasDoDocker
    instalarVersaoMaisRecenteDoDocker
}

function desinstalarVersoesAntigasDoDocker(){
    # Removing installed versions
    apt update -y
    apt remove docker docker-engine docker.io containerd runc -y
}

function preConfigurarDependenciasDoDocker(){
    # Installing helper packages
    apt update -y
    apt install ca-certificates curl gnupg lsb-release -y

    # Adding the official Docker GPG key
    curl -fsSL ${DOCKER_DOWNLOAD_URL}/gpg | gpg --dearmor -o $GPG_KEY_DIRECTORY

    # Configuring the Docker stable repository
    echo "deb [arch=$(dpkg --print-architecture) signed-by=$GPG_KEY_DIRECTORY] $DOCKER_DOWNLOAD_URL $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
}

function instalarVersaoMaisRecenteDoDocker(){
    # install Docker latest version
    apt update -y
    apt install docker-ce docker-ce-cli containerd.io -y
}

# Execution
# ---------------------------------

main