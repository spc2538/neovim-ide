# Neovim IDE

## APT

```sh
sudo apt install xclip
sudo apt install fzf
sudo apt install ripgrep
mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/nerd.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/3270.zip
tar xf ~/.local/share/fonts/nerd.zip -C ~/.local/share/fonts
wget -O ~/opt/nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
tar xf ~/opt/nvim.tar.gz -C ~/opt

echo 'export PATH="$PATH:$HOME/opt/nvim-linux64/bin"' >> ~/.bashrc
source ~/.bashrc

```

```sh
mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/nerd.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/3270.zip
tar xf ~/.local/share/fonts/nerd.zip -C ~/.local/share/fonts
sudo apt install xclip
sudo apt install fzf
wget -O ~/opt/nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
tar xf ~/opt/nvim.tar.gz -C ~/opt

echo 'export PATH="$PATH:$HOME/opt/nvim-linux64/bin"' >> ~/.bashrc
source ~/.bashrc

```

## Config structure

```sh
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/lua/core
mkdir -p ~/.config/nvim/lua/core/plugin_config

touch ~/.config/nvim/init.lua
touch ~/.config/nvim/lua/core/options.lua
touch ~/.config/nvim/lua/core/plugins.lua
touch ~/.config/nvim/lua/core/keymaps.lua

```

```lua
-- nvim ~/.config/nvim/init.lua
require("core.options")
require("core.keymaps")
require("core.plugins")

-- nvim ~/.config/nvim/lua/core/options.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.cmd [[ set noswapfile ]]
vim.wo.number = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- nvim ~/.config/nvim/lua/core/plugins.lua
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "ellisonleao/gruvbox.nvim" }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
```
