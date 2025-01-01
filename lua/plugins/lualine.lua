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
			lualine_c = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" }, -- Mengambil info dari LSP
					sections = { "error", "warn", "info", "hint" },
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = " ",
					},
					colored = true, -- Warnai berdasarkan level
					update_in_insert = false, -- Perbarui saat di luar mode insert
				},
			},
		},
		globalstatus = false,
		refresh = {
			status_line = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
}
