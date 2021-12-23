local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

local use = require("packer").use
return require("packer").startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")
  use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    module = "telescope",
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Themes start
  use("EdenEast/nightfox.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- Themes end
  use("nathom/filetype.nvim")
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("lukas-reineke/indent-blankline.nvim")
  use({ "nvim-treesitter/nvim-treesitter" })
  -- Additional textobjects for treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
  use("williamboman/nvim-lsp-installer")
  use("hrsh7th/nvim-cmp") -- Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip") -- Snippets plugin

  use("tpope/vim-sleuth")
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  })
  use("dstein64/vim-startuptime")
  use("kdheepak/lazygit.nvim")
  use("numtostr/FTerm.nvim")
  use("chaoren/vim-wordmotion")
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use("RRethy/vim-illuminate")
  use("christoomey/vim-system-copy")
  use({ "tami5/lspsaga.nvim", branch = "nvim51" })
  use({ "tpope/vim-surround" })
  use("mhartington/formatter.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
