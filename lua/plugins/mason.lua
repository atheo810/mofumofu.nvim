return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "volar", "eslint", "ts_ls", "intelephense" }, -- Tambahkan server sesuai kebutuhan
		})
	end,
}
