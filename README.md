dotfiles
========

My setup for different command-line tools.

```
git clone --recursive https://github.com/dotphiles/dotzsh.git ~/.zsh
ln -s "$HOME/dotfiles/zshenv" "$HOME/.zshenv"
ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
touch "$HOME/.hushlogin"

ln -s "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
```
