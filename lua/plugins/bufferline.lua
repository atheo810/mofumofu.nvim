return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				numbers = "buffer_id", -- Atau "ordinal" atau "none"
				indicator = {
					style = "underline", -- Tampilkan garis di bawah buffer aktif
				},
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				tab_size = 18,
				show_buffer_icons = true, -- Ikon untuk buffer
				show_buffer_close_icons = true,
				show_tab_indicators = true,
				diagnostics = "nvim_lsp", -- Tampilkan info diagnostik dari LSP
				separator_style = "thin", -- Atau "slant", "thick", dll.
			},
		})
	end,
}
