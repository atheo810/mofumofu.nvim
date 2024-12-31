return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		lspconfig.volar.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			filetype = { "typescript", "javascript", "javascriptreat", "typescriptreact", "vue" },
			init_options = {
				vue = {
					hybridMode = false,
				},
			},
		})
	end,
}
