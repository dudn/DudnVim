#!/bin/sh

#=============================================================================
# Reset
Color_off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'
Blue='\033[0;34m'
Green='\033[0;32m'

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
    msg "${Blue}==>${Color_off} ${1}${2}"
}

error() {
    msg "${Red}[✘]${Color_off} ${1}${2}"
}

apt_install () {
    sudo apt install $1
    info "Install '$1' for you"
}

install_apts () {
    apt_install 'fcitx-googlepinyin'
    apt_install 'exuberant-ctags'
}

install_apts
