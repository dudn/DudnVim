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
	sudo apt install $1 --assume-yes
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

    # if [ -f "$HOME/.ideavimrc" ]&&[ ! -h "$HOME/.ideavimrc" ]; then
    #     mv "$HOME/.ideavimrc" "$HOME/.ideavimrc_back"
    #     success "Backup $HOME/.ideavimrc to $HOME/.ideavimrc_back"
    # elif [ -h "$HOME/.ideavimrc" ]; then
    #     rm "$HOME/.ideavimrc"
    # fi
}

check_cmds () {
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
    sudo ln -s /usr/local/share/vim /usr/share/vim
    ln -s "$HOME/.DudnVim/vimrc" "$HOME/.vimrc"
    # ln -s "$HOME/.DudnVim/ideavimrc" "$HOME/.ideavimrc"
    # ln -s "$HOME/.DudnVim/tern-config" "$HOME/.tern-config"
    success "Installed DudnVim"
}


installer () {
    mkdir ~/tmp
    back_up
    check_cmds
    install_plugin_manager
    install_vim
    vim -c PlugInstall
}


install_tool () {
    sudo apt install $1 --assume-yes
    info "Install '$1' for you"
}


install_tools () {
    install_tool 'fcitx-googlepinyin'
    install_tool 'exuberant-ctags'
    install_tool 'ksnapshot'
    install_tool 'astyle'
    install_tool 'browser-sync'
    install_tool 'openjdk-8-jdk'
    install_tool 'openjdk-8-source'
    # git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; ~/.fzf/install --all
}

install_tools
installer
