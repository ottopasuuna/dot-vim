description="Vim/Neovim config"

link_map=(
    [vim]=$HOME/.vim
    [vimrc]=$HOME/.vimrc
)

__install__() {
    vim '+PlugInstall' '+qa'
    ln -s $HOME/.vim $HOME/.config/nvim
}
