rm ~/.bashrc -f
ln -s ~/dotfiles/.bashrc ~

rm ~/.bash_aliases -f
ln -s ~/dotfiles/.bash_aliases ~

rm ~/.gitconfig -f
ln -s ~/dotfiles/.gitconfig ~

rm ~/.vimrc -f
ln -s ~/dotfiles/.vimrc ~

rm ~/.tmux.conf -f
ln -s ~/dotfiles/.tmux.conf ~

rm ~/.zshrc -f
ln -s ~/dotfiles/.zshrc ~

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

