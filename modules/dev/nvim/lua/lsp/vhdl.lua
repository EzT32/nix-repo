local M = {}

function M.setup()
  local shared = require("lsp.shared")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  vim.lsp.config("vhdl_ls", {
    cmd = { "vhdl_ls" },
    -- If it's not attaching, it's likely failing the root directory detection.
    -- We add common project markers here.
    root_markers = { "vhdl_ls.toml", ".git", "Makefile" },
    on_attach = shared.on_attach,
    capabilities = capabilities,
    -- Ensure filetypes are explicitly mapped
    filetypes = { "vhdl" },
  })

  vim.lsp.enable("vhdl_ls")
end

return M
