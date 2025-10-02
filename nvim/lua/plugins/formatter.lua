return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
	local conform = require('conform')
	conform.setup({
	    formatters_by_ft = {
		lua = { "stylua", lsp_format = "fallback" },
		rust = { "rustfmt", lsp_format = "fallback" },

		html = { "prettier" },
		css = { "prettier" },
		javascript = {
		    "prettierd",
		    "prettier",
		    stop_after_first = true,
		    lsp_format = "fallback",
		},
	    },
	})

	vim.keymap.set("n", "<leader>ff", function() conform.format() end)
    end
}
