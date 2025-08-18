local lspconfig = require("lspconfig")
local shared = require("lsp.shared")

lspconfig.nil_ls.setup({
  on_attach = shared.on_attach,
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
})

