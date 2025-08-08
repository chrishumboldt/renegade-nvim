return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ["<C-h>"] = "actions.toggle_hidden"
    }
  },
}

