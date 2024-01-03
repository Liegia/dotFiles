vim.g.mapleader = " " --set space to leader
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- in normal mode ("n"), space + p + v, exc :Ex

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("v", "jk", "<Esc>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gb") -- in v mode allows to shift the line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gb")

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- C-d down half a page but the cursor stays 
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv") -- Keeps the search in the middle of the screen
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y") -- leader y now copies to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")


--LSP Zero stuff
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- here you can setup the language servers 
