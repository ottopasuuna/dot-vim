description="Vim/Neovim config"

link_map=(
    [vim]=$HOME/.vim
    [vimrc]=$HOME/.vimrc
)

__install__() {
    nvim '+PlugInstall' '+qa' && pip3 install neovim || vim '+PlugInstall' '+qa'
    ln -s $HOME/.vim $HOME/.config/nvim
}
