return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      fidget = true,
    }
  },
  config = function()
    local colors = require("catppuccin.palettes").get_palette()
    local CustomColors = {
      NotifyDEBUGBorder = { bg = colors.mantle, fg = colors.mantle },
      NotifyDEBUGBody = { bg = colors.mantle, fg = colors.mantle },
      NotifyERRORBorder = { bg = colors.mantle, fg = colors.mantle },
      NotifyERRORBody = { bg = colors.mantle, fg = colors.mantle },
      NotifyINFOBorder = { bg = colors.mantle, fg = colors.mantle },
      NotifyINFOBody = { bg = colors.mantle, fg = colors.mantle },
      NotifyTRACEBorder = { bg = colors.mantle, fg = colors.mantle },
      NotifyTRACEBody = { bg = colors.mantle, fg = colors.mantle },
      NotifyWARNBorder = { bg = colors.mantle, fg = colors.mantle },
      NotifyWARNBody = { bg = colors.mantle, fg = colors.mantle },

      TelescopeMatching = { fg = colors.flamingo },
      TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopePreviewNormal = { bg = colors.mantle },
      TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
      TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
      TelescopePromptNormal = { bg = colors.surface0 },
      TelescopePromptPrefix = { bg = colors.surface0 },
      TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
      TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
      TelescopeResultsNormal = { bg = colors.mantle },
      TelescopeResultsTitle = { fg = colors.mantle },
      TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
    }

    for hl, col in pairs(CustomColors) do
      vim.api.nvim_set_hl(0, hl, col)
    end

    vim.cmd.colorscheme 'catppuccin'
  end,
}
