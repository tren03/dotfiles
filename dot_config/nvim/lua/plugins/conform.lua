-- Download from mason and then put it here
return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			notify_on_error = false,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially for Go
				-- go = { "goimports", "gofmt" },
				python = {
					"autoflake",
					"black", -- Specify Black as the formatter
					"isort",
					args = { "--fast" }, -- Add --fast argument to speed up Black
				},
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				javascriptreact = { "prettier" }, -- For JSX files
				typescriptreact = { "prettier" }, -- For JSX files
				bash = { "shfmt" },
				sh = { "shfmt" },
				json = { "prettier" },
			},
		})
		-- Keymap to run the formatter with `gf`
		vim.api.nvim_set_keymap("n", "gf", ":lua require('conform').format()<CR>", { noremap = true, silent = true })
	end,
}
