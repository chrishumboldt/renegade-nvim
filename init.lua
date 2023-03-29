-- General keymapping.
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>V", vim.cmd.Ex, { desc = "Exit file to netrw" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Append the next line" })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete and keep yank" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right pane" })
vim.keymap.set("n", "<leader>Q", vim.cmd.qa, { desc = "Quit nvim" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent less" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent more" })
vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeRevealToggle<cr>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>|", "<cmd>vsp<cr>", { desc = "Horizontal pane split" })
vim.keymap.set("n", "<leader>-", "<cmd>sp<cr>", { desc = "Vertical pane split" })
vim.keymap.set("n", "<leader>H", "<cmd>WhichKey<cr>", { desc = "Show key maps" })

-- General options.
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.backup = false
vim.opt.completeopt = "menuone,noselect"
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.mouse = "a"
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Setup packer.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)  
  use "wbthomason/packer.nvim"

  -- Themes.
  use "folke/tokyonight.nvim"

  -- Plugins.
  use "echasnovski/mini.comment"
  use "evanleck/vim-svelte"
  use({
    "folke/noice.nvim",
    requires = { "MunifTanjim/nui.nvim" }
  })
  use {
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  use "folke/which-key.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    "nvim-telescope/telescope.nvim", 
    tag = "0.1.1",
    requires = { "nvim-lua/plenary.nvim" }
  }
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/playground"
  use "othree/html5.vim"
  use "pangloss/vim-javascript"
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      {"neovim/nvim-lspconfig"}, -- Required
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"}, -- Required
      {"hrsh7th/cmp-nvim-lsp"}, -- Required
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-nvim-lua"},

      -- Snippets
      {"L3MON4D3/LuaSnip"}, -- Required
      {"rafamadriz/friendly-snippets"},
    }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Theme.
require("tokyonight").setup({})
vim.cmd[[colorscheme tokyonight]]

-- Plugin setup.
-- Indent blankline.
require("indent_blankline").setup({
    space_char_blankline = " ",
    show_current_context = true,
})

-- Lualine.
require("lualine").setup({
  options = {
    theme = 'tokyonight'
  }
})

-- Mini.
require("mini.comment").setup({})

-- Neo Tree.
require("neo-tree").setup({})

-- Noice.
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  views = {
    notify = {
      render = "minimal",
      top_down = false,
    }
  }
})

-- Telescope.
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find file (git files only)" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent file" })
vim.keymap.set("n", "<leader>fw", builtin.current_buffer_fuzzy_find, { desc = "Find word in current file" })
vim.keymap.set("n", "<leader>fW", builtin.live_grep, { desc = "Find word in project" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help file" })

-- Treesitter.
require("nvim-treesitter.configs").setup({
  ensure_installed = { "help", "javascript", "typescript", "lua", "rust" },
  sync_install = false,
  auto_install = true,

  highlight = {
    additional_vim_regex_highlighting = false,
    enable = true,
  },
})

-- Trouble.
require("trouble").setup({})

-- Which Key.
require("which-key").setup({})

-- LSP. NEEDS to be at the end of the file.
local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  "tsserver",
  "rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure("lua-language-server", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})


local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
cmp_mappings["<C-Space>"] = cmp.mapping.complete()

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
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "Go to definition" })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Show definition" })
  vim.keymap.set("n", "<leader>pd", function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "Open diagnostic" })
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "Code action" })
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "Rename" })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, remap = false, desc = "Definition help" })
  vim.keymap.set('n', '<space>F', function()
    vim.lsp.buf.format { async = true }
  end, { buffer = bufnr, remap = false, desc = "Format file" })
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
