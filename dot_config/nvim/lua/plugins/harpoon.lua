return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		---@diagnostic disable-next-line: missing-parameter
		harpoon:setup()

		local function map(lhs, rhs, opts)
			vim.keymap.set("n", lhs, rhs, opts or {})
		end
		map("<leader>a", function()
			harpoon:list():add()
		end)
		map("<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		map("<c-h><c-h>", function()
			harpoon:list():select(1)
		end)
		map("<c-j><c-j>", function()
			harpoon:list():select(2)
		end)
		map("<c-k><c-k>", function()
			harpoon:list():select(3)
		end)
		map("<c-l><c-l>", function()
			harpoon:list():select(4)
		end)
	end,
}
