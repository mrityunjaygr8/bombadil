local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- local opts = { noremap = true, silent = true }
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)

  local buf_opts = { buffer = 0 }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, buf_opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, buf_opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, buf_opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buf_opts)
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, buf_opts)
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, buf_opts)
  vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", buf_opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, buf_opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, buf_opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
  require("illuminate").on_attach(client)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])
end)
