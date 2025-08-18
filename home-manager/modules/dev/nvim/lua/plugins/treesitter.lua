local M = {}

function M.setup()
  local ts_install_dir = vim.fn.stdpath("data") .. "/treesitter"

  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "nix", "bash" },
    parser_install_dir = ts_install_dir,
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = false,
  }
end

return M
