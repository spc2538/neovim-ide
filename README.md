# Neovim IDE

## Install neovim

```sh
mkdir -p ~/opt
mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/nerd.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/3270.zip
tar xf ~/.local/share/fonts/nerd.zip -C ~/.local/share/fonts
wget -O ~/opt/nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
tar xf ~/opt/nvim.tar.gz -C ~/opt
echo 'export PATH="$PATH:$HOME/opt/nvim-linux64/bin"' >> ~/.bashrc
source ~/.bashrc
mkdir -p ~/.config/nvim/
git clone https://github.com/spc2538/neovim-ide.git ~/.config/nvim

```

## Post installation steps

```sh
nvim
$ PackerInstall
find ~/ -type d -name 'coc.nvim'
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim
yarn install
yarn add esbuild
yarn build
nvim
$ :CocInstall coc-python


```
