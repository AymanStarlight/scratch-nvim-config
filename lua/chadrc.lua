local M = {}

M.base46 = {
	theme = "catppuccin",
}

M.nvdash = {
	load_on_startup = true,

	header = {
		"           ▄ ▄                   ",
		"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
		"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
		"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
		"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
		"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
		"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
		"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
		"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
		"                                 ",
		"                                 ",
	},

	buttons = {
		{ txt = "  Find File", keys = "sf", cmd = "Telescope find_files" },
		{ txt = "  Recent Files", keys = "s.", cmd = "Telescope oldfiles" },
		{ txt = "󰈭  Find Word", keys = "sg", cmd = "Telescope live_grep" },
		{ txt = "󱥚  Themes", keys = "ts", cmd = ":lua require('nvchad.themes').open()" },
		{ txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

		{
			txt = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime) .. " ms"
				return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
			end,
			hl = "NvDashFooter",
			no_gap = true,
		},

		{ txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
	},
}

M.ui = {
	telescope = {
		style = "bordered",
	},
	statusline = {
		theme = "default",
		separator_style = "round",
	},
	cmp = {
		lspkind_text = true,
		style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = true,
		},
		-- lazyload it when there are 1+ buffers
		tabufline = {
			enabled = true,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs", "btns" },
			modules = nil,
			bufwidth = 21,
		},
	},
}

M.term = {
	winopts = { number = false, relativenumber = false },
	sizes = { sp = 0.3, vsp = 0.4, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
	float = {
		relative = "editor",
		row = 0.3,
		col = 0.25,
		width = 1,
		height = 0.6,
		border = "single",
	},
}

M.cheatsheet = {
	excluded_groups = { "autopairs" },
}

return M
