local M = {}

function M.setup()
	require("lsp.shared").setup_server("jdtls")
end

return M
