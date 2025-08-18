local lspconfig = require("lspconfig")
local shared = require("lsp.shared")

lspconfig.lua_ls.setup({
  on_attach = shared.on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      format = { enable = true },
    },
  },
})

