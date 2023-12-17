local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set("n", '<C-p>', builtin.git_files, {})
vim.keymap.set("n", '<leader>fg', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", '<leader>lg', function()
  builtin.live_grep()
end)
vim.keymap.set("n", '<leader>fr', ':cdo s/<C-R>=expand("<cword>")<CR>/<input>/gc', {})
