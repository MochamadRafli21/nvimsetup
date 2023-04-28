local api = require('nvim-tree.api')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", '<leader>fh', api.tree.toggle_help)
vim.keymap.set("n", '<leader>ft', api.tree.toggle)
vim.keymap.set("n", '<leader>fto', api.tree.focus)
vim.keymap.set("n", '<leader>ftr', api.tree.reload)
