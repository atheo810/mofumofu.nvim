return {
	"stevearc/conform.nvim",
	config = function()
		-- Konfigurasi conform di sini, jika diperlukan
		require("conform").setup({
			-- Konfigurasi default conform
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				vue = { "prettier" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_format = "fallback",
			},
			notify_on_error = true,
			notify_no_formatters = true,
		})
	end,
}
