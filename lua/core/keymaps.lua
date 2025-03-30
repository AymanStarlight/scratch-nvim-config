-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = "test ayman alalalala" })

-- Clear highlights
map('n', '<Esc>', ':noh<CR>', opts)

-- Delete without copying into register
map('n', 'd', '"_d', opts)
map('x', 'd', '"_d', opts)

-- Delete single character without copying into register
map('n', 'x', '"_x', opts)

-- Add a blank line below without switching to Insert mode
map('n', '<leader>o', 'o<Esc>', opts)

-- Vertical scroll and center
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Resize with arrows
map('n', '<Up>', ':resize -2<CR>', opts)
map('n', '<Down>', ':resize +2<CR>', opts)
map('n', '<Left>', ':vertical resize +2<CR>', opts)
map('n', '<Right>', ':vertical resize -2<CR>', opts)

-- Increment/decrement numbers
map('n', '<leader>+', '<C-a>', opts) -- increment
map('n', '<leader>-', '<C-x>', opts) -- decrement

-- Window management
map('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
map('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
map('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
map('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
map('n', '<C-k>', ':wincmd k<CR>', opts)
map('n', '<C-j>', ':wincmd j<CR>', opts)
map('n', '<C-h>', ':wincmd h<CR>', opts)
map('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
map('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
map('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
map('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
map('n', '<leader>tp', ':tabp<CR>', opts)     --  go to previous tab

-- Toggle line wrapping
map('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Press jk fast to exit insert mode
map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)

-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move text up and down
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)

-- Keep last yanked when pasting
map('v', 'p', '"_dP', opts)

-- Replace word under cursor
map('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
map({ 'n', 'v' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])

-- -- Diagnostic keymaps
-- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
