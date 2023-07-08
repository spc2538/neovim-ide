local api = vim.api

api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true })
api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true })
api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true })
api.nvim_set_keymap('n', '<C-PageUp>', ':bp<CR>', { noremap = true })
api.nvim_set_keymap('n', '<C-PageDown>', ':bn<CR>', { noremap = true })

api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? coc#_select_confirm() : "<Tab>"', { expr = true })

