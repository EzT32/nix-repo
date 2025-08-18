vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 1000
vim.o.mouse = 'a';

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true;
vim.o.smartindent = true;
vim.o.autoindent = true;

vim.o.termguicolors = true


vim.diagnostic.config({
  float = {
    border = "rounded",
    wrap = true,
  },
  severity_sort = true,
  virtual_text = false,
})
