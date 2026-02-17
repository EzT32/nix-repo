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
end

return M
