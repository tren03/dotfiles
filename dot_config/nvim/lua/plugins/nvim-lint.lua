-- Download from mason and then put it here
return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			go = { "golangcilint" },
		}
		-- Keymap to run the linter with `gl`
        vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua vim.notify("Running linter for current buffer"); require("lint").try_lint()<CR>', { noremap = true, silent = true })
	end,
}
