return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = false,
      integrations = {
        snacks = true,
      },
      custom_highlights = function(colors)
        return {
          -- Snacks Picker highlights.
          SnacksPickerBorder = { bg = colors.surface0, fg = colors.surface0 },
          SnacksPickerInput = { bg = colors.surface0, fg = colors.text },
          SnacksPickerListBorder = { bg = colors.mantle },
          SnacksPickerPreview = { bg = colors.mantle, fg = colors.text },
          SnacksPickerPrompt = { bg = colors.surface0, fg = colors.surface0 },
          SnacksPickerTitle = { bg = colors.pink, fg = colors.mantle },
        }
      end
    })

    vim.cmd.colorscheme "catppuccin"
  end,
}

