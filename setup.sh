DIR=`pwd`

echo "Setting up dotfiles in $HOME from $DIR"

# VIM ##########

rm -rf $HOME/.vim
mkdir -p $HOME/.vim/colors
mkdir $HOME/.vim/bitmaps
mkdir $HOME/.vim/autoload
mkdir $HOME/.vim/bundle
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/swap
mkdir $HOME/.vim/undo
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/altercation/vim-colors-solarized.git $HOME/.vim/bundle/vim-colors-solarized
ln -s $HOME/.vim/bundle/vim-colors-solarized/colors/solarized.vim $HOME/.vim/colors
ln -s $HOME/.vim/bundle/vim-colors-solarized/bitmaps/togglebg.png $HOME/.vim/bitmaps
ln -s $HOME/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim $HOME/.vim/autoload
rm $HOME/vimrc
ln -s $DIR/vimrc $HOME/.vimrc
vim +PluginInstall +qall

# ZSH ##########

rm -rf $HOME/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

rm $HOME/.zshrc
ln -s $DIR/zshrc $HOME/.zshrc

rm $HOME/.zshenv
ln -s $DIR/zshenv $HOME/.zshenv

rm $HOME/.zshprofile
ln -s $DIR/zshprofile $HOME/.zshprofile

rm $HOME/.oh-my-zsh/themes/agnoster.zsh-theme
ln -s $DIR/oh-my-zsh/themes/agnoster.zsh-theme $HOME/.oh-my-zsh/themes/agnoster.zsh-theme

# OTHER ##########

rm $HOME/.gemrc
ln -s $DIR/gemrc $HOME/.gemrc

rm $HOME/.gitconfig
ln -s $DIR/gitconfig $HOME/.gitconfig

rm $HOME/.gitignore_global
ln -s $DIR/gitignore_global $HOME/.gitignore_global

rm $HOME/.hgignore_global
ln -s $DIR/hgignore_global $HOME/.hgignore_global

rm -rf $HOME/.module-starter
ln -s $DIR/module-starter $HOME/.module-starter

rm $HOME/.rspec
ln -s $DIR/rspec $HOME/.rspec

rm $HOME/.tmux.conf
ln -s $DIR/tmux.conf $HOME/.tmux.conf

mkdir $HOME/.iterm
rm $HOME/.iterm/com.googlecode.iterm2.plist
ln -s $DIR/com.googlecode.iterm2.plist $HOME/.iterm/com.googlecode.iterm2.plist

