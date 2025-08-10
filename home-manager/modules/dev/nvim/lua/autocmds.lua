-- Per-language indentation settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})


-- Auto format on save (filter only for nix)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.nix" },
  callback = function()
    vim.lsp.buf.format({
      async = false,
      filter = function(client)
        return client.name == "null-ls"
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format({ async = false }) -- uses lua_ls directly
  end,
})
