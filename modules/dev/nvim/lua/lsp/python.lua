local M = {}

function M.setup()
	require("lsp.shared").setup_server("pyright")
end

return M
