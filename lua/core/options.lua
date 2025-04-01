local opt = vim.opt
local o = vim.o
local g = vim.g
local api = vim.api

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Highlight when yanking (copying) text
api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Show Nvdash when all buffers are closed
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
			vim.cmd "NvimTreeClose"
    end
  end,
})

-- Enable support for Nerd Font symbols and icons in the UI
g.have_nerd_font = true

-- Show absolute line numbers on the left side of the window
vim.wo.number = true

-- Show relative line numbers to make jumping easier
o.relativenumber = true

-- Enable mouse support in all modes
o.mouse = "a"

-- Keep indentation visually consistent when wrapping lines
o.breakindent = true

-- The number of spaces inserted for each indentation
o.shiftwidth = 2

-- Insert n spaces for a tab
o.tabstop = 2

-- Number of spaces that a tab counts for while performing editing operations
o.softtabstop = 2

-- Save undo history to a file, allowing undo after closing and reopening files
o.undofile = true

-- Make searches case-insensitive unless /C or there's an uppercase letter in the search
o.ignorecase = true

-- Override ignorecase if the search contains uppercase letters
o.smartcase = true

-- Keep the sign column (used for git signs, diagnostics, etc.) always visible
vim.wo.signcolumn = "yes"

-- Reduce the time (in ms) before the swap file is written and CursorHold events trigger
o.updatetime = 250

-- Time to wait (in ms) for a mapped key sequence to complete before timing out
o.timeoutlen = 300

-- Prevent line wrapping from splitting words
o.linebreak = true

-- Keep at least 10 lines of context above and below the cursor
o.scrolloff = 10

-- Automatically adjust indentation based on syntax and code structure
o.smartindent = true

-- Don't show the mode (e.g., -- INSERT --) since the status line usually shows it
o.showmode = false

-- Only show one global statusline
o.laststatus = 3

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
opt.confirm = true
