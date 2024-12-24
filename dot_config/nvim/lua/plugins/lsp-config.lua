-- To add a lsp, first add to ensure install array, and add the lspconfig to the nvim-lspconfig below
return {
	-- installs the language servers
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	-- allows us to install servers by adding them to ensure install array
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					-- "gopls",
					"ts_ls",
					"clangd",
					"cssls",
					"bashls",
					"html",
					"pyright",
					-- "pylsp",
				},
			})
		end,
	},
	-- hooks up neovim to the language server
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- will install go later :)
			-- lspconfig.gopls.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.ts_ls.setup({

				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				cmd = { "clangd", "--query-driver=/usr/bin/g++", "--fallback-style=webkit" }, -- the querydriver is to check c++ header files, the ==fallback-style is for having indents to 4 spaces
				-- need to add a .clangd file in root of project with -> CompileFlags: Compiler: g++
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- lspconfig.basedpyright.setup({
			-- 	capabilities = capabilities,
			-- })

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			-- lspconfig.pylsp.setup({
			-- 	capabilities = capabilities,
			-- })

			local lsp = vim.lsp
			lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, {})
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, {})
			vim.keymap.set("n", "<leader>vra", function()
				vim.lsp.buf.rename()
			end, {})
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, {})
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, {})
		end,
	},
}
