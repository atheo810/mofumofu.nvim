require("catppuccin").setup({
	options = {
		flavour = "mocha",
		transparent_background = true,
		styles = {
			comments = { "italic" },
		},
		background = {
		light = "latte",
		dark = "mocha",
		},
		term_colors = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = true,
			lsp_trouble = true,
			telescope = true,
			which_key = true,
		},
	},
})


