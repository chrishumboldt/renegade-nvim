return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        inc_rename = false,
      },
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
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          size = {
            width = 80,
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        hover = {
          border = {
            padding = { 1, 2 }
          },
          position = {
            row = 2,
            col = 0
          }
        }
      }
    })
  end
}

