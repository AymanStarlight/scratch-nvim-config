return {
	"nvim-lua/plenary.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},
	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	"nvchad/volt",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		{ -- Add indentation guides even on blank lines
			"lukas-reineke/indent-blankline.nvim",
			-- Enable `lukas-reineke/indent-blankline.nvim`
			-- See `:help ibl`
			main = "ibl",
			opts = {},
		},
	},
	{
		-- autoclose tags
		"windwp/nvim-ts-autotag",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
		opts = {},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "lsp", "indent" }
				end,
			})
		end,
	},
}
