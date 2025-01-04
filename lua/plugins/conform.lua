local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		blade = { "blade" },
		vue = { "prettier" },
	},
    format_on_save = {
		timeout_ms = 500,
        lsp_fallback = true,
    },
	format_after_save = {
		lsp_format = "fallback",
	},
	notify_on_error = true,
	notify_no_formatters = true,
})