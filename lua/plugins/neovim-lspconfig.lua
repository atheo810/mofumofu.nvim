return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			filetype = { "lua" },
			log_level = 2,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						globals = { "vim" },
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		lspconfig.volar.setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			filetype = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			init_options = {
				vue = {
					hybridMode = false,
				},
			},
		})
	end,
}
