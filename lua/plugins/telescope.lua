return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      -- Enable telescope fzf native, if installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      require("telescope").setup({
        defaults = {
          border = {},
          file_ignore_patterns = { "node_modules" },
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
          },
          layout_strategy = "horizontal",
          prompt_prefix = " ?  ",
          selection_caret = "  ",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable "make" == 1
    end,
  }
}
