return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = {
        left = "",
        right = "/"
      },
      globalstatus = true,
      icons_enabled = false,
      -- section_separators = { right = "", left = "" },
      section_separators = { right = "", left = "" },
      -- theme = "catppuccin",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "%f" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" }
    },
  },
}
