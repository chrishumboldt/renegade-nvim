return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = 6,
          col = "50%",
        },
        border = {
          style = "none",
          padding = { 1, 2 },
        },
        size = {
          width = 80,
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 80,
          height = 10,
        },
        border = {
          style = "none",
          padding = { 1 , 2 },
        },
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
