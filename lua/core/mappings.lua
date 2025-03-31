-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- local map = vim.keymap.set

-- For conciseness
local function map(mode, key, cmd, desc)
	local opts = vim.tbl_extend("force", { noremap = true, silent = true }, desc and { desc = desc } or {})

	vim.keymap.set(mode, key, cmd, opts)
end

-- Toggle comments (requires a commenting plugin like 'Comment.nvim')
map("n", "<leader>/", "gcc", "Toggle comments")
map("v", "<leader>/", "gc", "Toggle comments")

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", "Disable space key")

-- Clear search highlights by pressing <Esc>
map("n", "<Esc>", ":noh<CR>", "Clear search highlights")

-- Delete without copying into the default register (black hole register)
map("n", "d", '"_d', "Delete without copying")
map("x", "d", '"_d', "Delete selection without copying")

-- Delete single character without copying into register
map("n", "x", '"_x', "Delete character without copying")

-- Add a blank line below without entering Insert mode
map("n", "<leader>o", "o<Esc>", "Add blank line below")

-- Scroll half a page and keep the cursor centered
map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center")

-- Find next/previous search result and center the screen
map("n", "n", "nzzzv", "Find next and center")
map("n", "N", "Nzzzv", "Find previous and center")

-- Resize split windows using arrow keys
map("n", "<Up>", ":resize -2<CR>", "Decrease window height")
map("n", "<Down>", ":resize +2<CR>", "Increase window height")
map("n", "<Left>", ":vertical resize +2<CR>", "Increase window width")
map("n", "<Right>", ":vertical resize -2<CR>", "Decrease window width")

-- Increment/decrement numbers
map("n", "<leader>+", "<C-a>", "Increment number")
map("n", "<leader>-", "<C-x>", "Decrement number")

-- Window management (split windows and adjust layouts)
map("n", "<leader>v", "<C-w>v", "Split window vertically")
map("n", "<leader>h", "<C-w>s", "Split window horizontally")
map("n", "<leader>se", "<C-w>=", "Equalize window sizes")
map("n", "<leader>xs", ":close<CR>", "Close current split window")

-- Navigate between window splits
map("n", "<C-k>", ":wincmd k<CR>", "Move to window above")
map("n", "<C-j>", ":wincmd j<CR>", "Move to window below")
map("n", "<C-h>", ":wincmd h<CR>", "Move to window left")
map("n", "<C-l>", ":wincmd l<CR>", "Move to window right")

-- Tab management
map("n", "<leader>to", ":tabnew<CR>", "Open new tab")
map("n", "<leader>tx", ":tabclose<CR>", "Close current tab")
map("n", "<leader>tn", ":tabn<CR>", "Go to next tab")
map("n", "<leader>tp", ":tabp<CR>", "Go to previous tab")

-- Toggle line wrapping
map("n", "<leader>lw", "<cmd>set wrap!<CR>", "Toggle line wrap")

-- Press 'jk' or 'kj' quickly to exit insert mode
map("i", "jk", "<ESC>", "Exit insert mode")
map("i", "kj", "<ESC>", "Exit insert mode")

-- Stay in indent mode when indenting in Visual mode
map("v", "<", "<gv", "Indent left and stay in mode")
map("v", ">", ">gv", "Indent right and stay in mode")

-- Move selected text up and down in Visual mode
map("v", "<A-j>", ":m .+1<CR>==", "Move selected text down")
map("v", "<A-k>", ":m .-2<CR>==", "Move selected text up")

-- Paste without overwriting the clipboard (keep last yanked text)
map("v", "p", '"_dP', "Paste without replacing clipboard")

-- Replace the word under the cursor and enter Insert mode
map("n", "<leader>j", "*``cgn", "Replace word under cursor")

-- Yank to system clipboard (highlighted text and entire row)
map({ "n", "v" }, "<leader>y", [["+y]], "Yank selection to clipboard")
map("n", "<leader>Y", [["+Y]], "Yank line to clipboard") -- -- diagnostic keymaps

-- Tabufline
map("n", "<leader>b", "<cmd>enew<CR>", "buffer new")

map("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, "Buffer goto next")

map("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, "Buffer goto prev")

map("n", "<leader>x", function()
	require("nvchad.tabufline").close_buffer()
end, "Buffer close")

map("n", "<leader>ts", function()
	require("nvchad.themes").open()
end, "telescope nvchad themes")

-- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'go to previous diagnostic message' })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next diagnostic message' })
-- map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'open floating diagnostic message' })
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostics list' })
