return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"blade-formatter",
				"prettier",
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "volar", "eslint", "ts_ls", "intelephense" }, -- Tambahkan server sesuai kebutuhan
		})
	end,
}
