vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = "a"
vim.o.ruler = false
vim.o.breakindent = true
vim.o.linebreak = true
vim.cmd("command! -nargs=0 W w !sudo tee % >/dev/null")
vim.cmd("syntax on")
vim.api.nvim_set_keymap('v', '//', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', {noremap = true})
vim.cmd("filetype on")
vim.o.hidden = true

vim.o.scrolloff = 7
vim.o.clipboard = "unnamedplus"

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- vim.cmd("colorscheme onedark_dark")

vim.g.markdown_fenced_languages = {'html', 'python', 'lua', 'vim', 'typescript', 'javascript', 'sh', 'rust', 'conf', 'c', 'cpp'}

vim.cmd([[
  autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType dart setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
]])
