local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = false,
  }
end

return M
