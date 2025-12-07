local M = {}

function M.setup()
  local shared = require("lsp.shared")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  vim.lsp.config("nil_ls", {
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

  vim.lsp.enable("nil_ls")
end

return M

