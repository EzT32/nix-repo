local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
  -- Lua files: format using LSP if supported
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
    })
  end
end

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      format = { enable = true },
    },
  },
})


lspconfig.nil_ls.setup({
  on_attach = on_attach,
  settings = {
    ["nil"] = {
      formatting = {
        command = { "nixfmt" },
      },
    },
  },
})


