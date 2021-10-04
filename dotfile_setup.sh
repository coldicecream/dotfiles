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



sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"


git clone https://github.com/powerline/fonts.git ~/fonts
cd ~/fonts
./install.sh

git clone https://github.com/gibbling666/dircolors.git ~/.dircolors

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

