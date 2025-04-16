vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.wo.number = true -- Make line numbers default
vim.o.relativenumber = true -- Set relative numbered lines
vim.o.wrap = false -- Display lines as one long line
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.backup = false -- Creates a backup file
vim.o.writebackup = false -- If a file is being edited by another program, it is not allowed to be edited
vim.o.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line
vim.o.linebreak = true -- Companion to wrap don't split words
vim.o.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.o.hlsearch = false -- Set highlight on search (default: true)
vim.o.sidescrolloff = 16 -- Minimal number of screen columns either side of cursor if wrap is `false`
vim.o.numberwidth = 2 -- Set number column width to 2 {default 4}
vim.o.shiftwidth = 4 -- The number of spaces inserted for each indentation
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
vim.o.cursorline = true -- Highlight the current line
-- vim.o.cursorcolumn = True -- highlight the current column
vim.o.swapfile = false -- Creates a swapfile
vim.o.fileencoding = 'utf-8' -- The encoding written to a file
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups
vim.opt.iskeyword:append '-' -- Hyphenated words recognized by searches
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate vim plugins from neovim in case vim still in use

vim.g.cmptoggle = true -- Set cmp autocompletion on as default

vim.diagnostic.config({ virtual_text = true })
