return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
	"MunifTanjim/nui.nvim",
    },

    config = function ()
    vim.fn.sign_define("DiagnosticSignError",
    {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
    {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
    {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
    {text = "󰌵", texthl = "DiagnosticSignHint"})

    require("neo-tree").setup({
	close_if_last_window = true,
	popup_border_style = "rounded",
	enable_diagnostics = true,
	sort_case_insensitive = false,

	window = {
	    -- width = 30,
	    mappings = {
	    --keymaps here
	    }
	},

	default_component_configs = {
	    container = {
		enable_character_fade = true
	    },
	    icon = {
		folder_closed = "",
		folder_open = "",
		folder_empty = "󰜌",

		default = "*",
		highlight = "NeoTreeFileIcon"
	    },
	    modified = {
		symbol = "[+]",
		highlight = "NeoTreeModified",
	    },
	    name = {
		trailing_slash = false,
		use_git_status_colors = true,
		highlight = "NeoTreeFileName",
	    },
	},
    })

    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    vim.keymap.set('n', '<leader>e', ':Neotree toggle float<CR>', {noremap = true, desc = 'Toggle neotree'})

    end
}
