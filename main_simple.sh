#!/bin/bash

# Install packages
sudo apt update && sudo apt -y upgrade
sudo apt install -y git tree htop python-pip python3-pip python3-venv python-virtualenv software-properties-common curl fonts-nanum fonts-nanum-coding

# Set bashrc
cp $HOME/.bashrc  $HOME/.bashrc_old
rm .bashrc
cp ./dotfiles/.bashrc $HOME/.bashrc

# Python env
mkdir -p $HOME/pyenv
