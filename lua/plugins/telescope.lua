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

      -- See `:help telescope.builtin`
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recently opened files' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
      vim.keymap.set("n", "<leader>fw", builtin.current_buffer_fuzzy_find, { desc = "Find word in current file" })
      vim.keymap.set('n', '<leader>fW', builtin.live_grep, { desc = 'Find word in project' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find in diagnostics' })
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
