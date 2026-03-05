local M = {}

function M.setup()
  local null_ls = require("null-ls")
  local helpers = require("null-ls.helpers")
  local shared = require('lsp.shared')

  local vsg_formatter = helpers.make_builtin({
    name = "vsg",
    meta = { url = "", description = "VHDL Style Guide formatter" },
    method = null_ls.methods.FORMATTING,
    filetypes = { "vhdl" },
    generator_opts = {
      command = "vsg",
      args = { "--stdin", "--fix" },
      to_stdin = true,
      from_stdout = true,
      check_exit_code = function(code)
        return code <= 1
      end,
    },
    factory = helpers.formatter_factory,
  })

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.asmfmt,
      vsg_formatter,
    },
    on_attach = shared.on_attach,
  })
end

return M
