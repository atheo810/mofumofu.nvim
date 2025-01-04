require("bufferline").setup({
	options = {
		numbers = "buffer_id",
		indicator = {
			style = "underline",
		},
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		-- tab_size = 18, -- Perhatikan ini, mungkin tidak berpengaruh
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_tab_indicators = true,
		diagnostics = "nvim_lsp",
		separator_style = "thin",
	},
})
