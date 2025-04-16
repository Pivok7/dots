return {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",

    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },

    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	},
	config = function()
	    local cmp = require("cmp")
	    local luasnip = require("luasnip")

	    require("luasnip.loaders.from_vscode").lazy_load()

	    cmp.setup({
		enabled = function()
		    return vim.g.cmptoggle
		end,
		vim.keymap.set("n", "<leader>a", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "Toggle autocompletion" }),
		snippet = {
		    expand = function(args)
			luasnip.lsp_expand(args.body)
		    end
		},
		-- setup how we interact with completion menus and options
		mapping = cmp.mapping.preset.insert({

		    ["<Tab>"] = cmp.mapping.select_next_item(),
		    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
		    ["<C-e>"] = cmp.mapping.abort(),
		    ["<CR>"] = cmp.mapping.confirm({ select = false})

		}),
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' },
		    { name = 'luasnip' },
		    { name = 'buffer' },
		    { name = 'path' }
		})
	    })

	end
    }
}
