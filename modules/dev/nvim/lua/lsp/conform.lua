local M = {}

function M.setup()
	local conform = require("conform")

	conform.setup({
		default_format_opts = {
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			lua = { "stylua" },
			nix = { "nixfmt" },
			python = { "black" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			asm = { "asmfmt" },
			vhdl = { "vsg" },
		},

		formatters = {
			vsg = {
				command = "vsg",
				args = { "--fix", "-f", "$FILENAME" },
				stdin = false,
				exit_codes = { 0, 1 },
			},
		},
	})
end

return M
