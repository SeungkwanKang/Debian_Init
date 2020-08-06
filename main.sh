#!/bin/bash


# Install packages
sudo apt update && sudo apt -y upgrade
sudo apt install -y git tree texlive-full python-pip python3-venv python-virtualenv

# Solve mobile tethering disconnection error
sudo systemctl disable ModemManager.service

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

# Pastel Theme
#dconf write ${FULL_PATH}background-color "'#1d1f21'"
#dconf write ${FULL_PATH}foreground-color "'#c5c8c6'"
# dconf write ${FULL_PATH}palette "['#282a2e', '#a54242', '#8c9440', '#de935f', '#5f819d', '#85678f', '#5e8d87', '#707880', '#373b41', '#cc6666', '#b5bd68', '#f0c674', '#81a2be', '#b294bb', '#8abeb7', '#c5c8c6']" 

# Gogh Palette
#dconf write ${FULL_PATH}background-color "'#1d1f21'"
#dconf write ${FULL_PATH}foreground-color "'#c5c8c6'"
#dconf write ${FULL_PATH}palette "['#1F2229', '#D41919', '#5EBDAB', '#FEA44C', '#367bf0', '#BF2E5D', '#49AEE6', '#E6E6E6', '#000000', '#EC0101', '#47D4B9', '#FF8A18', '#277FFF', '#D71655', '#05A1F7', '#FFFFFF']" 

# My Theme
dconf write ${FULL_PATH}background-color "'#1D1F21'"
dconf write ${FULL_PATH}foreground-color "'#FBF9F9'"
dconf write ${FULL_PATH}palette "['#25272C', '#DB2D20', '#0EC53A', '#FDED02', '#01A0E4', '#A16A94', '#2EE6D8', '#A5A2A2', '#4A453D', '#E47D7F', '#37D67B', '#E7E277', '#65CAF5', '#B294BB', '#B5F4EF', '#FBF9F9']"

dconf write ${FULL_PATH}use-theme-colors false
unset FULL_PATH
unset TERMINAL_PATH
unset PROFILE_NAME


# Gedit settings
FULL_PATH='/org/gnome/gedit/preferences/'
dconf write ${FULL_PATH}auto-indent true
dconf write ${FULL_PATH}bracket-matching true
dconf write ${FULL_PATH}display-line-numbers true
dconf write ${FULL_PATH}display-overview-map true
dconf write ${FULL_PATH}display-right-margin true
dconf write ${FULL_PATH}highlight-current-line true
dconf write ${FULL_PATH}insert-spaces true
dconf write ${FULL_PATH}scheme "'oblivion'"
dconf write ${FULL_PATH}tab-size 4
dconf write ${FULL_PATH}indent true
unset FULL_PATH


# Nautilus settings
# Gedit settings
FULL_PATH='/org/gnome/nautilus/'
dconf write ${FULL_PATH}list-view/default-visible-columns "['name', 'size', 'type', 'date_modified_with_time']"
dconf write ${FULL_PATH}list-view/use-full-path true
dconf write ${FULL_PATH}preferences/default-folder-viewer 'list-view'
dconf write ${FULL_PATH}preferences/show-creat-link true
dconf write ${FULL_PATH}preferences/show-hidden-files true
unset FULL_PATH


# Set bashrc
DOTFILES=${HOME}/.dotfiles
test -d ${DOTFILES} || mkdir ${DOTFILES}
test -f ${HOME}/.bashrc && sudo rm -f "${HOME}/.bashrc"
sudo cp "./dotfiles/bashrc" "${DOTFILES}/.bashrc"; sudo ln -sf "${DOTFILES}/.bashrc" "${HOME}/.bashrc";
unset DOTFILES

sudo sh -c 'test -f "/root/.bashrc" && { sudo mv "/root/.bashrc" "/root/.bashrc_old"; }'
sudo sh -c 'cp "dotfiles/bashrc" "/root/.bashrc"'


# Keybinds
# name0=""


# Github settings
git config --global credential.helper store
git pull


# Python env
mkdir $HOME/.pyenv
python3 -m venv $HOME/.pyenv/py3
python2 -m venv $HOME/.pyenv/py2

