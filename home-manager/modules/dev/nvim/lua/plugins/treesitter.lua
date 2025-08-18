local ts_install_dir = vim.fn.stdpath("data") .. "/treesitter"

require("nvim-treesitter.configs").setup {
  parser_install_dir = ts_install_dir,
  ensure_installed = { "lua", "python", "nix", "bash" },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
}

