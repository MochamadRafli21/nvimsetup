local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.configure('gopls', {
  settings = {
    gopls = {
      gofumpt = true
    }
  }
})

lsp.configure('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
})

lsp.configure('jsonls', {
  settings = {
    json = {
      validate = { enable = true },
    }
  }
})

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.configure('rust_analyzer', {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true
      }
    }
  }
})

lsp.configure('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'basic'
      }
    }
  }
})

lsp.configure('tsserver', {
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'pyright',
  'pylsp',
  'gopls',
  'golangci_lint_ls',
  'jsonls',
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  lsp.buffer_autoformat()
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
