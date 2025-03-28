-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable support for Nerd Font symbols and icons in the UI  
vim.g.have_nerd_font = true  

-- Show absolute line numbers on the left side of the window  
vim.wo.number = true  

-- Show relative line numbers to make jumping easier  
vim.o.relativenumber = true  

-- Enable mouse support in all modes  
vim.o.mouse = 'a'

-- Keep indentation visually consistent when wrapping lines  
vim.o.breakindent = true

-- The number of spaces inserted for each indentation
vim.o.shiftwidth = 4

-- Insert n spaces for a tab
vim.o.tabstop = 4

-- Number of spaces that a tab counts for while performing editing operations
vim.o.softtabstop = 4 

-- Save undo history to a file, allowing undo after closing and reopening files  
vim.o.undofile = true  

-- Make searches case-insensitive unless /C or there's an uppercase letter in the search  
vim.o.ignorecase = true  

-- Override ignorecase if the search contains uppercase letters  
vim.o.smartcase = true  

-- Keep the sign column (used for git signs, diagnostics, etc.) always visible  
vim.wo.signcolumn = 'yes'  

-- Reduce the time (in ms) before the swap file is written and CursorHold events trigger  
vim.o.updatetime = 250  

-- Time to wait (in ms) for a mapped key sequence to complete before timing out  
vim.o.timeoutlen = 300  

-- Prevent line wrapping from splitting words  
vim.o.linebreak = true  

-- Keep at least 10 lines of context above and below the cursor  
vim.o.scrolloff = 10

-- Automatically adjust indentation based on syntax and code structure  
vim.o.smartindent = true  

-- Don't show the mode (e.g., -- INSERT --) since the status line usually shows it  
vim.o.showmode = false  

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

