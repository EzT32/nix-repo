local M = {}

function M.setup()
  local shared = require("lsp.shared")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local capabilities = cmp_nvim_lsp.default_capabilities()

  require("neodev").setup({})

  vim.lsp.config("lua_ls", {
    on_attach = shared.on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
      },
    },
  })

  vim.lsp.enable("lua_ls")
end

return M
