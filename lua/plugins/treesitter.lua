return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
      "windwp/nvim-ts-autotag",
      opts = { enable_close_on_slash = false }
    },
  },
  event = {
    "BufReadPost",
    "BufNewFile"
  },
  cmd = {
    "TSBufDisable",
    "TSBufEnable",
    "TSBufToggle",
    "TSDisable",
    "TSEnable",
    "TSToggle",
    "TSInstall",
    "TSInstallInfo",
    "TSInstallSync",
    "TSModuleInfo",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
  },
  build = ":TSUpdate",
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treeitter** module to be loaded in time.
    -- Luckily, the only thins that those plugins need are the custom queries, which we make available
    -- during startup.
    -- CODE FROM LazyVim (thanks folke!) https://github.com/LazyVim/LazyVim/commit/1e1b68d633d4bd4faa912ba5f49ab6b8601dc0c9
    require("lazy.core.loader").add_to_rtp(plugin)
    require "nvim-treesitter.query_predicates"
  end,
  opts = function()
    return {
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = {
        additional_vim_regex_highlighting = false,
        enable = true,
        disable = function(_, bufnr) return vim.b[bufnr].large_buf end,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      indent = { enable = true },
    }
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
