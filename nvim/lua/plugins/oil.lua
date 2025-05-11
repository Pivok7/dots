return {
    'stevearc/oil.nvim',
    dependencies = { 'echasnovski/mini.icons' },
    lazy = false,

    config = function()
	require("oil").setup({
	    vim.keymap.set('n', '<leader>-', '<cmd>Oil<CR>', { desc = 'Open oil' }),

	    default_file_explorer = true,
	    delete_to_trash = true,

	    keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
		["<C-s>"] = { "actions.select", opts = { vertical = true } },
		["<C-h>"] = { "actions.select", opts = { horizontal = true } },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-p>"] = "actions.preview",
		["<C-c>"] = { "actions.close", mode = "n" },
		["<C-l>"] = "actions.refresh",
		["-"] = { "actions.parent", mode = "n" },
		["_"] = { "actions.open_cwd", mode = "n" },
		["`"] = { "actions.cd", mode = "n" },
		["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
		["gx"] = "actions.open_external",
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["g\\"] = { "actions.toggle_trash", mode = "n" },
	    },

	    -- Set to false to disable all of the above keymaps
	    use_default_keymaps = true,

	    -- Configuration for the file preview window
	    preview_win = {
		update_on_cursor_moved = true,
		preview_method = "fast_scratch",
	    },
	})
    end
}
