return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim"
    },

    -- Open
    vim.keymap.set("n", "<space>-", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {desc = "Telescope file browser"})
}
