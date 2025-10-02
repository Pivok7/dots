return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                rust = { "rustfmt", lsp_format = "fallback" },

                html = { "prettier" },
                css = { "prettier" },
                javascript = { "prettier" },
            },
        })

        conform.formatters.stylua = {
            append_args = { "--indent-type", "Spaces", "--indent-width", "4" },
        }

        conform.formatters.prettier = {
            append_args = { "--tab-width", "4" },
        }

        vim.keymap.set("n", "<leader>ff", function()
            conform.format()
        end)
    end,
}
