#!/bin/bash

# Author: Lucas Moraes da Silva
# Creation date: 24/03/2022
# E-mail: lucasmoraessilva01@gmail.com
# Description: This script uninstall old versions and install the latest version of Python.
# Use example: sudo ./python-install.sh

# Imports
# ---------------------------------

# Variables
# ---------------------------------

# Functions
# ---------------------------------

function main(){
    removerVersoesAntigasDoPython
    preConfigurarDependenciasDoPython
    instalarPython
}

function removerVersoesAntigasDoPython(){
    # Remove old versions of Python
    apt remove --auto-remove -y python3*
    apt purge --auto-remove -y python3*
}

function preConfigurarDependenciasDoPython(){
    # Installing helper programs
    apt update
    apt install -y software-properties-common
    
    # Adding PPA for Python installation
    add-apt-repository -y ppa:deadsnakes/ppa
    apt update
}

function instalarPython(){
    # Install Python version 3.10
    apt update -y
    apt install -y python3.10
}

# Execution
# ----------------------------------------------------------------------------------------------------------------

main