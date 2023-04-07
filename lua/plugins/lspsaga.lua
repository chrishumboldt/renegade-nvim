return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      definition = {
        edit = "<CR>",
      },
      scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>"
      },
      symbol_in_winbar = {
        folder_level = 4,
      },
      ui = {
        code_action = "",
        kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
      }
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" }
  }
}
