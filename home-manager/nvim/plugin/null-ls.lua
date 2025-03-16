local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- Formatters
		null_ls.builtins.formatting.alejandra, -- Nix
		null_ls.builtins.formatting.stylua, -- Lua
		null_ls.builtins.formatting.black, -- Python
		null_ls.builtins.formatting.isort, -- Python imports
		null_ls.builtins.formatting.clang_format.with({ -- C/C++/Java
			extra_args = { "--style={BasedOnStyle: Google, IndentWidth: 4}" },
			filetypes = { "java" },
		}),
	}
})

-- Global keybinding for formatting (works even if LSP is down)
vim.keymap.set("n", "<leader>f", function()
	-- First try formatting with LSP if the server supports it
	if vim.lsp.buf.server_ready() then
		vim.lsp.buf.format({ async = true })
	else
		-- If LSP doesn't support formatting, fall back to null-ls
		vim.cmd("echo 'LSP not running, using null-ls'")
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end
end, { noremap = true, silent = true })

-- Auto-format on save using null-ls
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end,
})
