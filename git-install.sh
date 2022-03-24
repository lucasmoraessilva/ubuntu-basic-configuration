#!/bin/bash

# Author: Lucas Moraes da Silva
# Creation date: 24/03/2022
# E-mail: lucasmoraessilva01@gmail.com
# Description: This script uninstall old versions and install the latest version of Git.
# Use example: sudo ./git-install.sh

# Imports
# ---------------------------------

# Variables
# ---------------------------------

# Functions
# ---------------------------------

function main(){
    desinstalarVersoesAntigasDoGit
    preConfigurarDependenciasDoGit
    instalarVersaoMaisRecenteDoGit
}

function desinstalarVersoesAntigasDoGit(){
    # Removing installed versions
    apt update -y
    apt remove git* -y
}

function preConfigurarDependenciasDoGit(){
    # Installing helper programs
    apt update -y
    apt install software-properties-common -y

    # Adding PPA for Git installation
    add-apt-repository ppa:git-core/ppa
    apt update -y
}

function instalarVersaoMaisRecenteDoGit(){
    #
    apt update -y
    apt install git -y
}

# Execution
# ---------------------------------

main