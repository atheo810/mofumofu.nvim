return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vue", "javascript", "typescript", "html", "css", "lua" },
			highlight = { enable = true },
		})
	end,
}
