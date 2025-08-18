local M = {}

function M.setup()
  require('lualine').setup {
    options = {
      theme = 'gruvbox',
      section_separators = '',
      component_separators = '',
    }
  }
end

return M
