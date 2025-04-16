return {
    {
	-- Lush is required for some themes
	"rktjmp/lush.nvim",
    },
    {
	"zaldih/themery.nvim",
	    lazy = false,
	    config = function()
	    require("themery").setup({

	    themes = {
		"lillilac",
		"biscuit",
		"miasma",
		"lackluster-hack",
		"lackluster-mint",
		"forest-night",
		"forest-serene",
		"forest-day",
		"evangelion",
		"neofusion",
		"kanagawa-wave",
		"kanagawa-dragon",
		"kanagawa-lotus",
		"tokyonight-night",
		"tokyonight-moon",
		"tokyonight-storm",
		"tokyonight-day",
		"rose-pine-main",
		"rose-pine-moon",
		"rose-pine-dawn",
		"peachpuff",
		"zenwritten",
		"neobones",
		"vimbones",
		"rosebones",
		"forestbones",
		"nordbones",
		"tokyobones",
		"seoulbones",
		"duckbones",
		"zenburned",
		"kanagawabones",
		"gruvbox",
		"habamax",
	    },

	    -- Apply theme while picking. Default to true.
	    livePreview = true,
	})
	end
    }
}
