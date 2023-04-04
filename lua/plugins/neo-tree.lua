return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      filtered_items = {
        always_show = {
          "dist",
          "index.html"
        }
      }
    }
  }
}
