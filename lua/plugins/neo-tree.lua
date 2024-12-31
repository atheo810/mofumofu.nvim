return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	depedencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = true,
		window = {
			position = "left",
			width = 30,
		},
	},
}
