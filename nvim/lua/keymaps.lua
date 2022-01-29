local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- setup NvimTree
map("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true })

--Add leader shortcuts
map(
  "n",
  "<leader>sb",
  [[<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<CR>]],
  { noremap = true, silent = true }
)
map(
  "n",
  "<leader>sf",
  [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
  { noremap = true, silent = true }
)
map(
  "n",
  "<leader>sb",
  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
  { noremap = true, silent = true }
)
map("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
map("n", "<leader>st", [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
map("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
map("n", "<leader>sl", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
map(
  "n",
  "<leader>so",
  [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
  { noremap = true, silent = true }
)
map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Enable lazygit
map("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('v', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})
map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })

--Add move line shortcuts
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Move to previous/next
map("n", "<A-,>", ":BufferPrevious<CR>", { noremap = true })
map("n", "<A-.>", ":BufferNext<CR>", { noremap = true })
-- Re-order to previous/next
map("n", "<A-<>", ":BufferMovePrevious<CR>", { noremap = true })
map("n", "<A->>", " :BufferMoveNext<CR>", { noremap = true })
-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<CR>", { noremap = true })
map("n", "<A-2>", ":BufferGoto 2<CR>", { noremap = true })
map("n", "<A-3>", ":BufferGoto 3<CR>", { noremap = true })
map("n", "<A-4>", ":BufferGoto 4<CR>", { noremap = true })
map("n", "<A-5>", ":BufferGoto 5<CR>", { noremap = true })
map("n", "<A-6>", ":BufferGoto 6<CR>", { noremap = true })
map("n", "<A-7>", ":BufferGoto 7<CR>", { noremap = true })
map("n", "<A-8>", ":BufferGoto 8<CR>", { noremap = true })
map("n", "<A-9>", ":BufferGoto 9<CR>", { noremap = true })
map("n", "<A-0>", ":BufferLast<CR>", { noremap = true })
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", { noremap = true })
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>", { noremap = true })
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", { noremap = true })
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", { noremap = true })
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", { noremap = true })

-- LSP Saga
-- map("n", "<Leader>gr", ":lua require('lspsaga.provider').lsp_finder()<CR>", { silent = true })
-- map("n", "<Leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", { silent = true })
-- map("v", "<Leader>ca", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", { silent = true })
-- map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { silent = true })
-- map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
-- map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
-- map("n", "<leader>cs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { silent = true })
-- map("n", "<leader>ci", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", { silent = true })
-- map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
-- map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })
-- map("n", "<leader>gR", "<cmd>lua require('lspsaga.rename').rename()<CR>", { silent = true })
-- map("n", "<leader>gd", "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", { silent = true })
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true })

map("n", "<leader>f", "<cmd> :Format<CR>", { silent = true })

map("n", "<leader>ng", "<cmd>:Neogen<CR>", { silent = true })
