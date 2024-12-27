return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		icon_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			status_line = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
		},
		globalstatus = false,
		refresh = {
			status_line = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
}
