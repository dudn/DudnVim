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

need_cmd () {
    if ! hash "$1" &>/dev/null; then
        error "Need '$1' (command not fount)"
	sudo apt install $1
	info "Install '$1' for you"
    else
        info "Checked '$1'"
    fi
}

back_up () {
    if [ -f "$HOME/.vimrc" ]&&[ ! -h "$HOME/.vimrc" ]; then
        mv "$HOME/.vimrc" "$HOME/.vimrc_back"
        success "Backup $HOME/.vimrc to $HOME/.vimrc_back"
    elif [ -h "$HOME/.vimrc" ]; then
        rm "$HOME/.vimrc"
    fi

    if [ -f "$HOME/.ideavimrc" ]&&[ ! -h "$HOME/.ideavimrc" ]; then
        mv "$HOME/.ideavimrc" "$HOME/.ideavimrc_back"
        success "Backup $HOME/.ideavimrc to $HOME/.ideavimrc_back"
    elif [ -h "$HOME/.ideavimrc" ]; then
        rm "$HOME/.ideavimrc"
    fi
}

check_cmds () {
    need_cmd 'vim'
    need_cmd 'curl'
    need_cmd 'npm'
    need_cmd 'nodejs'
    need_cmd 'cmake'

}

install_plugin_manager () {
    if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
        info "Install plug.vim"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        success "plug.vim installation done"
    fi
}

install_vim () {
    sudo ln -s "/usr/bin/nodejs" "/usr/bin/node"
    ln -s "$HOME/.DudnVim/vimrc" "$HOME/.vimrc"
    ln -s "$HOME/.DudnVim/ideavimrc" "$HOME/.ideavimrc"
    ln -s "$HOME/.DudnVim/tern-config" "$HOME/.tern-config"
    success "Installed DudnVim"
}


installer () {
    back_up
    check_cmds
    install_plugin_manager
    install_vim
    vim -c PlugInstall
}


install_tool () {
    sudo apt install $1
    info "Install '$1' for you"
}


install_tools () {
    apt_install 'fcitx-googlepinyin'
    apt_install 'exuberant-ctags'
    apt_install 'ksnapshot'
    apt_install 'browser-sync'
}

install_tools
installer
