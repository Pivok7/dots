-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Exit terminal mode with Esc
vim.keymap.set({ 't' }, '<Esc>', '<C-\\><C-n>', {silent = true})

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)
vim.keymap.set('i', '<C-s>', '<ESC> <cmd> w <CR>', opts)

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- Select all
vim.keymap.set('v', '<C-a>', 'gg{oG}', opts)

-- Delete single character without copying into register
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Tabs
vim.keymap.set('n', '<Tab>', ':bnext<CR>', {desc = 'Next tab'}, opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', {desc = 'Previus tab'}, opts)
vim.keymap.set('n', '<leader>q', ':Bdelete!<CR>', {desc = 'Close current tab'}, opts)
vim.keymap.set('n', '<leader>n', '<:enew <CR>', {desc = 'Open new tab'}, opts)

-- Open terminal
--vim.keymap.set('n', '<leader>/', '<C-w>s <C-w>k <C-w>_ <C-w>j 12<C-w>+ :terminal <CR>', {desc = 'Open terminal'}, opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', {desc = 'Toggle line wrap'}, opts)

-- Toggle relative numbers
vim.keymap.set('n', '<leader>lr', '<cmd>set relativenumber!<CR>', {desc = 'Toggle relative numbers'}, opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Go to previous diagnostic message'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Go to next diagnostic message'})
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, {desc = 'Open diagnostics list'})

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>dm', function()
    diagnostics_active = not diagnostics_active

    if diagnostics_active then
	vim.diagnostic.enable(0)
    else
	vim.diagnostic.disable(0)
    end
end, { desc = 'Toggle diagnostic messages' })

-- Toggle virtual text

local lsp_lines_active = true
local virtual_text_active = true

local update_virtual_text = function()
    if virtual_text_active then
	vim.diagnostic.config({ virtual_text = not lsp_lines_active })
	vim.diagnostic.config({ virtual_lines = lsp_lines_active })
    else
	vim.diagnostic.config({ virtual_text = false })
	vim.diagnostic.config({ virtual_lines = false })
    end
end

-- Toggle lsp lines plugin

vim.keymap.set('n', '<leader>vl', function()
    lsp_lines_active = not lsp_lines_active
    update_virtual_text()
end, { desc = 'Toggle virtual text modes' })

-- Toggle virtual text

vim.keymap.set('n', '<leader>vt', function()
    virtual_text_active = not virtual_text_active
    update_virtual_text()
end, { desc = 'Toggle virtual text modes' })
