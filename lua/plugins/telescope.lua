require('telescope').setup({
	options = {
		defaults = {
			file_ignore_patterns = {
				"node_modules/",
				"%.git/",
			},
		},
	}
})

