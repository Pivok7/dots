return {
    {
        'mason-org/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
	"mason-org/mason-lspconfig.nvim",
	opts = {
	    ensure_installed = {
		"lua_ls",
	    },
	},
    },
    {
	"neovim/nvim-lspconfig",
    },
}
