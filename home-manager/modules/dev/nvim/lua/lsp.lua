local lspconfig = require("lspconfig")

-- Lua LSP (use its built-in formatter)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      format = { enable = true },
    },
  },
})

-- Nix LSP (no formatter built-in, use null-ls/none-ls)
lspconfig.nil_ls.setup({})
