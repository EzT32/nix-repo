local M = {}

function M.setup()
  local shared = require('lsp.shared')
  local cmp_nvim_lsp = require('cmp_nvim_lsp')
  local capabilities = cmp_nvim_lsp.default_capabilities()

  vim.lsp.config("pyright", {
    on_attach = shared.on_attach,
    capabilities = capabilities,
  })

  vim.lsp.enable("pyright")

  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.black,
    }
  })
end

return M
