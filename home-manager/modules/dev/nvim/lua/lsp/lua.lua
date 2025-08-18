local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local shared = require("lsp.shared")

  require("neodev").setup({})

  lspconfig.lua_ls.setup({
    on_attach = shared.on_attach,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
      },
    },
  })
end

return M
