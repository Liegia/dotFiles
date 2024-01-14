print("fckem")
vim.g.mapleader = " " -- set leader key. leader needs to be set before lazy
require("heiden.lazy")
require("heiden.remap")
require("heiden.editor-settings")

vim.cmd[[colorscheme rose-pine]]

---- Remove whitespaces on save
--vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--    pattern = {"*"},
--    callback = function(ev)
--        save_cursor = vim.fn.getpos(".")
--        vim.cmd([[%s/\s\+$//e]])
--        vim.fn.setpos(".", save_cursor)
--    end,
--})
