-- Indentation per filetype
local indent_settings = {
  lua = 2,
  nix = 2,
  python = 4,
}

for ft, size in pairs(indent_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.opt_local.tabstop = size
      vim.opt_local.shiftwidth = size
      vim.opt_local.softtabstop = size
      vim.opt_local.expandtab = true
    end,
  })
end
