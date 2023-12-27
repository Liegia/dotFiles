local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() -- ripgrep needs to be installed for this one
	builtin.grep_string({ search = vim.fn.input("Grep > ") });

end)
