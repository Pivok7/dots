require 'core.options'
require 'core.keymaps'

-- Lazy plugin
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
	error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.lsp.enable({
    'lua-language-server',
    'clangd',
    'zls',
    'rust-analyzer',
    'pyright',
})

require('lazy').setup({
    require 'plugins.colortheme',
    require 'plugins.themery',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.yazi',
    require 'plugins.mason',
    require 'plugins.autocompletion',
    require 'plugins.indent-blankline',
    require 'plugins.alpha',
    require 'plugins.misc',
})

