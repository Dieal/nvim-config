local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1", 
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Basic
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- GUI
  --use "glepnir/dashboard-nvim" -- Cool configurable dashboard
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' }, config = function() require('lualine').setup{} end }

  use "nvim-tree/nvim-web-devicons"

  -- Colorschemes
  use 'Th3Whit3Wolf/one-nvim'
  use "lunarvim/colorschemes"
  use "folke/tokyonight.nvim"
  use "tanvirtin/monokai.nvim"

  -- Utils
  use "mg979/vim-visual-multi" -- Multi cursor plugin
  use { "folke/which-key.nvim", config = function() require("which-key").setup() end } -- Keybindings popup
  use 'tpope/vim-fugitive' -- Git wrapper
  use 'ggandor/lightspeed.nvim'

  -- Files
  use { "nvim-tree/nvim-tree.lua", requires = { 'nvim-tree/nvim-web-devicons' } }  -- File Tree View
  use "jghauser/mkdir.nvim" -- Creates directories when they don't exist (like mkdir -p)
  use "matbme/JABS.nvim" -- Just Another Buffer Switcher is a minimal buffer switcher window for Neovim written.

  -- Surroundings
  use "tpope/vim-surround" -- Quickly delete or change surroundings (brackets, quotes, ecc.)
  use { "terrortylor/nvim-comment", config = function() require("nvim_comment").setup() end } -- Toggle Comments on single / multiple lines
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end } -- Auto pair brackets

  -- LSP
  use "neovim/nvim-lspconfig" -- LSP 
  use "williamboman/mason.nvim" -- LSP Installer
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Building
  use { "stevearc/overseer.nvim", config = function () require('overseer').setup({
      templates = { "builtin", "user.cpp_build" },
  }) end }

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"

  -- Telescope e fzf
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
  use "ibhagwan/fzf-lua"
  use "sharkdp/fd"

  -- Completion
  use "hrsh7th/nvim-cmp" -- Completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Editor Speed
  use "dstein64/vim-startuptime" -- Analize startup time
  -- use "lewis6991/impatient.nvim" -- Makes neovim faster

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
