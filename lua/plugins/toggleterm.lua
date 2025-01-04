local toggleterm = require("toggleterm")
toggleterm.setup({
	size = 20,
	open_mapping = [[<leader>t]],
	direction = "float",
	float_opts = {
		border = "curved",
	},
})

