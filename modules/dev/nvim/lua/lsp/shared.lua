local M = {}

local function get_capabilities()
	return require("cmp_nvim_lsp").default_capabilities()
end

M.on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local map = vim.keymap.set
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

M.setup_server = function(name, config)
	vim.lsp.config(
		name,
		vim.tbl_deep_extend("force", {
			on_attach = M.on_attach,
			capabilities = get_capabilities(),
		}, config or {})
	)
	vim.lsp.enable(name)
end

return M
