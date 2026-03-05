local M = {}

function M.setup()
	require("lsp.shared").setup_server("asm_lsp", {
		cmd = { "asm_lsp" },
		filetypes = { "asm", "s" },
	})
end

return M
