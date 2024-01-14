print("fckem")
vim.g.mapleader = " " -- set leader key. leader needs to be set before lazy
require("heiden.lazy")
require("heiden.remap")
require("heiden.editor-settings")

vim.cmd[[colorscheme rose-pine]]
