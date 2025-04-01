-- local map = vim.keymap.set

-- For conciseness
local function mapKey(mode, key, cmd, desc)
	local opts = vim.tbl_extend("force", { noremap = true, silent = true }, desc and { desc = desc } or {})

	vim.keymap.set(mode, key, cmd, opts)
end

-- Toggle comments (requires a commenting plugin like 'Comment.nvim')
mapKey("n", "<leader>/", "gcc", "Toggle comments")
mapKey("v", "<leader>/", "gc", "Toggle comments")

-- Disable the spacebar key's default behavior in Normal and Visual modes
mapKey({ "n", "v" }, "<Space>", "<Nop>", "Disable space key")

-- Clear search highlights by pressing <Esc>
mapKey("n", "<Esc>", ":noh<CR>", "Clear search highlights")

-- Delete without copying into the default register (black hole register)
mapKey("n", "d", '"_d', "Delete without copying")
mapKey("x", "d", '"_d', "Delete selection without copying")

-- Delete single character without copying into register
mapKey("n", "x", '"_x', "Delete character without copying")

-- Add a blank line below without entering Insert mode
mapKey("n", "<leader>o", "o<Esc>", "Add blank line below")

-- Scroll half a page and keep the cursor centered
mapKey("n", "<C-d>", "<C-d>zz", "Scroll down and center")
mapKey("n", "<C-u>", "<C-u>zz", "Scroll up and center")

-- Find next/previous search result and center the screen
mapKey("n", "n", "nzzzv", "Find next and center")
mapKey("n", "N", "Nzzzv", "Find previous and center")

-- Resize split windows using arrow keys
mapKey("n", "<Up>", ":resize -2<CR>", "Decrease window height")
mapKey("n", "<Down>", ":resize +2<CR>", "Increase window height")
mapKey("n", "<Left>", ":vertical resize +2<CR>", "Increase window width")
mapKey("n", "<Right>", ":vertical resize -2<CR>", "Decrease window width")

-- Increment/decrement numbers
mapKey("n", "<leader>+", "<C-a>", "Increment number")
mapKey("n", "<leader>-", "<C-x>", "Decrement number")

-- Window management (split windows and adjust layouts)
mapKey("n", "<leader>vs", "<C-w>v", "Split window vertically")
mapKey("n", "<leader>hs", "<C-w>s", "Split window horizontally")
mapKey("n", "<leader>se", "<C-w>=", "Equalize window sizes")
mapKey("n", "<leader>xs", ":close<CR>", "Close current split window")

-- Navigate between window splits
-- Already set by vim-tmux-navigator
-- mapKey("n", "<C-k>", ":wincmd k<CR>", "Move to window above")
-- mapKey("n", "<C-j>", ":wincmd j<CR>", "Move to window below")
-- mapKey("n", "<C-h>", ":wincmd h<CR>", "Move to window left")
-- mapKey("n", "<C-l>", ":wincmd l<CR>", "Move to window right")
--
-- Move window splits
mapKey("n", "<leader>k", ":wincmd K<CR>", "Move window up")
mapKey("n", "<leader>j", ":wincmd J<CR>", "Move window down")
mapKey("n", "<leader>h", ":wincmd H<CR>", "Move window left")
mapKey("n", "<leader>l", ":wincmd L<CR>", "Move window right")

-- Tab management
mapKey("n", "<leader>to", ":tabnew<CR>", "Open new tab")
mapKey("n", "<leader>tx", ":tabclose<CR>", "Close current tab")
mapKey("n", "<leader>tn", ":tabn<CR>", "Go to next tab")
mapKey("n", "<leader>tp", ":tabp<CR>", "Go to previous tab")

-- Toggle line wrapping
mapKey("n", "<leader>lw", "<cmd>set wrap!<CR>", "Toggle line wrap")

-- Press 'jk' or 'kj' quickly to exit insert mode
mapKey("i", "jk", "<ESC>", "Exit insert mode")
mapKey("i", "kj", "<ESC>", "Exit insert mode")

-- Stay in indent mode when indenting in Visual mode
mapKey("v", "<", "<gv", "Indent left and stay in mode")
mapKey("v", ">", ">gv", "Indent right and stay in mode")

-- Move selected text up and down in Visual mode
mapKey("n", "<A-j>", ":m .+1<CR>==", "Move selected text down")
mapKey("n", "<A-k>", ":m .-2<CR>==", "Move selected text up")

-- Paste without overwriting the clipboard (keep last yanked text)
mapKey("v", "p", '"_dP', "Paste without replacing clipboard")

-- Replace the word under the cursor and enter Insert mode
mapKey("n", "<leader>rw", "*``cgn", "Replace word under cursor")

-- Yank to system clipboard (highlighted text and entire row)
mapKey({ "n", "v" }, "<leader>y", [["+y]], "Yank selection to clipboard")
mapKey("n", "<leader>Y", [["+Y]], "Yank line to clipboard") -- -- diagnostic keymapkeys

-- Nvimtree
mapKey("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", "Nvimtree toggle window")
mapKey("n", "<C-n>", "<cmd>NvimTreeFocus<CR>", "Nvimtree focus window")

-- Tabufline
mapKey("n", "<leader>b", "<cmd>enew<CR>", "buffer new")

mapKey("n", "<tab>", function()
	require("nvchad.tabufline").next()
end, "Buffer goto next")

mapKey("n", "<S-tab>", function()
	require("nvchad.tabufline").prev()
end, "Buffer goto prev")

mapKey("n", "<leader>x", function()
	require("nvchad.tabufline").close_buffer()
end, "Buffer close")

mapKey("n", "<leader>ts", function()
	require("nvchad.themes").open()
end, "telescope nvchad themes")

-- Diagnostics
mapKey("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
mapKey("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
mapKey("n", "<leader>d", vim.diagnostic.open_float, "Open floating diagnostic message")
mapKey("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")
