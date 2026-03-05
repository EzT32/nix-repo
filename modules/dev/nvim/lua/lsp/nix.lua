local M = {}

function M.setup()
	require("lsp.shared").setup_server("nil_ls", {
		settings = {
			["nil"] = {
				formatting = {
					command = { "nixfmt" },
				},
			},
		},
	})
end

return M
