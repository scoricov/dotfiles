DIR=`pwd`

# VIM
mkdir -p ~/.vim/colors
mkdir ~/.vim/bitmaps
mkdir ~/.vim/autoload
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
ln -s ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
ln -s ~/.vim/bundle/vim-colors-solarized/bitmaps/togglebg.png ~/.vim/bitmaps/
ln -s ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim ~/.vim/autoload/
ln -s $DIR/vimrc ~/.vimrc

# ZSH
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/zshenv ~/.zshenv
ln -s $DIR/zshprofile ~/.zshprofile
rm $DIR/oh-my-zsh/themes/agnoster.zsh-theme
ln -s $DIR/oh-my-zsh/themes/agnoster.zsh-theme ~/.oh-my-zsh/themes/

# OTHER
ln -s $DIR/gemrc ~/.gemrc
ln -s $DIR/gitconfig ~/.gitconfig
ln -s $DIR/gitignore_global ~/.gitignore_global
ln -s $DIR/hgignore_global ~/.hgignore_global
ln -s $DIR/module-starter ~/.module-starter
ln -s $DIR/rspec ~/.rspec
ln -s $DIR/tmux.conf ~/.tmux.conf
