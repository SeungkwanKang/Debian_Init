#!/bin/bash


# Install packages
sudo apt update && sudo apt -y upgrade
sudo apt install -y git


# Install Korean
sudo apt install -y fonts-nanum fonts-nanum-coding ibus ibus-hangul

gsettings set org.freedesktop.ibus.general preload-engines "['hangul']"
gsettings set org.gnome.desktop.input-sources mru-sources "[('ibus', 'hangul'), ('xkb', 'us')]"
gsettings set org.gnome.desktop.input-sources sources "[('ibus', 'hangul')]"
gsettings set org.freedesktop.ibus.general.hotkey trigger "['Control+space', 'Zenkaku_Hankaku', 'Alt+Kanji', 'Alt+grave', 'Hangul', 'Alt+Release+Alt_R']"

gsettings set org.freedesktop.ibus.panel custom-font 'NanumSquareRound Bold 12'
gsettings set org.freedesktop.ibus.panel use-custom-font true


# Shell color theme
TERMINAL_PATH='/org/gnome/terminal/legacy/profiles:/'
PROFILE_NAME=$(dconf list ${TERMINAL_PATH} | grep ':')
FULL_PATH=${TERMINAL_PATH}${PROFILE_NAME}
dconf write ${FULL_PATH}background-color "'#1d1f21'"
dconf write ${FULL_PATH}foreground-color "'#c5c8c6'"
dconf write ${FULL_PATH}palette "['#282a2e', '#a54242', '#8c9440', '#de935f', '#5f819d', '#85678f', '#5e8d87', '#707880', '#373b41', '#cc6666', '#b5bd68', '#f0c674', '#81a2be', '#b294bb', '#8abeb7', '#c5c8c6']" 
dconf write ${FULL_PATH}use-theme-colors false
unset FULL_PATH
unset TERMINAL_PATH
unset PROFILE_NAME


# Set bashrc
DOTFILES=${HOME}/.dotfiles
mkdir ${DOTFILES}
test -f ${HOME}/.bashrc && { mv "${HOME}/.bashrc" "${DOTFILES}/.bashrc"; ln -s  "${DOTFILES}/.bashrc" "${HOME}/.bashrc" }
unset DOTFILES

# Solve mobile tethering disconnection error
sudo systemctl disable ModemManager.service

# Keybinds
# name0=""

