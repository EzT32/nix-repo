local M = {}

function M.setup()
  local null_ls = require("null-ls")
  local shared = require('lsp.shared')

  -- local vsg_builtin = null_ls.builtins.formatting.vsg or null_ls.helpers.make_builtin({
  --   method = null_ls.methods.FORMATTING,
  --   filetypes = { "vhdl", "vhd" },
  --   generator = null_ls.formatter({
  --     command = "vsg",
  --     args = { "-f", "$FILENAME", "--fix" },
  --     to_stdin = false,
  --   }),
  -- })

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.asmfmt,
      --vsg_builtin
    },
    on_attach = shared.on_attach,
  })
end

return M
