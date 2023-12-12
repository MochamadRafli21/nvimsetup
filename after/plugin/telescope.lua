local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set("n", '<C-p>', builtin.git_files, {})
vim.keymap.set("n", '<leader>fg', function()
  builtin.grep_string()
end)
vim.keymap.set("n", '<leader>lg', function()
  builtin.live_grep()
end)
