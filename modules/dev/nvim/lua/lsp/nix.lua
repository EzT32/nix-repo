local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local shared = require("lsp.shared")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  
  local capabilities = cmp_nvim_lsp.default_capabilities()

  lspconfig.nil_ls.setup({
    on_attach = shared.on_attach,
    capabilities = capabilities,
    settings = {
      ["nil"] = {
        formatting = {
          command = { "nixfmt" },
        },
      },
    },
  })
end

return M
