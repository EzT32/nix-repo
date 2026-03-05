local M = {}

function M.setup()
	require("neodev").setup({})
	require("lsp.shared").setup_server("lua_ls")
end

return M
