require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'dracula',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
