local M = {}

function M.setup()
	require("lsp.shared").setup_server("clangd")
end

return M
