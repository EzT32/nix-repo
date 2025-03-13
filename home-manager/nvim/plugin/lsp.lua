local on_attach = function(client, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true })
	end

	-- Keybindings for other LSP actions
	bufmap("<leader>r", vim.lsp.buf.rename)
	bufmap("<leader>a", vim.lsp.buf.code_action)

	bufmap("gd", vim.lsp.buf.definition)
	bufmap("gD", vim.lsp.buf.declaration)
	bufmap("gI", vim.lsp.buf.implementation)
	bufmap("<leader>D", vim.lsp.buf.type_definition)

	bufmap("gr", require("telescope.builtin").lsp_references)
	bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols)
	bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)
	bufmap("K", vim.lsp.buf.hover)

	-- If LSP supports formatting, bind the format command to <leader>f

	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "null-ls" -- Ensures it uses null-ls
			end,
		})
	end, { noremap = true, silent = true })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Lua LSP setup
require("lspconfig").lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

-- Python LSP (Pyright)
require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "pyright-langserver", "--stdio" }, -- Correct command for Pyright
})

-- Nix LSP (optional)
require("lspconfig").nil_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "nil" },
	settings = {
		["nil"] = {
			formatting = {
				command = { "alejandra" },
			},
		},
	},
})

-- C LSP (optional)
require("lspconfig").ccls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "ccls" },
})

-- Java LSP
require("lspconfig").jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "jdtls" },
})
