return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  }
}
