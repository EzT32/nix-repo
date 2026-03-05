local M = {}

function M.setup()
	require("lsp.shared").setup_server("vhdl_ls")
end

return M
