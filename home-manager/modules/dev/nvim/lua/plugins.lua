local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Only Nix formatter here
    null_ls.builtins.formatting.alejandra,
    null_ls.builtins.diagnostics.statix,
  },
})
