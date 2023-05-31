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
  -- use 'https://github.com/neoclide/coc.nvim'
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-lualine/lualine.nvim',
  }
  use 'nvim-tree/nvim-web-devicons'
  use 'wbthomason/packer.nvim'
  use "olimorris/onedarkpro.nvim"
  use { "ellisonleao/gruvbox.nvim" }
  use 'https://github.com/lewis6991/gitsigns.nvim'
  use 'https://github.com/jiangmiao/auto-pairs'
  use 'https://github.com/preservim/nerdtree'
  use 'https://github.com/tpope/vim-commentary'
  use 'http://github.com/tpope/vim-surround'
  use 'https://github.com/tc50cal/vim-terminal'
  use 'https://github.com/preservim/tagbar'
  use 'romgrk/barbar.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "williamboman/mason.nvim"
  use "neovim/nvim-lspconfig"
  use "williamboman/mason-lspconfig.nvim"
  use "glepnir/lspsaga.nvim"
  -- completion vscode-like
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  if packer_bootstrap then
    require('packer').sync()
  end
end)
