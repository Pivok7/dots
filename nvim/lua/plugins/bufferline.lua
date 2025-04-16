return {
    'akinsho/bufferline.nvim',
    dependencies = {
	'moll/vim-bbye',
	'nvim-tree/nvim-web-devicons',
    },

    config = function()
    require('bufferline').setup {
	options = {
	    always_show_bufferline = true,
	    themable = true,
	    buffer_close_icon = '',
	    modified_icon = '●',
	    icon_pinned = '󰐃',
	},
	highlights = {
	    separator = {
		fg = '#434C5E',
	    },
		buffer_selected = {
		bold = true,
	    },
	},
    }

    end,
}
